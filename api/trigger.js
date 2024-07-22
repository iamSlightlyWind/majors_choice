const axios = require('axios');

module.exports = async (req, res) => {
  const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
  const owner = 'iamSlightlyWind';
  const repo = 'majors_choice';
  const workflow_id = 'start-server.yml';
  const branch = 'vercel';

  const workflowsUrl = `https://api.github.com/repos/${owner}/${repo}/actions/runs`;

  const checkRunningWorkflows = async () => {
    try {
      const response = await axios.get(workflowsUrl, {
        headers: {
          Authorization: `token ${GITHUB_TOKEN}`,
          Accept: 'application/vnd.github.v3+json',
        },
      });

      const runningWorkflows = response.data.workflow_runs.filter(
        (run) => run.status === 'in_progress'
      );

      return runningWorkflows.length > 0;
    } catch (error) {
      throw new Error('Failed to check running workflows');
    }
  };

  const triggerWorkflow = async () => {
    const url = `https://api.github.com/repos/${owner}/${repo}/actions/workflows/${workflow_id}/dispatches`;

    try {
      const response = await axios.post(
        url,
        {
          ref: branch,
        },
        {
          headers: {
            Authorization: `token ${GITHUB_TOKEN}`,
            Accept: 'application/vnd.github.v3+json',
          },
        }
      );

      res.status(200).json({ message: 'Workflow triggered successfully', data: response.data });
    } catch (error) {
      res.status(500).json({ message: 'Failed to trigger workflow', error: error.message });
    }
  };

  try {
    const isRunning = await checkRunningWorkflows();
    if (isRunning) {
      res.status(200).json({ message: 'A workflow is already running. No new workflow triggered.' });
    } else {
      await triggerWorkflow();
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};