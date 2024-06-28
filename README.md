# Major's Choice

Major's Choice is a SWP391 project that lists computer components as a website selling them

## Project Overview

The rough idea is to sell the latest generations of PC parts which include the most basic components used to build a PC, namely CPU, GPU, RAM, SSD, PSU, and case. The website will list the most common and popular from the last 3 generations of PC hardware. Optional features of the website will be a build your own PC which checks for parts compatibility and a comparison feature that compares the 2 hardware from the same category for performance and price to performance ratio.

## Proof of concept

While the backend of things seems simple enough, having the server run on the open web is an order of magnitude more knowledge than what I currently have right now. What I have in mind is to have GitHub runner run the server, preferably having it run a docker image that I created, so it doesn't have to start over whenever I boot it up. or even better, have it run on GitHub codespace, if I understand correctly, is the same as GitHub Runner, but I will have GUI access to a port forwarding terminal. This will have to be successfully tested working, as well as deployed to the server before starting the project.

**Remote Server Workflow:**

- [X] Proof of concept for running a Tomcat server (merged).
- [X] Proof of concept for running a MSSQL server (merged).
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
|                            | Unsupported by Motherboard     | Reduce RAM capacity to supported max.                            |
| RAM Slots                  | Enough slots                   |                                                                  |
|                            | Insufficient slots             | Reduce RAM sticks or choose another Motherboard.                 |
| PSU TDP                    | TDP > CPU + GPU TDPs + 30%     |                                                                  |
|                            | TDP <= CPU + GPU TDPs + 30%    | Choose higher TDP PSU.                                           |