module.exports = async (req, res) => {
  const { default: fetch } = await import('node-fetch');

  const { GITHUB_TOKEN, REPO_OWNER, REPO_NAME } = process.env;
  const workflowRunsUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runs`;
  const dispatchUrl = `https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/dispatches`;

  const runsResponse = await fetch(workflowRunsUrl, {
    headers: {
      'Authorization': `token ${GITHUB_TOKEN}`,
      'Accept': 'application/vnd.github.v3+json'
    }
  });

  const runsData = await runsResponse.json();
  const inProgressRun = runsData.workflow_runs.find(run => run.status === 'in_progress');

  if (!inProgressRun) {
    await fetch(dispatchUrl, {
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
  }

  res.status(200).send('Workflow handled.');
};
