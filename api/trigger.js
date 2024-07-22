const fetch = require('node-fetch');

module.exports = async (req, res) => {
  const { GITHUB_TOKEN, REPO_OWNER, REPO_NAME } = process.env;

  const workflowRunsUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runs`;

  const runsResponse = await fetch(workflowRunsUrl, {
    headers: {
      'Authorization': `token ${GITHUB_TOKEN}`,
      'Accept': 'application/vnd.github.v3+json'
    }
  });

  if (!runsResponse.ok) {
    res.status(runsResponse.status).send('Failed to fetch workflow runs');
    return;
  }

  const runsData = await runsResponse.json();

  const inProgressRun = runsData.workflow_runs.find(run => run.status === 'in_progress' && run.head_branch === 'vercel');

  if (inProgressRun) {
    res.status(200).send('A workflow run is already in progress on the vercel branch. No new run triggered.');
    return;
  }

  const dispatchUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/dispatches`;

  const payload = {
    event_type: 'custom-event',
    client_payload: {
      branch: 'vercel'
    }
  };

  const dispatchResponse = await fetch(dispatchUrl, {
    method: 'POST',
    headers: {
      'Authorization': `token ${GITHUB_TOKEN}`,
      'Accept': 'application/vnd.github.v3+json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(payload)
  });

  if (dispatchResponse.ok) {
    res.status(200).send('Workflow triggered successfully!');
  } else {
    res.status(dispatchResponse.status).send('Failed to trigger workflow');
  }
};
