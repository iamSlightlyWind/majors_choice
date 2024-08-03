# Major's Choice

A project focused on DevOps automation and auto-deployment of a professional e-commerce platform for computer components.

## Trigger GitHub Action

[![Deploy Server](https://img.shields.io/badge/Deploy%20Server-blue)](https://themajorones-deploy-choice.vercel.app/api/trigger)

Everyone can test the website at https://choice.themajorones.dev by pressing the "Deploy Server" button.
> [!NOTE]  
> The server takes up to 3 minutes to deploy, and will not start again unless the previous run has expired (1 hour, configurable in workflow).

## Project Overview

The rough idea is to sell the latest generations of PC parts, including the most basic components used to build a PC: CPU, GPU, RAM, SSD, PSU, and case. The website will list the most common and popular PC hardware from the last three generations. Optional features of the website will be a "build your PC" feature that checks for parts compatibility and a comparison feature that compares two hardware components from the same category for performance and price-to-performance ratio.

## Proof of concept

While the backend seems simple enough, having the server run on the open web is an order of magnitude more knowledge than I currently have. What I have in mind is to use GitHub Runner to run the server, ideally by running a Docker image I created so that it doesn't have to restart every time I boot it up. Alternatively, I could run it on GitHub Codespace, which, if I understand correctly, is similar to GitHub Runner but provides GUI access to a port forwarding terminal. This will have to be successfully tested working before starting the project.

**Remote Server Workflow:**

- [X] Proof of concept for running a Tomcat server (merged).
- [X] Proof of concept for running an MSSQL server (merged).
- [X] Proof of concept for deploying to Tomcat server (merged).
- [X] Proof of concept for deploying to the open Web (merged).

## Hardware Validation

This feature ensures the compatibility of the selected components. Here are the checks performed:

| Situation                  | Case                           | Suggestion                                                       |
| -------------------------- | ------------------------------ | ---------------------------------------------------------------- |
| CPU & Motherboard Socket   | Sockets match                  |                                                                  |
|                            | Sockets mismatch               | Change CPU or Motherboard.                                       |
| Integrated GPU             | GPU selected                   |                                                                  |
|                            | iGPU supported by both, no GPU | Consider discrete GPU for better performance.                    |
|                            | iGPU supported by one, no GPU  | Replace the non-supporting component or consider a discrete GPU. |
|                            | iGPU unsupported, no GPU       | Add discrete GPU or choose iGPU supporting CPU/Motherboard.      |
| RAM Type                   | Supported by Motherboard       |                                                                  |
|                            | Unsupported by Motherboard     | Choose compatible RAM type.                                      |
| RAM Speed with Motherboard | Supported                      |                                                                  |
|                            | Faster than max                | Ram will be underclocked. Consider different RAM or Motherboard  |
| RAM Speed Matching         | Speeds match                   |                                                                  |
|                            | Speeds mismatch                | Use matching speed RAM sticks.                                   |
| RAM Capacity               | Supported by Motherboard       |                                                                  |
|                            | Unsupported by Motherboard     | Reduce RAM capacity to maximum supported.                        |
| RAM Slots                  | Enough slots                   |                                                                  |
|                            | Insufficient slots             | Reduce RAM sticks or choose another Motherboard.                 |
| PSU TDP                    | TDP > CPU + GPU TDPs + 30%     |                                                                  |
|                            | TDP <= CPU + GPU TDPs + 30%    | Choose higher TDP PSU.                                           |
