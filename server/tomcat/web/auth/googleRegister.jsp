<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AuthRegisterGoogle - Major's Choice</title>
    <meta property="og:title" content="AuthRegisterGoogle - Major's Choice" />
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
  </head>
  <body>
    <link rel="stylesheet" href="../css/style.css" />
    <div>
      <link href="../css/auth-register-google.css" rel="stylesheet" />

      <div class="auth-register-google-container">
        <div class="auth-register-google-header">
          <div class="navlogout-container navlogout-root-class-name3">
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
        <div class="auth-register-google-body">
          <div
            class="register-by-gg-container thq-section-padding register-by-gg-root-class-name"
          >
            <div class="register-by-gg-form-root">
              <div class="register-by-gg-form">
                <h1 class="register-by-gg-text">Register with Google</h1>
                <form class="register-by-gg-form1" action="/auth/googleLogin" method="post" id="registerForm">
                  <div class="register-by-gg-full-name">
                    <label for="thq-sign-in-1-password" class="thq-body-large">
                      <span>Full Name</span>
                      <br />
                    </label>
                    <input
                      type="text"
                      required="true"
                      name="fullName"
                      placeholder="Full Name"
                      class="register-by-gg-textinput thq-input thq-body-large"
                    />
                  </div>
                  <div class="register-by-gg-email">
                    <label for="thq-sign-in-1-password" class="thq-body-large">
                      <span>Email</span>
                      <br />
                    </label>
                    <input
                      type="email"
                      id="thq-sign-in-3-email"
                      name="email"
                      readonly value="${gmail}"
                      placeholder="Email"
                      class="register-by-gg-textinput1 thq-input thq-body-large"
                    />
                  </div>
                  <div class="register-by-gg-phone">
                    <label for="thq-sign-in-1-password" class="thq-body-large">
                      <span>Phone</span>
                      <br />
                    </label>
                    <input
                      type="tel"
                      name="phoneNumber"
                      required="true"
                      placeholder="Phone"
                      class="register-by-gg-textinput2 thq-input thq-body-large"
                    />
                  </div>
                  <div class="register-by-gg-address">
                    <label for="thq-sign-in-1-password" class="thq-body-large">
                      <span>Address</span>
                      <br />
                    </label>
                    <input
                      type="text"
                      name="address"
                      required="true"
                      placeholder="Address"
                      class="register-by-gg-textinput3 thq-input thq-body-large"
                    />
                  </div>
                  <div class="register-by-gg-date-of-birth">
                    <label for="thq-sign-in-1-password" class="thq-body-large">
                      <span>Date Of Birth</span>
                      <br />
                    </label>
                    <input
                      type="date"
                      name="dateOfBirth"
                      required="true"
                      placeholder="Registered email"
                      class="register-by-gg-textinput4 thq-input thq-body-large"
                    />
                  </div>
                  <p>${registerStatus}</p>
                  <button
                    type="submit" name="action" value="Update Information"
                    class="register-by-gg-button thq-button-filled"
                  >
                    <span class="register-by-gg-text16 thq-body-small">
                      <span>Update Information</span>
                    </span>
                  </button>
                  <span class="register-by-gg-text17">
                    <span>
                      Please enter the remaining information to continue
                    </span>
                  </span>
                </form>
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
</html>

