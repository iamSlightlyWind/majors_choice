<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@page import="packages.Rating" %>
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
            href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
            data-tag="font" />
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
            <link href="./css/index_1.css" rel="stylesheet" />

            <div class="index-container">
              <header class="index-header">
                <div class="navmain-container">
                  <header class="navmain-container1"></header>
                  <header class="navmain-container2">
                    <header data-thq="thq-navbar" class="navmain-navbar-interactive">
                      <a href="/" class="navmain-link">
                        <img alt="pastedImage" src="./css/image/logo.png" class="navmain-pasted-image" />
                      </a>
                      <div data-thq="thq-navbar-nav" class="navmain-desktop-menu">
                        <nav class="navmain-links">
                          <form action="/" method="post">
                            <div class="navmain-container3">
                              <input type="text" name="searchName" placeholder="Search for product"
                                class="navmain-textinput input" />
                              <button class="navmain-search thq-button-filled" type="submit">
                                <span class="navmain-text thq-body-small">
                                  <span>Search</span>
                                  <br />
                                </span>
                              </button>
                            </div>
                          </form>
                          <div class="navmain-container4">
                            <a href="/" class="navmain-home thq-body-small thq-link">
                              <span>Home</span>
                            </a>
                            <span class="navmain-contact thq-body-small thq-link">
                              Contact Us
                            </span>
                            <span class="navmain-whoweare thq-body-small thq-link">
                              <span>Who we are</span>
                            </span>
                            <% if (!"staff".equals(request.getSession().getAttribute("table"))) { %>
                              <a href="/order" class="navmain-manager-order thq-body-small thq-link">
                                Manage Order
                              </a>
                              <% } %>
                                <% if ("staff".equals(request.getSession().getAttribute("table"))) { %>
                                  <a href="/order" class="navmain-manager-order thq-body-small thq-link"
                                    style="visibility: hidden;">
                                    Manage Order
                                  </a>
                                  <% } %>
                          </div>
                        </nav>
                        <div class="navmain-buttons">
                          <% if (!"staff".equals(request.getSession().getAttribute("table"))) { %>
                            <a href="/Cart" target="_blank" rel="noreferrer noopener" class="navmain-link1">
                              <svg viewBox="0 0 1024 1024" class="navmain-icon thq-button-icon thq-icon-medium">
                                <path
                                  d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                                </path>
                              </svg>
                            </a>
                            <% } %>
                              <% if ("staff".equals(request.getSession().getAttribute("table"))) { %>
                                <a href="/Cart" target="_blank" rel="noreferrer noopener" class="navmain-link1">
                                  <svg viewBox="0 0 1024 1024" class="navmain-icon thq-button-icon thq-icon-medium"
                                    style="visibility: hidden;">
                                    <path
                                      d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                                    </path>
                                  </svg>
                                </a>
                                <% } %>
                                  <a href="/profile" target="_blank" rel="noreferrer noopener"
                                    class="navmain-account thq-button-filled">
                                    <svg viewBox="0 0 731.4285714285713 1024" class="navmain-icon2">
                                      <path
                                        d="M731.429 799.429c0 83.429-54.857 151.429-121.714 151.429h-488c-66.857 0-121.714-68-121.714-151.429 0-150.286 37.143-324 186.857-324 46.286 45.143 109.143 73.143 178.857 73.143s132.571-28 178.857-73.143c149.714 0 186.857 173.714 186.857 324zM585.143 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z">
                                      </path>
                                    </svg>
                                  </a>
                        </div>
                      </div>
                      <div data-thq="thq-burger-menu" class="navmain-burger-menu">
                        <svg viewBox="0 0 1024 1024" class="navmain-icon4">
                          <path
                            d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z">
                          </path>
                        </svg>
                      </div>
                      <div data-thq="thq-mobile-menu" class="navmain-mobile-menu">
                        <div class="navmain-nav">
                          <div class="navmain-top">
                            <div class="navmain-container5">
                              <img alt="pastedImage" src="./css/image/logo.png"
                                class="navmain-pasted-image1" />
                            </div>
                            <div data-thq="thq-close-menu" class="navmain-close-menu">
                              <svg viewBox="0 0 1024 1024" class="navmain-icon6">
                                <path
                                  d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z">
                                </path>
                              </svg>
                            </div>
                          </div>
                          <nav class="navmain-links1">
                            <div class="navmain-container6">
                              <input type="text" placeholder="Search product by name"
                                class="navmain-textinput1 input" />
                              <button class="navmain-search1 thq-button-filled thq-button-animated">
                                <span class="navmain-text3 thq-body-small">
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
                            <% String table=(String) request.getSession().getAttribute("table"); if
                              (!"staff".equals(table)) { %>
                              <span class="thq-body-small thq-link">
                                <span>Manager Order</span>
                              </span>
                              <% } %>
                          </nav>
                        </div>
                      </div>
                    </header>
                  </header>
                </div>
                <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role)
                  || "manager" .equals(role)) { %>
                  <div class="navstaff-container">
                    <div class="navstaff-manager">
                      <a href="/cpus" class="navstaff-mgt-ware-house text1 thq-link1 thq-body-small">Manage
                        Warehouse</a>
                      <a href="/manage/profile?actor=user"
                        class="navstaff-mgt-customer text1 thq-link1 thq-body-small">Manage Customer</a>
                      <a href="/order" class="navstaff-mgt-customer text1 thq-link1 thq-body-small">Manage Order</a>
                      <a href="/manage/profile?actor=staff"
                        class="navstaff-mgt-staff text1 thq-link1 thq-body-small">Manage Staff</a>
                      <a href="/stats" class="navstaff-mgt-report text1 thq-link1 thq-body-small">Statistics</a>
                    </div>
                  </div>
                  <% } %>
                    <div class="index-welcome">
                      <div class="index-container1">
                        <h1 class="index-text thq-heading-1">
                          Welcome to Major's Choice
                        </h1>
                        <span class="index-text0001">
                          Your one-stop shop for high-quality computer components
                        </span>
                        <div class="index-container2">
                          <button type="button" class="index-button button thq-button-outline">
                            <span class="index-text0002">
                              <span>Who we are</span>
                              <br />
                            </span>
                          </button>
                          <button type="button" class="index-button1 thq-button-filled button">
                            <span class="index-text0005">
                              <span>Shop now</span>
                              <br />
                            </span>
                          </button>
                        </div>
                      </div>
                    </div>
              </header>
              <div class="index-body">
                <div class="index-category-and-best-seller">
                  <div class="index-list-category">
                    <div class="index-container3">
                      <h1 class="index-text0008">Category</h1>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu">
                        <span class="index-text0009">
                          <span><a href="/CPU">CPU</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list">
                        <li data-thq="thq-dropdown" class="index-dropdown list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle">
                            <span class="index-text0012 list-item">
                              <span>Brand</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow001">
                              <svg viewBox="0 0 1024 1024" class="index-icon002">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list001">
                            <li data-thq="thq-dropdown" class="index-dropdown001 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle001">
                                <span class="index-text0015"> <a href="/FilterCPU?brand=amd">AMD</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow002">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown004 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle004">
                                <span class="index-text0022"><a href="/FilterCPU?brand=intel">Intel</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow003">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown026 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle026">
                            <span class="index-text0081 list-item">
                              <span>Generation</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow008">
                              <svg viewBox="0 0 1024 1024" class="index-icon016">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list008">
                            <li data-thq="thq-dropdown" class="index-dropdown027 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle027">
                                <span class="index-text0084"><a href="/FilterCPU?generation=Cezanne">Cezanne</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow009">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown030 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle030">
                                <span class="index-text0091"><a href="/FilterCPU?generation=Zen 3">Zen 3</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow010">
                                </div>
                              </div>

                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown034 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle034">
                                <span class="index-text0101"><a href="/FilterCPU?generation=raphael">Raphael</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow011">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown038 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle038">
                                <span class="index-text0111"><a href="/FilterCPU?generation=raptorlake">Raptor
                                    Lake</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow012">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown052 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle052">
                            <span class="index-text0150 list-item">
                              <span>Socket</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow015">
                              <svg viewBox="0 0 1024 1024" class="index-icon030">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list015">
                            <li data-thq="thq-dropdown" class="index-dropdown053 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle053">
                                <span class="index-text0153"><a href="/FilterCPU?socket=am4">AM4</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow016">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown056 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle056">
                                <span class="index-text0160"><a href="/FilterCPU?socket=am5">AM5</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow017">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown060 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle060">
                                <span class="index-text0170"><a href="/FilterCPU?socket=lga1700">LGA 1700</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow018">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown1 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu1">
                        <span class="index-text0239">
                          <span><a href="/GPU">GPU</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow022"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon044">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list024">
                        <li data-thq="thq-dropdown" class="index-dropdown093 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle085">
                            <span class="index-text0242 list-item">
                              <span>Brand</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow023">
                              <svg viewBox="0 0 1024 1024" class="index-icon046">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list025">
                            <li data-thq="thq-dropdown" class="index-dropdown094 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle086">
                                <span class="index-text0245"><a href="/FilterGPU?brand=amd">AMD</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow024">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown097 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle089">
                                <span class="index-text0252"><a href="/FilterGPU?brand=nvidia">NVIDIA</a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow025">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown119 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle111">
                            <span class="index-text0311 list-item">
                              <span>Generation</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow030">
                              <svg viewBox="0 0 1024 1024" class="index-icon060">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list032">
                            <li data-thq="thq-dropdown" class="index-dropdown120 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle112">
                                <span class="index-text0314"><a
                                    href="/FilterGPU?generation=rdna"><span>RDNA</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow031">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown123 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle115">
                                <span class="index-text0321"> <a
                                    href="/FilterGPU?generation=ampere"><span>Ampere</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow032">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown127 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle119">
                                <span class="index-text0331"><a href="/FilterGPU?generation=adalovelace"><span>Ada
                                      LoveLace</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow033">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown2 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu2">
                        <span class="index-text0469">
                          <span><a href="/MotherBoard">Mobo</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow044"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon088">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list048">
                        <li data-thq="thq-dropdown" class="index-dropdown186 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle170">
                            <span class="index-text0472 list-item">
                              <span>Socket</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow045">
                              <svg viewBox="0 0 1024 1024" class="index-icon090">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list049">
                            <li data-thq="thq-dropdown" class="index-dropdown187 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle171">
                                <span class="index-text0475"><a
                                    href="/FilterMotherBoard?socket=am4"><span>AM4</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow046">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown190 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle174">
                                <span class="index-text0482"><a
                                    href="/FilterMotherBoard?socket=am5"><span>AM5</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow047">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown194 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle178">
                                <span class="index-text0492"><a href="/FilterMotherBoard?socket=lga1700"><span>LGA
                                      1700</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow048">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown212 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle196">
                            <span class="index-text0541 list-item">
                              <span> Form Factor</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow052">
                              <svg viewBox="0 0 1024 1024" class="index-icon104">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list056">
                            <li data-thq="thq-dropdown" class="index-dropdown213 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle197">
                                <span class="index-text0544"><a
                                    href="/FilterMotherBoard?formFactor=atx"><span>ATX</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow053">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown216 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle200">
                                <span class="index-text0551"><a
                                    href="/FilterMotherBoard?formFactor=matx"><span>mATX</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow054">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown220 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle204">
                                <span class="index-text0561"><a
                                    href="/FilterMotherBoard?formFactor=mITX"><span>mITX</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow055">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown238 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle222">
                            <span class="index-text0610 list-item">
                              <span>Ram Type</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow059">
                              <svg viewBox="0 0 1024 1024" class="index-icon118">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list063">
                            <li data-thq="thq-dropdown" class="index-dropdown239 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle223">
                                <span class="index-text0613"><a
                                    href="/FilterMotherBoard?ramType=ddr4"><span>DDR4</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow060">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown242 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle226">
                                <span class="index-text0620"><a
                                    href="/FilterMotherBoard?ramType=ddr5"><span>DDR5</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow061">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown238 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle222">
                            <span class="index-text0610 list-item">
                              <span>Wifi</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow059">
                              <svg viewBox="0 0 1024 1024" class="index-icon118">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list063">
                            <li data-thq="thq-dropdown" class="index-dropdown239 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle223">
                                <span class="index-text0613"><a
                                    href="/FilterMotherBoard?wifi=1"><span>Yes</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow060">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown242 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle226">
                                <span class="index-text0620"><a
                                    href="/FilterMotherBoard?wifi=0"><span>No</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow061">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown3 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu3">
                        <span class="index-text0699">
                          <span><a href="/PSU">PSU</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow066"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon132">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list072">
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>Efficiency</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"><a href="/FilterPSU?efficiency=80platin"><span>80+
                                      platin</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterPSU?efficiency=80gold"><span>80+
                                      gold</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown287 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle263">
                                <span class="index-text0722"><a href="/FilterPSU?efficiency=80titani"><span>80+
                                      titani</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow070">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown4 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu4">
                        <span class="index-text0929">
                          <span><a href="/RAM">RAM</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow088"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon176">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list096">
                        <li data-thq="thq-dropdown" class="index-dropdown372 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle340">
                            <span class="index-text0932 list-item">
                              <span>Generation</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow089">
                              <svg viewBox="0 0 1024 1024" class="index-icon178">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list097">
                            <li data-thq="thq-dropdown" class="index-dropdown373 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle341">
                                <span class="index-text0935"><a
                                    href="/FilterRAM?generations=ddr4"><span>DDR4</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow090">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown376 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle344">
                                <span class="index-text0942"><a
                                    href="/FilterRAM?generations=ddr5"><span>DDR5</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow091">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown398 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle366">
                            <span class="index-text1001 list-item">
                              <span>Spped</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow096">
                              <svg viewBox="0 0 1024 1024" class="index-icon192">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list104">
                            <li data-thq="thq-dropdown" class="index-dropdown399 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle367">
                                <span class="index-text1004"><a
                                    href="/FilterRAM?speed=3000"><span>3000</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow097">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown402 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle370">
                                <span class="index-text1011"><a
                                    href="/FilterRAM?speed=3200"><span>3200</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow098">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown406 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle374">
                                <span class="index-text1021"><a
                                    href="/FilterRAM?speed=3600"><span>3600</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow099">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown410 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle378">
                                <span class="index-text1031"><a
                                    href="/FilterRAM?speed=5600"><span>5600</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow100">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown413 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle381">
                                <span class="index-text1038"><a
                                    href="/FilterRAM?speed=6000"><span>6000</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow101">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown418 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle386">
                                <span class="index-text1052"><a
                                    href="/FilterRAM?speed=6400"><span>6400</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow102">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown424 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle392">
                            <span class="index-text1070 list-item">
                              <span>Latency</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow103">
                              <svg viewBox="0 0 1024 1024" class="index-icon206">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list111">
                            <li data-thq="thq-dropdown" class="index-dropdown425 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle393">
                                <span class="index-text1073"><a href="/FilterRAM?latencys=15"><span>15</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow104">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown428 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle396">
                                <span class="index-text1080"><a href="/FilterRAM?latencys=16"><span>16</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow105">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown432 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle400">
                                <span class="index-text1090"><a href="/FilterRAM?latencys=18"><span>18</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow106">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown436 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle404">
                                <span class="index-text1100"><a href="/FilterRAM?latencys=36"><span>36</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow107">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown439 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle407">
                                <span class="index-text1107"><a href="/FilterRAM?latencys=38"><span>38</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow108">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>Capacity</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"> <a
                                    href="/FilterRAM?capacity=16"><span>16</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterRAM?capacity=32"><span>32</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown287 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle263">
                                <span class="index-text0722"><a href="/FilterRAM?capacity=64"><span>64</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow070">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown3 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu3">
                        <span class="index-text0699">
                          <span><a href="/SSD">SSD</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow066"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon132">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list072">
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>Inteface</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"><a href="/FilterSSD?interfaces=PCIe3"><span
                                      class="home-page-text443">PCIe 3.0</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterSSD?interfaces=PCIe4"><span
                                      class="home-page-text443">PCIe 4.0</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown287 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle263">
                                <span class="index-text0722"><a href="/FilterSSD?interfaces=SATA25"><span
                                      class="home-page-text443">SATA 2.5</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow070">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>Cache</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"><a href="/FilterSSD?cache=0"><span
                                      class="home-page-text443">0</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterSSD?cache=1"><span
                                      class="home-page-text443">1</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div data-thq="thq-dropdown" class="index-thq-dropdown3 list-item">
                      <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle-cpu3">
                        <span class="index-text0699">
                          <span><a href="/CASE">CASE</a></span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow066"></div>
                        <svg viewBox="0 0 1024 1024" class="index-icon132">
                          <path d="M426 726v-428l214 214z"></path>
                        </svg>
                      </div>
                      <ul data-thq="thq-dropdown-list" class="index-dropdown-list072">
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>FormFactor</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"><a href="/FilterCase?formFactors=MidTower"><span
                                      class="home-page-text443">Mid Tower</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterCase?formFactors=FullTower"><span
                                      class="home-page-text443">Full Tower</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown287 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle263">
                                <span class="index-text0722"><a href="/FilterCase?formFactors=MiniITX"><span
                                      class="home-page-text443">Mini ITX</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow070">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li data-thq="thq-dropdown" class="index-dropdown279 list-item">
                          <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle255">
                            <span class="index-text0702 list-item">
                              <span>Color</span>
                              <br />
                            </span>
                            <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow067">
                              <svg viewBox="0 0 1024 1024" class="index-icon134">
                                <path d="M426 726v-428l214 214z"></path>
                              </svg>
                            </div>
                          </div>
                          <ul data-thq="thq-dropdown-list" class="index-dropdown-list073">
                            <li data-thq="thq-dropdown" class="index-dropdown280 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle256">
                                <span class="index-text0705"> <a href="/FilterCase?colors=White"><span
                                      class="home-page-text443">White</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow068">
                                </div>
                              </div>
                            </li>
                            <li data-thq="thq-dropdown" class="index-dropdown283 list-item">
                              <div data-thq="thq-dropdown-toggle" class="index-dropdown-toggle259">
                                <span class="index-text0712"><a href="/FilterCase?colors=Black"><span
                                      class="home-page-text443">Black</span></a></span>
                                <div data-thq="thq-dropdown-arrow" class="index-dropdown-arrow069">
                                </div>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="index-best-seller">
                    <div class="index-header1">
                      <h1 class="index-text1159">Best seller</h1>
                    </div>
                    <div class="index-body1">
                      <div class="index-product">
                        <c:forEach var="bcpu" items="${requestScope.Bcpus}">
                          <a href="/view/detail/product?category=cpu&id=${bcpu.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bcpu.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bcpu.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bcpu.sellingPrice}" pattern="###,###,###"
                                  var="bcpuSelling" />
                                <span>${bcpuSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <c:set var="bcpu1" value="${bcpu}" scope="page" />
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>
                                  </span>(0 Review)</span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="Bgpu" items="${requestScope.Bgpus}">
                          <a href="/view/detail/product?category=gpu&id=${Bgpu.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${Bgpu.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${Bgpu.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${Bgpu.sellingPrice}" pattern="###,###,###"
                                  var="BgpuSelling" />
                                <span>${BgpuSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="bmobo" items="${requestScope.Bmobos}">
                          <a href="/view/detail/product?category=mobo&id=${bmobo.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bmobo.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bmobo.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bmobo.sellingPrice}" pattern="###,###,###"
                                  var="bmoboSelling" />
                                <span>${bmoboSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="bpsu" items="${requestScope.Bpsus}">
                          <a href="/view/detail/product?category=psu&id=${bpsu.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bpsu.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bpsu.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bpsu.sellingPrice}" pattern="###,###,###"
                                  var="bpsuSelling" />
                                <span>${bpsuSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="bram" items="${requestScope.Brams}">
                          <a href="/view/detail/product?category=ram&id=${bram.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bram.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bram.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bram.sellingPrice}" pattern="###,###,###"
                                  var="bramSelling" />
                                <span>${bramSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="bcase" items="${requestScope.Bcases}">
                          <a href="/view/detail/product?category=case&id=${bcase.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bcase.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bcase.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bcase.sellingPrice}" pattern="###,###,###"
                                  var="bcaseSelling" />
                                <span>${bcaseSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                        <c:forEach var="bssd" items="${requestScope.Bssds}">
                          <a href="/view/detail/product?category=ssd&id=${bssd.id}" rel="noreferrer noopener">
                            <div class="product-container product-root-class-name131">
                              <img alt="image" src="./images/${bssd.id}.png" loading="eager" class="product-image" />
                              <h1 class="product-text thq-link">
                                <span>
                                  ${bssd.name}
                                </span>
                              </h1>
                              <span class="product-text1">
                                <fmt:setLocale value="vi_VN" />
                                <fmt:formatNumber value="${bssd.sellingPrice}" pattern="###,###,###"
                                  var="bssdSelling" />
                                <span>${bssdSelling}<u>đ</u></span>
                                <br />
                              </span>
                              <div class="product-container1">
                                <span class="product-text4"><span>0.0</span></span>
                                <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                                  <path
                                    d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                  </path>
                                </svg>
                                <span class="product-text5"><span>(0 Review)</span></span>
                              </div>
                            </div>
                          </a>
                        </c:forEach>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="index-cpu">
                  <div class="index-header-cpu">
                    <h1 class="index-text1160">
                      <span>CPU&nbsp;</span>
                      <br />
                    </h1>
                    <span class="index-text1163 thq-link">
                      <span><a href="/CPU">
                          View all product
                        </a></span>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu">
                    <c:forEach var="cpu" items="${requestScope.cpus}" begin="0" end="4">
                      <a href="/view/detail/product?category=cpu&id=${cpu.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name131">
                          <img alt="image" src="./images/${cpu.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${cpu.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${cpu.sellingPrice}" pattern="###,###,###" var="cpuSelling" />
                            <span>${cpuSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu1">
                  <div class="index-header-cpu1">
                    <h1 class="index-text1166">
                      <span>GPU&nbsp;</span>
                      <br />
                    </h1>
                    <span class="index-text1169 thq-link">
                      <span><a href="/GPU">
                          View all product
                        </a></span>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu1">
                    <c:forEach var="gpu" items="${requestScope.gpus}" begin="0" end="4">
                      <a href="/view/detail/product?category=gpu&id=${gpu.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name146">
                          <img alt="image" src="./images/${gpu.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${gpu.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${gpu.sellingPrice}" pattern="###,###,###" var="gpuSelling" />
                            <span>${gpuSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu2">
                  <div class="index-header-cpu2">
                    <h1 class="index-text1172">
                      <span>MotherBoard&nbsp;</span>
                      <br />
                    </h1>
                    <span class="index-text1175 thq-link">
                      <a href="/MotherBoard">
                        View all product
                      </a>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu2">
                    <c:forEach var="mobo" items="${requestScope.mobos}" begin="0" end="4">
                      <a href="/view/detail/product?category=mobo&id=${mobo.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name141">
                          <img alt="image" src="./images/${mobo.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${mobo.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${mobo.sellingPrice}" pattern="###,###,###" var="moboSelling" />
                            <span>${moboSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu3">
                  <div class="index-header-cpu3">
                    <h1 class="index-text1178">
                      <span>PSU</span>
                      <br />
                    </h1>
                    <span class="index-text1181 thq-link">
                      <a href="/PSU">
                        View all product
                      </a>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu3">
                    <c:forEach var="psu" items="${requestScope.psus}" begin="0" end="4">
                      <a href="/view/detail/product?category=psu&id=${psu.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name136">
                          <img alt="image" src="./images/${psu.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${psu.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${psu.sellingPrice}" pattern="###,###,###" var="psuSelling" />
                            <span>${psuSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu4">
                  <div class="index-header-cpu4">
                    <h1 class="index-text1184">
                      <span>RAM</span>
                      <br />
                    </h1>
                    <span class="index-text1187 thq-link">
                      <a href="/RAM">
                        View all product
                      </a>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu4">
                    <c:forEach var="ram" items="${requestScope.rams}" begin="0" end="4">
                      <a href="/view/detail/product?category=ram&id=${ram.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name151">
                          <img alt="image" src="./images/${ram.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${ram.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${ram.sellingPrice}" pattern="###,###,###" var="ramSelling" />
                            <span>${ramSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu3">
                  <div class="index-header-cpu3">
                    <h1 class="index-text1178">
                      <span>SSD</span>
                      <br />
                    </h1>
                    <span class="index-text1181 thq-link">
                      <a href="/SSD">
                        View all product
                      </a>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu3">
                    <c:forEach var="ssd" items="${requestScope.ssds}" begin="0" end="4">
                      <a href="/view/detail/product?category=ssd&id=${ssd.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name136">
                          <img alt="image" src="./images/${ssd.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${ssd.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${ssd.sellingPrice}" pattern="###,###,###" var="ssdSelling" />
                            <span>${ssdSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
                <div class="index-cpu4">
                  <div class="index-header-cpu4">
                    <h1 class="index-text1184">
                      <span>CASE</span>
                      <br />
                    </h1>
                    <span class="index-text1187 thq-link">
                      <a href="/CASE">
                        View all product
                      </a>
                      <br />
                    </span>
                  </div>
                  <div class="index-body-cpu4">
                    <c:forEach var="case1" items="${requestScope.cases}" begin="0" end="4">
                      <a href="/view/detail/product?category=case&id=${case1.id}" rel="noreferrer noopener">
                        <div class="product-container product-root-class-name151">
                          <img alt="image" src="./images/${case1.id}.png" loading="eager" class="product-image" />
                          <h1 class="product-text thq-link">
                            <span>
                              ${case1.name}
                            </span>
                          </h1>
                          <span class="product-text1">
                            <fmt:setLocale value="vi_VN" />
                            <fmt:formatNumber value="${case1.sellingPrice}" pattern="###,###,###" var="ramSelling" />
                            <span>${ramSelling}<u>đ</u></span>
                            <br />
                          </span>
                          <div class="product-container1">
                            <span class="product-text4"><span>0.0</span></span>
                            <svg viewBox="0 0 950.8571428571428 1024" class="product-icon">
                              <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                              </path>
                            </svg>
                            <span class="product-text5"><span>(0 Review)</span></span>
                          </div>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                </div>
              </div>
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
                            <span class="thq-body-small"><span>Subscribe</span></span>
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
                          <span class="thq-body-small"><span>Contact Us</span></span>
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
                            <a href="mailto:support@themajorones.dev?subject=Support"
                              class="footer-social-link5 thq-body-small">
                              Email : support@themajorones.dev
                            </a>
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
            </div>
          </div>
          <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
        </body>

        </html>