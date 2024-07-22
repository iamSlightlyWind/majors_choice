const axios = require('axios');

module.exports = async (req, res) => {
  const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
  const owner = 'iamSlightlyWind';
  const repo = 'majors_choice';
  const workflow_id = 'start-server.yml';
  const branch = 'vercel';

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