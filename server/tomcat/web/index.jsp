<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <title>Major's Choice</title>
      <meta property="og:title" content="Major's Choice" />
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
          scroll-behavior: smooth;
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
      <link rel="stylesheet" href="./css/style.css" />
      <div>
        <link href="./css/index.css" rel="stylesheet" />

        <div class="home-page-container">
          <header class="home-page-header">
            <div class="navbar-container">
              <div class="navbar-container1"></div>
              <header class="navbar-container2">
                <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                  <img alt="pastedImage" src="./css/image/logo.png" class="navbar-pasted-image" />
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
                        <a href="/" class="navbar-home thq-body-small thq-link">
                          <span>Home</span>
                        </a>
                        <span class="navbar-contact thq-body-small thq-link">
                          <span>Contact</span>
                        </span>
                        <span class="navbar-whoweare thq-body-small thq-link">
                          <span>Who we are</span>
                        </span>
                        <a href="/order">
                          <span class="navbar-manager-order thq-body-small thq-link">
                            Manage Order
                          </span>
                        </a>
                      </div>
                    </nav>
                    <div class="navbar-buttons">
                      <a href="/Cart">
                        <svg viewBox="0 0 1024 1024" class="navbar-icon thq-button-icon thq-icon-medium">
                          <path
                            d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                          </path>
                        </svg>
                      </a>
                      <svg viewBox="0 0 1024 1024" class="navbar-icon02 thq-button-icon thq-icon-medium">
                        <path
                          d="M768 682l86 86v42h-684v-42l86-86v-212q0-100 51-174t141-96v-30q0-26 18-45t46-19 46 19 18 45v30q90 22 141 96t51 174v212zM512 938q-36 0-61-24t-25-60h172q0 34-26 59t-60 25z">
                        </path>
                      </svg>
                      <a href="/profile" class="navbar-account thq-button-filled">
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
                          <img alt="pastedImage" src="./css/image/logo.png" class="navbar-pasted-image1" />
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
                          <span>Manage Order</span>
                        </span>
                      </nav>
                    </div>
                    <div class="navbar-buttons1"></div>
                  </div>
                </header>
              </header>
            </div>
            <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role) || "manager"
              .equals(role)) { %>
              <div class="menu-function-container">
                <div class="menu-function-manager">
                  <span class="menu-function-mgt-ware-house text1 thq-link1 thq-body-small">
                    <span>Manage WareHouse</span>
                  </span>
                  <a href="/manage/profile?actor=user">
                    <span class="menu-function-mgt-customer text1 thq-link1 thq-body-small">
                      Manage Customer
                    </span>
                  </a>
                  <span class="menu-function-mgt-feebcack text1 thq-link1 thq-body-small">
                    <span>Manage Order</span>
                    <br />
                  </span>
                  <a href="/manage/profile?actor=staff">
                    <span class="menu-function-mgt-staff text1 thq-link1 thq-body-small">
                      Manage Staff
                    </span>
                  </a>
                  <span class="menu-function-mgt-report text1 thq-link1 thq-body-small">
                    Financial Reports
                  </span>
                </div>
              </div>
        </div>
        <% } %>
          <div class="home-page-welcome">
            <div class="home-page-container01">
              <div class="home-page-container02">
                <div class="home-page-container03">
                  <h1 class="home-page-text thq-heading-1">
                    Welcome to Major's Choice
                  </h1>
                  <span class="home-page-text001">
                    Your one-stop shop for high-quality computer components
                  </span>
                </div>
                <div class="home-page-container04">
                  <button type="button" class="home-page-button thq-button-filled button shownow">
                    Show Now
                  </button>
                  <button type="button" class="home-page-button1 button thq-button-outline shownow">
                    Who we are
                  </button>
                </div>
              </div>
            </div>
          </div>
          </header>
          <div class="home-page-body">
            <div class="home-page-category-and-best-seller">
              <div class="home-page-list-category">
                <div class="home-page-container05">
                  <h1 class="home-page-text002">Category</h1>
                </div>
                <div data-thq="thq-dropdown" class="home-page-thq-dropdown list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle-cpu">
                    <span class="home-page-text003">
                      <span><a href="/cpusservlet">CPU</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list">
                    <li data-thq="thq-dropdown" class="home-page-dropdown list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle">
                        <span class="home-page-text006 list-item">
                          <span>Processor</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow01">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon02">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list01">
                        <li data-thq="thq-dropdown" class="home-page-dropdown001 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle001">
                            <span class="home-page-text009">ADM Ryzen 5</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow02">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon04">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list02">
                            <li data-thq="thq-dropdown" class="home-page-dropdown002 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle002">
                                <span class="home-page-text010">
                                  <span>5500</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown003 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle003">
                                <span class="home-page-text013">
                                  <span>5600</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown004 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle004">
                            <span class="home-page-text016">
                              ADM Ryzen 7&nbsp;
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow03">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon06">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list03">
                            <li data-thq="thq-dropdown" class="home-page-dropdown005 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle005">
                                <span class="home-page-text017">
                                  <span>5700X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown006 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle006">
                                <span class="home-page-text020">
                                  <span>5800X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown007 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle007">
                                <span class="home-page-text023">
                                  <span>7700X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown008 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle008">
                            <span class="home-page-text026">ADM Ryzen 9</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow04">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon08">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list04">
                            <li data-thq="thq-dropdown" class="home-page-dropdown009 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle009">
                                <span class="home-page-text027">
                                  <span>5900X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown010 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle010">
                                <span class="home-page-text030">
                                  <span>5950X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown011 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle011">
                                <span class="home-page-text033">
                                  <span>7950X</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown012 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle012">
                            <span class="home-page-text036">Intel Core i5</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow05">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon10">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list05">
                            <li data-thq="thq-dropdown" class="home-page-dropdown013 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle013">
                                <span class="home-page-text037">
                                  <span>13600K</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown014 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle014">
                                <span class="home-page-text040">
                                  <span>13600KF</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown015 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle015">
                            <span class="home-page-text043">Intel Core i7</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow06">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon12">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list06">
                            <li data-thq="thq-dropdown" class="home-page-dropdown016 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle016">
                                <span class="home-page-text044">
                                  <span>13700K</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown017 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle017">
                                <span class="home-page-text047">
                                  <span>13700KF</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown018 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle018">
                                <span class="home-page-text050">
                                  <span>14700F</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown019 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle019">
                                <span class="home-page-text053">
                                  <span>14700K</span>
                                  <br />
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown020 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle020">
                            <span class="home-page-text057">Intel Core i9</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow07">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon14">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list07">
                            <li data-thq="thq-dropdown" class="home-page-dropdown021 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle021">
                                <span class="home-page-text058">
                                  <span>13900K</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown022 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle022">
                                <span class="home-page-text061">
                                  <span>13900KF</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown023 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle023">
                                <span class="home-page-text064">
                                  <span>14900F</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown024 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle024">
                                <span class="home-page-text067">
                                  <span>14900K</span>
                                  <br />
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown025 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle025">
                                <span class="home-page-text071">
                                  <span>14900KF</span>
                                  <br />
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown026 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle026">
                        <span class="home-page-text075">
                          <span>Generation</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow08">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon16">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list08">
                        <li data-thq="thq-dropdown" class="home-page-dropdown027 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle027">
                            <span class="home-page-text078">
                              <span>Cezanne</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown028 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle028">
                            <span class="home-page-text081">
                              <span>Vermeer</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown029 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle029">
                            <span class="home-page-text084">
                              <span>Raphael</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown030 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle030">
                            <span class="home-page-text088">Raptor Lake</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown031 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown032 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle031">
                        <span class="home-page-text089">
                          <span>Socket</span>
                          <br />
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow09">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon18">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                              <span>AM4</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                              <span>AM5</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown035 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle034">
                            <span class="home-page-text099">LGA 1700</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown036 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle035">
                        <span class="home-page-text100">
                          <span>Cores</span>
                          <br />
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow10">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon20">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list10">
                        <li data-thq="thq-dropdown" class="home-page-dropdown037 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle036">
                            <span class="home-page-text104">
                              <span>6</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown038 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle037">
                            <span class="home-page-text107">
                              <span>8</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown039 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle038">
                            <span class="home-page-text110">
                              <span>12</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown040 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle039">
                            <span class="home-page-text113">
                              <span>14</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown041 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle040">
                            <span class="home-page-text117">
                              <span>16</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown042 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle041">
                            <span class="home-page-text120">
                              <span>20</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown043 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle042">
                            <span class="home-page-text123">
                              <span>24</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown044 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle043">
                        <span class="home-page-text127">
                          <span>Threads</span>
                          <br />
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow11">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon22">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list11">
                        <li data-thq="thq-dropdown" class="home-page-dropdown045 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle044">
                            <span class="home-page-text131">
                              <span>12</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown046 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle045">
                            <span class="home-page-text134">
                              <span>16</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown047 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle046">
                            <span class="home-page-text137">
                              <span>20</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown048 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle047">
                            <span class="home-page-text140">
                              <span>24</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown049 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle048">
                            <span class="home-page-text143">
                              <span>28</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown050 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle049">
                            <span class="home-page-text146">
                              <span>32</span>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown051 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle050">
                        <span class="home-page-text149">
                          <span>Base Clock</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow12">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon24">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list12">
                        <li data-thq="thq-dropdown" class="home-page-dropdown052 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle051">
                            <span class="home-page-text152">
                              <span>3</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown053 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle052">
                            <span class="home-page-text155">3.2</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown054 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle053">
                            <span class="home-page-text156">3.4</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown055 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle054">
                            <span class="home-page-text157">
                              <span>3.5</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown056 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle055">
                            <span class="home-page-text160">3.6</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown057 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle056">
                            <span class="home-page-text161">3.7</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown058 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle057">
                            <span class="home-page-text162">3.8</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown059 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle058">
                            <span class="home-page-text163">4.5</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown060 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown061 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle059">
                        <span class="home-page-text164">
                          <span>Boost Clock</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow13">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon26">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list13">
                        <li data-thq="thq-dropdown" class="home-page-dropdown062 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle060">
                            <span class="home-page-text167">4.2</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown063 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle061">
                            <span class="home-page-text168">4.6</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown064 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle062">
                            <span class="home-page-text169">4.7</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown065 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle063">
                            <span class="home-page-text170">4.8</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown066 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle064">
                            <span class="home-page-text171">4.9</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown067 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle065">
                            <span class="home-page-text172">5.1</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown068 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle066">
                            <span class="home-page-text173">5.4</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown069 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle067">
                            <span class="home-page-text174">
                              <span>5.5</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown070 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle068">
                            <span class="home-page-text177">
                              <span>5.6</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown071 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle069">
                            <span class="home-page-text180">5.7</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown072 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle070">
                            <span class="home-page-text181">5.8</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown073 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle071">
                            <span class="home-page-text182">
                              <span>6</span>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown074 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle072">
                        <span class="home-page-text185">
                          <span>TDP</span>
                          <br />
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow14">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon28">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list14">
                        <li data-thq="thq-dropdown" class="home-page-dropdown075 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle073">
                            <span class="home-page-text189">
                              <span>65</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown076 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle074">
                            <span class="home-page-text192">
                              <span>105</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown077 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle075">
                            <span class="home-page-text195">
                              <span>125</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown078 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle076">
                            <span class="home-page-text198">
                              <span>170</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown079 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown080 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-gpu list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle077">
                    <span class="home-page-text202">
                      <span><a href="/gpusservlet">GPU</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow15"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon30">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list15">
                    <li data-thq="thq-dropdown" class="home-page-dropdown081 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle078">
                        <span class="home-page-text205 list-item">
                          Graphics Card
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow16">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon32">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list16">
                        <li data-thq="thq-dropdown" class="home-page-dropdown082 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle079">
                            <span class="home-page-text206">AMD Radeon RX</span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow17">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon34">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list17">
                            <li data-thq="thq-dropdown" class="home-page-dropdown083 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle080">
                                <span class="home-page-text207">6600 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown084 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle081">
                                <span class="home-page-text208">6700 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown085 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle082">
                                <span class="home-page-text209">6800 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown086 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle083">
                                <span class="home-page-text210">6900 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown087 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle084">
                                <span class="home-page-text211">7600 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown088 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle085">
                                <span class="home-page-text212">7700 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown089 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle086">
                                <span class="home-page-text213">7800 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown090 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle087">
                                <span class="home-page-text214">7900 XT</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown091 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle088">
                                <span class="home-page-text215">7900 XTX</span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown092 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle089">
                            <span class="home-page-text216">
                              NVIDIA GeForce RTX
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow18">
                              <svg viewBox="0 0 1024 1024" class="home-page-icon36">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list18">
                            <li data-thq="thq-dropdown" class="home-page-dropdown093 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle090">
                                <span class="home-page-text217">
                                  <span>3060</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown094 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle091">
                                <span class="home-page-text220">
                                  <span>3070</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown095 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle092">
                                <span class="home-page-text223">
                                  <span>3080</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown096 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle093">
                                <span class="home-page-text226">
                                  <span>3090</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown097 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle094">
                                <span class="home-page-text229">4060 Ti</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown098 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle095">
                                <span class="home-page-text230">
                                  <span>4070</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown099 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle096">
                                <span class="home-page-text233">4070 Ti</span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown100 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle097">
                                <span class="home-page-text234">
                                  <span>4080</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="home-page-dropdown101 list-item">
                              <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle098">
                                <span class="home-page-text237">
                                  <span>4090</span>
                                  <br />
                                </span>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown102 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown103 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle099">
                        <span class="home-page-text240">
                          <span>Generation</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow19">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon38">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list19">
                        <li data-thq="thq-dropdown" class="home-page-dropdown104 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle100">
                            <span class="home-page-text243">RDNA 2</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown105 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle101">
                            <span class="home-page-text244">RDNA 3</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown106 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle102">
                            <span class="home-page-text245">
                              <span>Ampere</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown107 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle103">
                            <span class="home-page-text248">Ada Lovelace</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown108 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle104">
                        <span class="home-page-text249">
                          <span>VRAM</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow20">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon40">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list20">
                        <li data-thq="thq-dropdown" class="home-page-dropdown109 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle105">
                            <span class="home-page-text252">
                              <span>8</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown110 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle106">
                            <span class="home-page-text255">
                              <span>10</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown111 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle107">
                            <span class="home-page-text258">
                              <span>12</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown112 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle108">
                            <span class="home-page-text261">
                              <span>16</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown113 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle109">
                            <span class="home-page-text264">
                              <span>20</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown114 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle110">
                            <span class="home-page-text267">
                              <span>24</span>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown115 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle111">
                        <span class="home-page-text270">Base Clock</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow21">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon42">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list21">
                        <li data-thq="thq-dropdown" class="home-page-dropdown116 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle112">
                            <span class="home-page-text271">
                              <span>1395</span>
                              <br />
                            </span>
                          </div>
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle113">
                            <span class="home-page-text274">
                              <span>1410</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown117 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle114">
                            <span class="home-page-text277">
                              <span>1440</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown118 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle115">
                            <span class="home-page-text280">
                              <span>1500</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown119 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle116">
                            <span class="home-page-text283">
                              <span>1600</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown120 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle117">
                            <span class="home-page-text286">
                              <span>1700</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown121 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle118">
                            <span class="home-page-text289">
                              <span>1800</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown122 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle119">
                            <span class="home-page-text292">
                              <span>1825</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown123 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle120">
                            <span class="home-page-text295">
                              <span>1900</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown124 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle121">
                            <span class="home-page-text299">
                              <span>1968</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown125 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown126 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle122">
                            <span class="home-page-text302">
                              <span>2100</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown127 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle123">
                            <span class="home-page-text306">
                              <span>2150</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown128 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle124">
                            <span class="home-page-text309">
                              <span>2205</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown129 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle125">
                            <span class="home-page-text313">
                              <span>2235</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown130 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle126">
                            <span class="home-page-text317">
                              <span>2310</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown131 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle127">
                            <span class="home-page-text321">
                              <span>2321</span>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown132 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle128">
                        <span class="home-page-text325">Boost Clock</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow22">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon44">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list22">
                        <li data-thq="thq-dropdown" class="home-page-dropdown133 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle129">
                            <span class="home-page-text326">
                              <span>1665</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown134 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle130">
                            <span class="home-page-text329">
                              <span>1695</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown135 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle131">
                            <span class="home-page-text332">
                              <span>1710</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown136 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle132">
                            <span class="home-page-text335">
                              <span>1725</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown137 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle133">
                            <span class="home-page-text338">
                              <span>2000</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown138 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle134">
                            <span class="home-page-text341">
                              <span>2100</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown139 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle135">
                            <span class="home-page-text344">
                              <span>2200</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown140 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle136">
                            <span class="home-page-text347">
                              <span>2250</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown141 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle137">
                            <span class="home-page-text350">
                              <span>2400</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown142 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle138">
                            <span class="home-page-text353">
                              <span>2450</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown143 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle139">
                            <span class="home-page-text356">
                              <span>2505</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown144 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle140">
                            <span class="home-page-text359">
                              <span>2520</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown145 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle141">
                            <span class="home-page-text362">
                              <span>2581</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown146 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle142">
                            <span class="home-page-text365">
                              <span>2589</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown147 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle143">
                            <span class="home-page-text368">
                              <span>2610</span>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown148 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle144">
                        <span class="home-page-text371">
                          <span>TDP</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow23">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon46">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list23">
                        <li data-thq="thq-dropdown" class="home-page-dropdown149 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle145">
                            <span class="home-page-text374">
                              <span>160</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown150 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle146">
                            <span class="home-page-text377">
                              <span>190</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown151 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle147">
                            <span class="home-page-text380">
                              <span>200</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown152 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle148">
                            <span class="home-page-text383">
                              <span>220</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown153 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle149">
                            <span class="home-page-text386">
                              <span>230</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown154 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle150">
                            <span class="home-page-text389">
                              <span>250</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown155 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle151">
                            <span class="home-page-text392">
                              <span>285</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown156 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle152">
                            <span class="home-page-text395">
                              <span>290</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown157 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle153">
                            <span class="home-page-text398">
                              <span>300</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown158 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle154">
                            <span class="home-page-text401">
                              <span>320</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown159 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle155">
                            <span class="home-page-text404">
                              <span>350</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown160 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle156">
                            <span class="home-page-text407">
                              <span>355</span>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown161 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle157">
                            <span class="home-page-text410">Sub-menu Item</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown162 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown163 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-mobo list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle158">
                    <span class="home-page-text411">
                      <span><a href="/mobosservlet">Mobo</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow24"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon48">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list24">
                    <li data-thq="thq-dropdown" class="home-page-dropdown164 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle159">
                        <span class="home-page-text414 list-item">
                          <span>Socket</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow25">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon50">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list25">
                        <li data-thq="thq-dropdown" class="home-page-dropdown165 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown166 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown167 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown168 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle160">
                        <span class="home-page-text417 list-item">Chipset</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow26">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon52">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list26">
                        <li data-thq="thq-dropdown" class="home-page-dropdown169 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown170 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown171 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown172 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle161">
                        <span class="home-page-text418 list-item">
                          Form Factor
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow27">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon54">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list27">
                        <li data-thq="thq-dropdown" class="home-page-dropdown173 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown174 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown175 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown176 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle162">
                        <span class="home-page-text419 list-item">Ram Type</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow28">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon56">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list28">
                        <li data-thq="thq-dropdown" class="home-page-dropdown177 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown178 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown179 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown180 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle163">
                        <span class="home-page-text420 list-item">
                          Highest RAM Speed
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow29">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon58">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list29">
                        <li data-thq="thq-dropdown" class="home-page-dropdown181 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown182 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown183 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown184 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle164">
                        <span class="home-page-text421">RAM Slots</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown185 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle165">
                        <span class="home-page-text422">WIFI</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown186 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown187 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown188 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown189 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown190 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-psu list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle166">
                    <span class="home-page-text423">
                      <span><a href="/psusservlet">PSU</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow30"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon60">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list30">
                    <li data-thq="thq-dropdown" class="home-page-dropdown191 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle167">
                        <span class="home-page-text426 list-item">Wattage</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow31">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon62">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list31">
                        <li data-thq="thq-dropdown" class="home-page-dropdown192 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle168">
                            <span class="home-page-text427">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown193 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle169">
                            <span class="home-page-text428">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown194 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle170">
                            <span class="home-page-text429">Sub-menu Item</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown195 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle171">
                        <span class="home-page-text430">Efficiency</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown196 list-item">
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list32">
                        <li data-thq="thq-dropdown" class="home-page-dropdown197 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle172">
                            <span class="home-page-text431">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown198 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle173">
                            <span class="home-page-text432">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown199 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle174">
                            <span class="home-page-text433">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown200 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle175"></div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown201 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown202 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-ram list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle176">
                    <span class="home-page-text434">
                      <span><a href="/ramsservlet">RAM</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow32"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon64">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list33">
                    <li data-thq="thq-dropdown" class="home-page-dropdown203 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle177">
                        <span class="home-page-name list-item">Generation</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow33">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon66">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list34">
                        <li data-thq="thq-dropdown" class="home-page-dropdown204 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle178"></div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown205 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown206 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown207 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle179">
                        <span class="home-page-generation list-item">
                          Capacity
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow34">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon68">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list35">
                        <li data-thq="thq-dropdown" class="home-page-dropdown208 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle180"></div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown209 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown210 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown211 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle181">
                        <span class="home-page-text437 list-item">Spped</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow35">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon70">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list36">
                        <li data-thq="thq-dropdown" class="home-page-dropdown212 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle182"></div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown213 list-item"></li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown214 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown215 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle183">
                        <span class="home-page-text438">Latency</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown216 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown217 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown218 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-ssd list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle184">
                    <span class="home-page-text439">
                      <span><a href="/ssdsservlet">SSD</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow36"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon72">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list37">
                    <li data-thq="thq-dropdown" class="home-page-dropdown219 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle185">
                        <span class="home-page-text442 list-item">Inteface</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow37">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon74">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list38">
                        <li data-thq="thq-dropdown" class="home-page-dropdown220 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle186">
                            <span class="home-page-text443">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown221 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle187">
                            <span class="home-page-text444">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown222 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle188">
                            <span class="home-page-text445">Sub-menu Item</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown223 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle189">
                        <span class="home-page-text446">Capacity</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown224 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle190">
                        <span class="home-page-text447">Cache</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown225 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown226 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-case list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle191">
                    <span class="home-page-text448">
                      <span>CASE</span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow38"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon76">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list39">
                    <li data-thq="thq-dropdown" class="home-page-dropdown227 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle192">
                        <span class="home-page-text451 list-item">
                          Sub-menu Item
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow39">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon78">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list40">
                        <li data-thq="thq-dropdown" class="home-page-dropdown228 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle193">
                            <span class="home-page-text452">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown229 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle194">
                            <span class="home-page-text453">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown230 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle195">
                            <span class="home-page-text454">Sub-menu Item</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown231 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle196">
                        <span class="home-page-text455 list-item">
                          Sub-menu Item
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow40">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon80">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list41">
                        <li data-thq="thq-dropdown" class="home-page-dropdown232 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle197">
                            <span class="home-page-text456">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown233 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle198">
                            <span class="home-page-text457">Sub-menu Item</span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown234 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle199">
                            <span class="home-page-text458">Sub-menu Item</span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown235 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle200">
                        <span class="home-page-text459">Sub-menu Item</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown236 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle201">
                        <span class="home-page-text460">Sub-menu Item</span>
                      </div>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown237 list-item"></li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown238 list-item"></li>
                  </ul>
                </div>
              </div>
              <div class="home-page-best-seller">
                <div class="home-page-header1">
                  <h1 class="home-page-text461">Best seller of the month</h1>
                </div>
                <div class="home-page-body1">
                  <div class="home-page-product">
                    <div class="component4-container component4-root-class-name5">
                      <img alt="image" src="./css/image/amd800h.webp" class="component4-image" />
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="component4-link">
                        <span>
                          Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                          5MB / AM4
                        </span>
                      </a>
                      <span class="component4-text">
                        <span class="component4-text1">1.290.000₫</span>
                        <br class="component4-text2" />
                      </span>
                      <div class="component4-container1">
                        <svg viewBox="0 0 1024 1024" class="component4-icon">
                          <path
                            d="M321.008 1024c-68.246-142.008-31.902-223.378 20.55-300.044 57.44-83.956 72.244-167.066 72.244-167.066s45.154 58.7 27.092 150.508c79.772-88.8 94.824-230.28 82.782-284.464 180.314 126.012 257.376 398.856 153.522 601.066 552.372-312.532 137.398-780.172 65.154-832.85 24.082 52.676 28.648 141.85-20 185.126-82.352-312.276-285.972-376.276-285.972-376.276 24.082 161.044-87.296 337.144-194.696 468.73-3.774-64.216-7.782-108.528-41.55-169.98-7.58 116.656-96.732 211.748-120.874 328.628-32.702 158.286 24.496 274.18 241.748 396.622z">
                          </path>
                        </svg>
                        <span class="component4-text3">Đã bán:</span>
                        <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                          class="component4-link1">
                          <span>1000</span>
                          <br />
                        </a>
                      </div>
                    </div>
                    <div class="component4-container component4-root-class-name6">
                      <img alt="image" src="./css/image/amd800h.webp" class="component4-image" />
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="component4-link">
                        <span>
                          Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                          5MB / AM4
                        </span>
                      </a>
                      <span class="component4-text">
                        <span class="component4-text1">1.290.000₫</span>
                        <br class="component4-text2" />
                      </span>
                      <div class="component4-container1">
                        <svg viewBox="0 0 1024 1024" class="component4-icon">
                          <path
                            d="M321.008 1024c-68.246-142.008-31.902-223.378 20.55-300.044 57.44-83.956 72.244-167.066 72.244-167.066s45.154 58.7 27.092 150.508c79.772-88.8 94.824-230.28 82.782-284.464 180.314 126.012 257.376 398.856 153.522 601.066 552.372-312.532 137.398-780.172 65.154-832.85 24.082 52.676 28.648 141.85-20 185.126-82.352-312.276-285.972-376.276-285.972-376.276 24.082 161.044-87.296 337.144-194.696 468.73-3.774-64.216-7.782-108.528-41.55-169.98-7.58 116.656-96.732 211.748-120.874 328.628-32.702 158.286 24.496 274.18 241.748 396.622z">
                          </path>
                        </svg>
                        <span class="component4-text3">Đã bán:</span>
                        <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                          class="component4-link1">
                          <span>1000</span>
                          <br />
                        </a>
                      </div>
                    </div>
                    <div class="component4-container component4-root-class-name7">
                      <img alt="image" src="./css/image/amd800h.webp" class="component4-image" />
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="component4-link">
                        <span>
                          Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                          5MB / AM4
                        </span>
                      </a>
                      <span class="component4-text">
                        <span class="component4-text1">1.290.000₫</span>
                        <br class="component4-text2" />
                      </span>
                      <div class="component4-container1">
                        <svg viewBox="0 0 1024 1024" class="component4-icon">
                          <path
                            d="M321.008 1024c-68.246-142.008-31.902-223.378 20.55-300.044 57.44-83.956 72.244-167.066 72.244-167.066s45.154 58.7 27.092 150.508c79.772-88.8 94.824-230.28 82.782-284.464 180.314 126.012 257.376 398.856 153.522 601.066 552.372-312.532 137.398-780.172 65.154-832.85 24.082 52.676 28.648 141.85-20 185.126-82.352-312.276-285.972-376.276-285.972-376.276 24.082 161.044-87.296 337.144-194.696 468.73-3.774-64.216-7.782-108.528-41.55-169.98-7.58 116.656-96.732 211.748-120.874 328.628-32.702 158.286 24.496 274.18 241.748 396.622z">
                          </path>
                        </svg>
                        <span class="component4-text3">Đã bán:</span>
                        <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                          class="component4-link1">
                          <span>1000</span>
                          <br />
                        </a>
                      </div>
                    </div>
                    <div class="component4-container component4-root-class-name8">
                      <img alt="image" src="./css/image/amd800h.webp" class="component4-image" />
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="component4-link">
                        <span>
                          Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                          5MB / AM4
                        </span>
                      </a>
                      <span class="component4-text">
                        <span class="component4-text1">1.290.000₫</span>
                        <br class="component4-text2" />
                      </span>
                      <div class="component4-container1">
                        <svg viewBox="0 0 1024 1024" class="component4-icon">
                          <path
                            d="M321.008 1024c-68.246-142.008-31.902-223.378 20.55-300.044 57.44-83.956 72.244-167.066 72.244-167.066s45.154 58.7 27.092 150.508c79.772-88.8 94.824-230.28 82.782-284.464 180.314 126.012 257.376 398.856 153.522 601.066 552.372-312.532 137.398-780.172 65.154-832.85 24.082 52.676 28.648 141.85-20 185.126-82.352-312.276-285.972-376.276-285.972-376.276 24.082 161.044-87.296 337.144-194.696 468.73-3.774-64.216-7.782-108.528-41.55-169.98-7.58 116.656-96.732 211.748-120.874 328.628-32.702 158.286 24.496 274.18 241.748 396.622z">
                          </path>
                        </svg>
                        <span class="component4-text3">Đã bán:</span>
                        <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                          class="component4-link1">
                          <span>1000</span>
                          <br />
                        </a>
                      </div>
                    </div>
                    <div class="component4-container component4-root-class-name9">
                      <img alt="image" src="./css/image/amd800h.webp" class="component4-image" />
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="component4-link">
                        <span>
                          Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                          5MB / AM4
                        </span>
                      </a>
                      <span class="component4-text">
                        <span class="component4-text1">1.290.000₫</span>
                        <br class="component4-text2" />
                      </span>
                      <div class="component4-container1">
                        <svg viewBox="0 0 1024 1024" class="component4-icon">
                          <path
                            d="M321.008 1024c-68.246-142.008-31.902-223.378 20.55-300.044 57.44-83.956 72.244-167.066 72.244-167.066s45.154 58.7 27.092 150.508c79.772-88.8 94.824-230.28 82.782-284.464 180.314 126.012 257.376 398.856 153.522 601.066 552.372-312.532 137.398-780.172 65.154-832.85 24.082 52.676 28.648 141.85-20 185.126-82.352-312.276-285.972-376.276-285.972-376.276 24.082 161.044-87.296 337.144-194.696 468.73-3.774-64.216-7.782-108.528-41.55-169.98-7.58 116.656-96.732 211.748-120.874 328.628-32.702 158.286 24.496 274.18 241.748 396.622z">
                          </path>
                        </svg>
                        <span class="component4-text3">Đã bán:</span>
                        <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                          class="component4-link1">
                          <span>1000</span>
                          <br />
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-cpu">
              <div class="home-page-header-cpu">
                <div class="home-page-container06">
                  <h1 class="home-page-text462">
                    <span>CPU</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container07">
                  <a href="view-all-product-cpu.html" class="home-page-navlink thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-cpu">
                <div class="component3-container component3-root-class-name">
                  <div class="component3-container1">
                    <div class="component3-container2">
                      <c:forEach var="cpu" items="${requestScope.cpus}" begin="0" end="4">
                        <div class="component1-container component1-root-class-name4">
                          <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                          <h1 class="component1-text thq-link">
                            <span>
                              <a href="/view/detail/product?category=cpu&id=${cpu.id}">${cpu.name}</a>
                            </span>
                          </h1>
                          <span class="component1-text1">
                              <fmt:formatNumber value="${cpu.sellingPrice}" var="cpuSelling" />
                              <span>${cpuSelling}</span>
                              <br />
                          </span>
                          <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                              class="component1-link">
                              <span>(0 Review)</span>
                            </a>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-gpu">
              <div class="home-page-header-gpu">
                <div class="home-page-container08">
                  <h1 class="home-page-text465">
                    <span>GPU</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container09">
                  <a href="view-all-product-gpu.html" class="home-page-navlink1 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-gpu">
                <div class="component3-container component3-root-class-name1">
                  <div class="component3-container1">
                    <div class="component3-container2">
                      <c:forEach var="gpu" items="${requestScope.gpus}" begin="0" end="4">
                        <div class="component1-container component1-root-class-name4">
                          <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                          <h1 class="component1-text thq-link">
                            <span>
                              <a href="/view/detail/product?category=gpu&id=${gpu.id}">${gpu.name}</a>
                            </span>
                          </h1>
                          <span class="component1-text1">
                              <fmt:formatNumber value="${gpu.sellingPrice}" var="gpuSelling" />
                              <span>${gpuSelling}</span>
                            <br />
                          </span>
                          <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                              class="component1-link">
                              <span>(0 Review)</span>
                            </a>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-mobo">
              <div class="home-page-header-mobo">
                <div class="home-page-container10">
                  <h1 class="home-page-text468">
                    <span>Mobo</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container11">
                  <a href="view-all-product-mobo.html" class="home-page-navlink2 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-mobo">
                <div class="component3-container component3-root-class-name2">
                  <div class="component3-container1">
                    <div class="component3-container2">

                      <c:forEach var="mobo" items="${requestScope.mobos}" begin="0" end="4">
                        <div class="component1-container component1-root-class-name4">
                          <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                          <h1 class="component1-text thq-link">
                            <span>
                              <a href="/view/detail/product?category=mobo&id=${mobo.id}">${mobo.name}</a>
                            </span>
                          </h1>
                          <span class="component1-text1">
                              <fmt:formatNumber value="${mobo.sellingPrice}" var="moboSelling" />
                              <span>${moboSelling}</span>
                            <br />
                          </span>
                          <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                              class="component1-link">
                              <span>(0 Review)</span>
                            </a>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-psu">
              <div class="home-page-header-psu">
                <div class="home-page-container12">
                  <h1 class="home-page-text471">
                    <span>PSU</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container13">
                  <a href="view-all-product-psu.html" class="home-page-navlink3 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-psu">
                <div class="component3-container component3-root-class-name3">
                  <div class="component3-container1">
                    <div class="component3-container2">

                      <c:forEach var="psu" items="${requestScope.psus}" begin="0" end="4">
                        <div class="component1-container component1-root-class-name4">
                          <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                          <h1 class="component1-text thq-link">
                            <span>
                              <a href="/view/detail/product?category=psu&id=${psu.id}">${psu.name}</a>
                            </span>
                          </h1>
                          <span class="component1-text1">
                              <fmt:formatNumber value="${psu.sellingPrice}" var="psuSelling" />
                              <span>${psuSelling}</span>
                            <br />
                          </span>
                          <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                              class="component1-link">
                              <span>(0 Review)</span>
                            </a>
                          </div>
                        </div>
                      </c:forEach>

                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="chats-chats">
              <div class="chats-container">
                <svg viewBox="0 0 1152 1024" class="chats-icon thq-button-icon thq-icon-medium">
                  <path
                    d="M1088 901.166c0 45.5 26.028 84.908 64 104.184v15.938c-10.626 1.454-21.472 2.224-32.5 2.224-68.008 0-129.348-28.528-172.722-74.264-26.222 6.982-54.002 10.752-82.778 10.752-159.058 0-288-114.616-288-256s128.942-256 288-256c159.058 0 288 114.616 288 256 0 55.348-19.764 106.592-53.356 148.466-6.824 14.824-10.644 31.312-10.644 48.7zM512 0c278.458 0 504.992 180.614 511.836 405.52-49.182-21.92-103.586-33.52-159.836-33.52-95.56 0-185.816 33.446-254.138 94.178-70.846 62.972-109.862 147.434-109.862 237.822 0 44.672 9.544 87.888 27.736 127.788-5.228 0.126-10.468 0.212-15.736 0.212-27.156 0-53.81-1.734-79.824-5.044-109.978 109.978-241.25 129.7-368.176 132.596v-26.916c68.536-33.578 128-94.74 128-164.636 0-9.754-0.758-19.33-2.164-28.696-115.796-76.264-189.836-192.754-189.836-323.304 0-229.75 229.23-416 512-416z">
                  </path>
                </svg>
                <span class="chats-text">Chats with support</span>
              </div>
            </div>
            <div class="home-page-ram">
              <div class="home-page-header-ram">
                <div class="home-page-container14">
                  <h1 class="home-page-text474">
                    <span>RAM</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container15">
                  <a href="view-all-product-ram.html" class="home-page-navlink4 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-ram">
                <div class="home-page-container16">
                  <div class="component3-container component3-root-class-name4">
                    <div class="component3-container1">
                      <div class="component3-container2">

                        <c:forEach var="ram" items="${requestScope.rams}" begin="0" end="4">
                          <div class="component1-container component1-root-class-name4">
                            <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                            <h1 class="component1-text thq-link">
                              <span>
                                <a href="/view/detail/product?category=ram&id=${ram.id}">${ram.name}</a>
                              </span>
                            </h1>
                            <span class="component1-text1">
                              <fmt:formatNumber value="${ram.sellingPrice}" var="ramSelling" />
                              <span>${ramSelling}</span>
                              <br />
                            </span>
                            <div class="component1-container1">
                              <span class="component1-text4"><span>0.0</span></span>
                              <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                                <path
                                  d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                </path>
                              </svg>
                              <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                                class="component1-link">
                                <span>(0 Review)</span>
                              </a>
                            </div>
                          </div>
                        </c:forEach>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-ssd">
              <div class="home-page-header-ssd">
                <div class="home-page-container17">
                  <h1 class="home-page-text477">
                    <span>SSD</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container18">
                  <a href="view-all-product-ssd.html" class="home-page-navlink5 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-ssd">
                <div class="component3-container component3-root-class-name5">
                  <div class="component3-container1">
                    <div class="component3-container2">

                      <c:forEach var="ssd" items="${requestScope.ssds}" begin="0" end="4">
                        <div class="component1-container component1-root-class-name4">
                          <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                          <h1 class="component1-text thq-link">
                            <span>
                              <a href="/view/detail/product?category=ssd&id=${ssd.id}">${ssd.name}</a>
                            </span>
                          </h1>
                          <span class="component1-text1">
                            <fmt:formatNumber value="${ssd.sellingPrice}" var="ssdSelling" />
                              <span>${ssdSelling}</span>
                            <br />
                          </span>
                          <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                              class="component1-link">
                              <span>(0 Review)</span>
                            </a>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="home-page-case">
              <div class="home-page-header-case">
                <div class="home-page-container19">
                  <h1 class="home-page-text480">
                    <span>CASE</span>
                    <br />
                  </h1>
                </div>
                <div class="home-page-container20">
                  <a href="view-all-product-case.html" class="home-page-navlink6 thq-link">
                    View all product
                  </a>
                </div>
              </div>
              <div class="home-page-body-case">
                <div class="component3-container component3-root-class-name6">
                  <div class="component3-container1">
                    <div class="component3-container2">
                      <div class="component1-container component1-root-class-name4">
                        <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                        <h1 class="component1-text thq-link">
                          <span>
                            Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng
                            / 5MB / AM4
                          </span>
                        </h1>
                        <span class="component1-text1">
                          <span>1.290.000₫</span>
                          <br />
                        </span>
                        <div class="component1-container1">
                          <span class="component1-text4"><span>0.0</span></span>
                          <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                            <path
                              d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                            </path>
                          </svg>
                          <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                            class="component1-link">
                            <span>(0 Review)</span>
                          </a>
                        </div>
                      </div>
                      <div class="component1-container component1-root-class-name5">
                        <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                        <h1 class="component1-text thq-link">
                          <span>
                            Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng
                            / 5MB / AM4
                          </span>
                        </h1>
                        <span class="component1-text1">
                          <span>1.290.000₫</span>
                          <br />
                        </span>
                        <div class="component1-container1">
                          <span class="component1-text4"><span>0.0</span></span>
                          <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                            <path
                              d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                            </path>
                          </svg>
                          <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                            class="component1-link">
                            <span>(0 Review)</span>
                          </a>
                        </div>
                      </div>
                      <div class="component1-container component1-root-class-name6">
                        <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                        <h1 class="component1-text thq-link">
                          <span>
                            Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng
                            / 5MB / AM4
                          </span>
                        </h1>
                        <span class="component1-text1">
                          <span>1.290.000₫</span>
                          <br />
                        </span>
                        <div class="component1-container1">
                          <span class="component1-text4"><span>0.0</span></span>
                          <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                            <path
                              d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                            </path>
                          </svg>
                          <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                            class="component1-link">
                            <span>(0 Review)</span>
                          </a>
                        </div>
                      </div>
                      <div class="component1-container component1-root-class-name7">
                        <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                        <h1 class="component1-text thq-link">
                          <span>
                            Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng
                            / 5MB / AM4
                          </span>
                        </h1>
                        <span class="component1-text1">
                          <span>1.290.000₫</span>
                          <br />
                        </span>
                        <div class="component1-container1">
                          <span class="component1-text4"><span>0.0</span></span>
                          <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                            <path
                              d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                            </path>
                          </svg>
                          <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                            class="component1-link">
                            <span>(0 Review)</span>
                          </a>
                        </div>
                      </div>
                      <div class="component1-container component1-root-class-name92">
                        <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                        <h1 class="component1-text thq-link">
                          <span>
                            Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng
                            / 5MB / AM4
                          </span>
                        </h1>
                        <span class="component1-text1">
                          <span>1.290.000₫</span>
                          <br />
                        </span>
                        <div class="component1-container1">
                          <span class="component1-text4"><span>0.0</span></span>
                          <svg viewBox="0 0 950.8571428571428 1024" class="component1-icon">
                            <path
                              d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                            </path>
                          </svg>
                          <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                            class="component1-link">
                            <span>(0 Review)</span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <footer class="home-page-footer">
            <footer class="footer-footer1 thq-section-padding footer-root-class-name3">
              <div class="footer-max-width thq-section-max-width">
                <div class="footer-content">
                  <div class="footer-newsletter">
                    <div class="footer-container">
                      <h1><span>Major's Choice</span></h1>
                    </div>
                    <span class="thq-body-small">
                      Subscribe to our newsletter for the latest updates on new
                      features and product releases.
                    </span>
                    <div class="footer-actions">
                      <div class="footer-form">
                        <div class="footer-container1">
                          <input type="email" placeholder="Enter your email" class="footer-text-input thq-input" />
                        </div>
                        <button class="thq-button-outline footer-button">
                          <span class="thq-body-small">
                            <span>Subscribe</span>
                          </span>
                        </button>
                      </div>
                      <span class="footer-content2 thq-body-small">
                        <span>
                          By subscribing you agree to with our Privacy Policy and
                          provide consent to receive updates from our company.
                        </span>
                      </span>
                    </div>
                  </div>
                  <div class="footer-links">
                    <div class="footer-column1">
                      <strong class="thq-body-large footer-column1-title">
                        <span>Company</span>
                      </strong>
                      <div class="footer-footer-links">
                        <span class="thq-body-small"><span>About Us</span></span>
                        <span class="thq-body-small">
                          <span>Contact Us</span>
                        </span>
                        <span class="thq-body-small"><span>Careers</span></span>
                      </div>
                    </div>
                    <div class="footer-column2">
                      <strong class="thq-body-large footer-column2-title">
                        <span>Support</span>
                      </strong>
                      <div class="footer-footer-links1">
                        <span class="thq-body-small">
                          <span>Shipping Information</span>
                        </span>
                        <span class="thq-body-small">
                          <span>Returns &amp; Exchanges</span>
                        </span>
                        <span class="thq-body-small">
                          <span>Warranty Policy</span>
                        </span>
                        <span class="thq-body-small">
                          <span>Customer Reviews</span>
                        </span>
                        <span class="thq-body-small">
                          <span>Tech Support</span>
                        </span>
                      </div>
                    </div>
                    <div class="footer-column3">
                      <strong class="thq-body-large footer-social-link1-title">
                        <span>Connect with Us</span>
                      </strong>
                      <div class="footer-social-links">
                        <div class="footer-link">
                          <svg viewBox="0 0 877.7142857142857 1024" class="thq-icon-small">
                            <path
                              d="M713.143 73.143c90.857 0 164.571 73.714 164.571 164.571v548.571c0 90.857-73.714 164.571-164.571 164.571h-107.429v-340h113.714l17.143-132.571h-130.857v-84.571c0-38.286 10.286-64 65.714-64l69.714-0.571v-118.286c-12-1.714-53.714-5.143-101.714-5.143-101.143 0-170.857 61.714-170.857 174.857v97.714h-114.286v132.571h114.286v340h-304c-90.857 0-164.571-73.714-164.571-164.571v-548.571c0-90.857 73.714-164.571 164.571-164.571h548.571z">
                            </path>
                          </svg>
                          <span class="thq-body-small">Facebook</span>
                        </div>
                        <div class="footer-link1">
                          <svg viewBox="0 0 877.7142857142857 1024" class="thq-icon-small">
                            <path
                              d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z">
                            </path>
                          </svg>
                          <span class="thq-body-small">Instagram</span>
                        </div>
                        <div class="footer-link2">
                          <svg viewBox="0 0 1024 1024" class="footer-icon4">
                            <path
                              d="M854 342v-86l-342 214-342-214v86l342 212zM854 170q34 0 59 26t25 60v512q0 34-25 60t-59 26h-684q-34 0-59-26t-25-60v-512q0-34 25-60t59-26h684z">
                            </path>
                          </svg>
                          <span class="thq-body-small">
                            Email :&nbsp;support@themajorones.dev
                          </span>
                        </div>
                        <div class="footer-link3">
                          <svg viewBox="0 0 1024 1024" class="footer-icon6">
                            <path
                              d="M282 460q96 186 282 282l94-94q20-20 44-10 72 24 152 24 18 0 30 12t12 30v150q0 18-12 30t-30 12q-300 0-513-213t-213-513q0-18 12-30t30-12h150q18 0 30 12t12 30q0 80 24 152 8 26-10 44z">
                            </path>
                          </svg>
                          <span class="thq-body-small">
                            Phone ( +84 929199387 )
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="footer-credits">
                  <div class="thq-divider-horizontal"></div>
                  <div class="footer-row">
                    <span class="thq-body-small"></span>
                    <div class="footer-footer-links2">
                      <span class="thq-body-small">
                        <span>Privacy Policy</span>
                      </span>
                      <span class="thq-body-small">
                        <span>Terms &amp; Conditions</span>
                      </span>
                      <span class="thq-body-small">
                        <span>Cookies Policy</span>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </footer>
          </footer>
      </div>
    </div>
    <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
    </body>

    </html>