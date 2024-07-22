const fetch = require('node-fetch');

module.exports = async (req, res) => {
  try {
    const { GITHUB_TOKEN, REPO_OWNER, REPO_NAME } = process.env;

    if (!GITHUB_TOKEN || !REPO_OWNER || !REPO_NAME) {
      return res.status(500).send('Environment variables not set.');
    }

    const workflowRunsUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runs`;

    const runsResponse = await fetch(workflowRunsUrl, {
      headers: {
        'Authorization': `token ${GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json'
      }
    });

    if (!runsResponse.ok) {
      return res.status(runsResponse.status).send('Failed to fetch workflow runs');
    }

    const runsData = await runsResponse.json();

    const inProgressRun = runsData.workflow_runs.find(run => run.status === 'in_progress');

    if (inProgressRun) {
      return res.status(200).send('A workflow run is already in progress. No new run triggered.');
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
      return res.status(200).send('Workflow triggered successfully!');
    } else {
      return res.status(dispatchResponse.status).send('Failed to trigger workflow');
    }
  } catch (error) {
    return res.status(500).send(`Internal Server Error: ${error.message}`);
  }
};
