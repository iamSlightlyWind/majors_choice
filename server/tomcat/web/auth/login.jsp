<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>Login - Major's Choice</title>
    <meta property="og:title" content="Login - Major's Choice" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {
        line-height: 1.15;
      }

      body {
        margin: 0;
      }

      * {
        box-sizing: border-box;
        border-width: 0;
        border-style: solid;
      }

      p,
      li,
      ul,
      pre,
      div,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      figure,
      blockquote,
      figcaption {
        margin: 0;
        padding: 0;
      }

      button {
        background-color: transparent;
      }

      button,
      input,
      optgroup,
      select,
      textarea {
        font-family: inherit;
        font-size: 100%;
        line-height: 1.15;
        margin: 0;
      }

      button,
      select {
        text-transform: none;
      }

      button,
      [type="button"],
      [type="reset"],
      [type="submit"] {
        -webkit-appearance: button;
      }

      button::-moz-focus-inner,
      [type="button"]::-moz-focus-inner,
      [type="reset"]::-moz-focus-inner,
      [type="submit"]::-moz-focus-inner {
        border-style: none;
        padding: 0;
      }

      button:-moz-focus,
      [type="button"]:-moz-focus,
      [type="reset"]:-moz-focus,
      [type="submit"]:-moz-focus {
        outline: 1px dotted ButtonText;
      }

      a {
        color: inherit;
        text-decoration: inherit;
      }

      input {
        padding: 2px 4px;
      }

      img {
        display: block;
      }

      html {
        scroll-behavior: smooth
      }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style: normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-theme-neutral-dark);
        background-color: var(--dl-color-theme-neutral-light);

        fill: var(--dl-color-theme-neutral-dark);
      }
    </style>
    <link rel="stylesheet" href="https://unpkg.com/animate.css@4.1.1/animate.css" />
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
      data-tag="font" />
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font" />
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font" />
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
      data-tag="font" />
    <link rel="stylesheet" href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css" />
    <style>
      [data-thq="thq-dropdown"]:hover>[data-thq="thq-dropdown-list"] {
        display: flex;
      }

      [data-thq="thq-dropdown"]:hover>div [data-thq="thq-dropdown-arrow"] {
        transform: rotate(90deg);
      }
    </style>
  </head>

  <body>
    <link rel="stylesheet" href="../css/style.css" />
    <div>
      <link href="../css/login.css" rel="stylesheet" />

      <div class="login-container">
        <div class="login-header">
          <div class="navbar-container navbar-root-class-name1">
            <div class="navbar-container1"></div>
            <header class="navbar-container2">
              <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                <img alt="pastedImage" src="../css/image/logo.png" class="navbar-pasted-image" />
                <div data-thq="thq-navbar-nav" class="navbar-desktop-menu">
                  <nav class="navbar-links">
                    <div class="navbar-container3">
                      <input type="text" placeholder="Search product by name" class="navbar-textinput input" />
                      <button class="navbar-search thq-button-filled">
                        <span class="navbar-text thq-body-small">
                          <span>Search</span>
                          <br />
                        </span>
                      </button>
                    </div>
                    <div class="navbar-container4">
                      <a href="home-page.html" class="navbar-home thq-body-small thq-link">
                        <span>Home</span>
                      </a>
                      <span class="navbar-contact thq-body-small thq-link">
                        <span>Contact</span>
                      </span>
                      <span class="navbar-whoweare thq-body-small thq-link">
                        <span>Who we are</span>
                      </span>
                      <span class="navbar-manager-order thq-body-small thq-link">
                        Manager Order
                      </span>
                    </div>
                  </nav>
                  <div class="navbar-buttons">
                    <svg viewBox="0 0 1024 1024" class="navbar-icon thq-button-icon thq-icon-medium">
                      <path
                        d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                      </path>
                    </svg><svg viewBox="0 0 1024 1024" class="navbar-icon02 thq-button-icon thq-icon-medium">
                      <path
                        d="M768 682l86 86v42h-684v-42l86-86v-212q0-100 51-174t141-96v-30q0-26 18-45t46-19 46 19 18 45v30q90 22 141 96t51 174v212zM512 938q-36 0-61-24t-25-60h172q0 34-26 59t-60 25z">
                      </path>
                    </svg>
                    <a href="/auth/login.jsp" class="navbar-account thq-button-filled">
                      <svg viewBox="0 0 731.4285714285713 1024" class="navbar-icon04">
                        <path
                          d="M731.429 799.429c0 83.429-54.857 151.429-121.714 151.429h-488c-66.857 0-121.714-68-121.714-151.429 0-150.286 37.143-324 186.857-324 46.286 45.143 109.143 73.143 178.857 73.143s132.571-28 178.857-73.143c149.714 0 186.857 173.714 186.857 324zM585.143 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z">
                        </path>
                      </svg>
                    </a>
                  </div>
                </div>
                <div data-thq="thq-burger-menu" class="navbar-burger-menu">
                  <svg viewBox="0 0 1024 1024" class="navbar-icon06">
                    <path
                      d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z">
                    </path>
                  </svg>
                </div>
                <div data-thq="thq-mobile-menu" class="navbar-mobile-menu">
                  <div class="navbar-nav">
                    <div class="navbar-top">
                      <div class="navbar-container5">
                        <img alt="pastedImage" src="../css/image/logo.png" class="navbar-pasted-image1" />
                      </div>
                      <div data-thq="thq-close-menu" class="navbar-close-menu">
                        <svg viewBox="0 0 1024 1024" class="navbar-icon08">
                          <path
                            d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z">
                          </path>
                        </svg>
                      </div>
                    </div>
                    <nav class="navbar-links1">
                      <div class="navbar-container6">
                        <input type="text" placeholder="Search product by name" class="navbar-textinput1 input" />
                        <button class="navbar-search1 thq-button-filled thq-button-animated">
                          <span class="navbar-text3 thq-body-small">
                            <span>Search</span>
                            <br />
                          </span>
                        </button>
                      </div>
                      <span class="thq-body-small thq-link">
                        <span>Home</span>
                      </span>
                      <span class="thq-body-small thq-link">
                        <span>Contact</span>
                      </span>
                      <span class="thq-body-small thq-link">
                        <span>Who we are</span>
                      </span>
                      <span class="thq-body-small thq-link">
                        <span>Manager Order</span>
                      </span>
                    </nav>
                  </div>
                  <div class="navbar-buttons1"></div>
                </div>
              </header>
            </header>
          </div>
          <div class="menu-function-container menu-function-root-class-name3">
            <div class="menu-function-manager">
              <span class="menu-function-mgt-ware-house text1 thq-link1 thq-body-small">
                <span>Manager WareHouse</span>
              </span>
              <span class="menu-function-mgt-customer text1 thq-link1 thq-body-small">
                Manager Customer
              </span>
              <span class="menu-function-mgt-feebcack text1 thq-link1 thq-body-small">
                <span>Feedback</span>
                <br />
              </span>
              <span class="menu-function-mgt-staff text1 thq-link1 thq-body-small">
                Manager Staff
              </span>
              <span class="menu-function-mgt-report text1 thq-link1 thq-body-small">
                Financial Reports
              </span>
            </div>
          </div>
        </div>
        <div class="login-body">
          <div class="sign-in-container thq-section-padding sign-in-root-class-name1">
            <div class="sign-in-max-width thq-section-max-width">
              <div class="sign-in-form">
                <h2 class="sign-in-text thq-heading-2">
                  Sign in to Major's Choice
                </h2>
                <form class="sign-in-form1" action="/auth/login" method="post">
                <div class="sign-in-email">
                  <label for="thq-sign-in-1-password" class="thq-body-large">
                    Username
                  </label>
                  <input type="text" id="thq-sign-in-3-email" required="true" placeholder="Username" name="user"
                    class="sign-in-textinput thq-input thq-body-large" />
                </div>
                <div class="sign-in-password">
                  <label for="thq-sign-in-3-password" class="thq-body-large">
                    Password
                  </label>
                  <input type="password" name="pass" id="thq-sign-in-3-password" required="true" placeholder="Password"
                    class="sign-in-textinput1 thq-input thq-body-large" />
                  <div class="sign-in-container1">
                    <div class="sign-in-container2">
                      <input type="checkbox" checked="true" class="sign-in-checkbox" />
                      <a href="/auth/recovery.jsp" class="sign-in-text3 thq-body-small">
                        Forgot password
                      </a>
                    </div>
                    <span class="sign-in-text4 thq-body-small">
                      Remember me
                    </span>
                  </div>
                </div>
                <br>
                <p>${loginStatus}</p>
                <br>
                <button type="submit" class="sign-in-button thq-button-filled">
                  <span class="sign-in-text5 thq-body-small">
                    <span>Sign In</span>
                  </span>
                </button>
                </form>
                <div class="sign-in-container3">
                  <button type="submit" class="sign-in-button1 thq-button-filled">
                    <svg viewBox="0 0 1024 1024" class="sign-in-icon">
                      <path
                        d="M522.2 438.8v175.6h290.4c-11.8 75.4-87.8 220.8-290.4 220.8-174.8 0-317.4-144.8-317.4-323.2s142.6-323.2 317.4-323.2c99.4 0 166 42.4 204 79l139-133.8c-89.2-83.6-204.8-134-343-134-283 0-512 229-512 512s229 512 512 512c295.4 0 491.6-207.8 491.6-500.2 0-33.6-3.6-59.2-8-84.8l-483.6-0.2z">
                      </path>
                    </svg>
                    <span class="sign-in-text6 thq-body-small">
                      <span>Login by Google</span>
                    </span>
                  </button>
                </div>
                <div class="sign-in-container4">
                  <div class="sign-in-divider">
                    <div class="sign-in-divider1"></div>
                    <p class="thq-body-large"><span>Or</span></p>
                    <div class="sign-in-divider2"></div>
                  </div>
                  <a href="/auth/register.jsp" class="sign-in-button2 thq-button-outline">
                    <span class="sign-in-text8 thq-body-small">
                      <span>Register</span>
                    </span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
  </body>

  </html>