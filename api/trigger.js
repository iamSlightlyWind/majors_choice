module.exports = async (req, res) => {
  try {
    const fetch = (await import('node-fetch')).default;

    const { GITHUB_TOKEN, REPO_OWNER, REPO_NAME } = process.env;
    const workflowRunsUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/workflows/start-server.yml/runs`;
    const dispatchUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/dispatches`;

    const runsResponse = await fetch(workflowRunsUrl, {
      headers: {
        'Authorization': `token ${GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json'
      }
    });

    const runsData = await runsResponse.json();
    console.log('GitHub API response for workflow runs:', runsData);

    const dispatchResponse = await fetch(dispatchUrl, {
      method: 'POST',
      headers: {
        'Authorization': `token ${GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github.v3+json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        event_type: 'custom-event',
        client_payload: { branch: 'vercel' }
      })
    });

    const dispatchData = await dispatchResponse.json();
    console.log('GitHub API response for dispatch:', dispatchData);

    if (!dispatchResponse.ok) {
      throw new Error(`GitHub API responded with status ${dispatchResponse.status}`);
    }

    res.status(200).send('Workflow handled.');
  } catch (error) {
    console.error('Error handling workflow:', error);
    res.status(500).send('Internal Server Error');
  }
};