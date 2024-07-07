<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AuthLogin - Major's Choice</title>
    <meta property="og:title" content="AuthLogin - Major's Choice" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-theme-neutral-dark);
        background-color: var(--dl-color-theme-neutral-light);

        fill: var(--dl-color-theme-neutral-dark);
      }
    </style>
    <link
      rel="stylesheet"
      href="https://unpkg.com/animate.css@4.1.1/animate.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css"
    />
    <style>
      [data-thq="thq-dropdown"]:hover > [data-thq="thq-dropdown-list"] {
          display: flex;
        }

        [data-thq="thq-dropdown"]:hover > div [data-thq="thq-dropdown-arrow"] {
          transform: rotate(90deg);
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="../js/recaptchar.js"></script>
  </head>
  <body>
    <link rel="stylesheet" href="../css/style.css" />
    <div>
      <link href="../css/auth-login.css" rel="stylesheet" />

      <div class="auth-login-container">
        <div class="auth-login-header">
          <div class="navlogout-container navlogout-root-class-name">
            <header class="navlogout-container1"></header>
            <header class="navlogout-container2">
              <header
                data-thq="thq-navbar"
                class="navlogout-navbar-interactive"
              >
                <a href="/" class="navlogout-link">
                  <img
                    alt="pastedImage"
                    src="../css/image/logo.png"
                    class="navlogout-pasted-image"
                  />
                </a>
                <div data-thq="thq-navbar-nav" class="navlogout-desktop-menu">
                  <nav class="navlogout-links">
                    <div class="navlogout-container3">
                      <input
                        type="text"
                        placeholder="Search for product"
                        class="navlogout-textinput input"
                      />
                      <button class="navlogout-search thq-button-filled">
                        <span class="navlogout-text thq-body-small">
                          <span>Search</span>
                          <br />
                        </span>
                      </button>
                    </div>
                    <div class="navlogout-container4">
                      <a
                        href="/"
                        class="navlogout-home thq-body-small thq-link"
                      >
                        <span>Home</span>
                      </a>
                      <span class="navlogout-contact thq-body-small thq-link">
                        Contact Us
                      </span>
                      <span class="navlogout-whoweare thq-body-small thq-link">
                        <span>Who we are</span>
                      </span>
                    </div>
                  </nav>
                </div>
                <div data-thq="thq-burger-menu" class="navlogout-burger-menu">
                  <svg viewBox="0 0 1024 1024" class="navlogout-icon">
                    <path
                      d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z"
                    ></path>
                  </svg>
                </div>
                <div data-thq="thq-mobile-menu" class="navlogout-mobile-menu">
                  <div class="navlogout-nav">
                    <div class="navlogout-top">
                      <div class="navlogout-container5">
                        <img
                          alt="pastedImage"
                          src="../css/image/logo.png"
                          class="navlogout-pasted-image1"
                        />
                      </div>
                      <div
                        data-thq="thq-close-menu"
                        class="navlogout-close-menu"
                      >
                        <svg viewBox="0 0 1024 1024" class="navlogout-icon2">
                          <path
                            d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z"
                          ></path>
                        </svg>
                      </div>
                    </div>
                    <nav class="navlogout-links1">
                      <div class="navlogout-container6">
                        <input
                          type="text"
                          placeholder="Search product by name"
                          class="navlogout-textinput1 input"
                        />
                        <button
                          class="navlogout-search1 thq-button-filled thq-button-animated"
                        >
                          <span class="navlogout-text3 thq-body-small">
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
                </div>
              </header>
            </header>
          </div>
        </div>
        <div class="auth-login-body">
          <div
            class="sign-in-container thq-section-padding sign-in-root-class-name1"
          >
            <div class="sign-in-max-width thq-section-max-width">
              <div class="sign-in-form">
                <h2 class="sign-in-text thq-heading-2">
                  Sign in to Major's Choice
                </h2>
                  <form class="sign-in-forml" action="/auth/login" method="post" id="loginForm">
                <div class="sign-in-email">
                  <label for="thq-sign-in-1-password" class="thq-body-large">
                    Username
                  </label>
                  <input
                    type="text"
                    id="thq-sign-in-3-email"
                    name="user"
                    required="true"
                    placeholder="Username"
                    class="sign-in-input thq-input thq-body-large"
                  />
                </div>
                <div class="sign-in-password">
                  <label for="thq-sign-in-3-password" class="thq-body-large">
                    Password
                  </label>
                  <input
                    type="password"
                    id="thq-sign-in-3-password"
                    name="pass"
                    required="true"
                    placeholder="Password"
                    class="sign-in-textinput thq-input thq-body-large"
                  />
                  <div class="sign-in-container1">
                    <div class="sign-in-container2">
                      <input
                        type="checkbox"
                        checked="true"
                        class="sign-in-checkbox"
                      />
                        <a href="/auth/recovery.jsp" class="sign-in-text3 thq-body-small">
                            Forgot password?
                          </a>
                      
                    </div>
                    <span class="sign-in-text4 thq-body-small">
                      Remember me
                    </span>
                  </div>
                </div>
                  <br><!-- comment -->
                  <p>${loginStatus}</p>
                  <br>
                  <div class="g-recaptcha" data-sitekey="6LfNSgoqAAAAAJpL3x4IaYDcH3Sbp8iuQc5AwaXA"></div>
                  <div class="error" style="color:red;"></div>
                  <br>               
                <button type="submit" class="sign-in-button thq-button-filled">
                  <span class="sign-in-text5 thq-body-small">
                    <span>Sign In</span>
                  </span>
                </button>
                  </form>
                <div class="sign-in-container3">
                  <button
                    type="submit"
                    class="sign-in-button1 thq-button-filled"
                  >
                    <svg viewBox="0 0 1024 1024" class="sign-in-icon">
                      <path
                        d="M522.2 438.8v175.6h290.4c-11.8 75.4-87.8 220.8-290.4 220.8-174.8 0-317.4-144.8-317.4-323.2s142.6-323.2 317.4-323.2c99.4 0 166 42.4 204 79l139-133.8c-89.2-83.6-204.8-134-343-134-283 0-512 229-512 512s229 512 512 512c295.4 0 491.6-207.8 491.6-500.2 0-33.6-3.6-59.2-8-84.8l-483.6-0.2z"
                      ></path>
                    </svg>
                    <span class="sign-in-text6 thq-body-small">
                     <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://choice.themajorones.dev/auth/googleLogin&response_type=code
     &client_id=960808694899-61oujrd0icfujs3ds3qmqqu0lb8rtuhv.apps.googleusercontent.com&approval_prompt=force"
                          class="nav-link">Login with Google</a>
                    </span>
                  </button>
                </div>
                <div class="sign-in-container4">
                  <div class="sign-in-divider">
                    <div class="sign-in-divider1"></div>
                    <p class="thq-body-large"><span>Or</span></p>
                    <div class="sign-in-divider2"></div>
                  </div>
                  <a
                    href="/auth/register.jsp" 
                    class="sign-in-button2 thq-button-outline"
                  >
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
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
  <script>
        document.addEventListener("DOMContentLoaded", function() {
            handleFormSubmission("loginForm");
        });
  </script>
</html>

