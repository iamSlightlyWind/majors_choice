const fetch = require('node-fetch');

module.exports = async (req, res) => {
  try {
    const { GITHUB_TOKEN, REPO_OWNER, REPO_NAME } = process.env;

    if (!GITHUB_TOKEN || !REPO_OWNER || !REPO_NAME) {
      console.error('Environment variables not set.');
      return res.status(500).send('Environment variables not set.');
    }

    const workflowRunsUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runs`;
    console.log(`Fetching workflow runs from: ${workflowRunsUrl}`);

    const runsResponse = await fetch(workflowRunsUrl, {
      headers: {
        'Authorization': `token ${GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json'
      }
    });

    if (!runsResponse.ok) {
      console.error(`Failed to fetch workflow runs: ${runsResponse.status}`);
      return res.status(runsResponse.status).send('Failed to fetch workflow runs');
    }

    const runsData = await runsResponse.json();
    console.log('Workflow runs data fetched successfully.');

    const inProgressRun = runsData.workflow_runs.find(run => run.status === 'in_progress');

    if (inProgressRun) {
      console.log('A workflow run is already in progress.');
      return res.status(200).send('A workflow run is already in progress. No new run triggered.');
    }

    const dispatchUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/dispatches`;
    console.log(`Dispatching new workflow to: ${dispatchUrl}`);

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
      console.log('Workflow triggered successfully.');
      return res.status(200).send('Workflow triggered successfully!');
    } else {
      console.error(`Failed to trigger workflow: ${dispatchResponse.status}`);
      return res.status(dispatchResponse.status).send('Failed to trigger workflow');
    }
  } catch (error) {
    console.error(`Internal Server Error: ${error.message}`);
    return res.status(500).send(`Internal Server Error: ${error.message}`);
  }
};