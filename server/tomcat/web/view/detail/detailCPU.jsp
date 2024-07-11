<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@page import="java.util.ArrayList, main.User, packages.Rating" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <title>ViewDetail - Major's Choice1</title>
          <meta property="og:title" content="ViewDetail - Major's Choice1" />
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
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
           <script type="text/javascript">
        function confirmSubmit() {
            return confirm("You definitely want to submit this form?");
        }
    </script>
        </head>

        <body>
          <link rel="stylesheet" href="../../css/style.css" />
          <div>
            <link href="../../css/view-detail.css" rel="stylesheet" />
            <script type="text/javascript"
              src="https://github.com/teleporthq/date-time-primitive/blob/main/dist/default/lib.umd.js"></script>

            <div class="view-detail-container">
              <div class="view-detail-header">
                <div class="navmain-container navmain-root-class-name49">
                  <header class="navmain-container1"></header>
                  <header class="navmain-container2">
                    <header data-thq="thq-navbar" class="navmain-navbar-interactive">
                      <a href="/" class="navmain-link">
                        <img alt="pastedImage" src="../../css/image/logo.png" class="navmain-pasted-image" />
                      </a>
                      <div data-thq="thq-navbar-nav" class="navmain-desktop-menu">
                        <nav class="navmain-links">
                          <form action="/CPU" method="post">
                            <div class="navmain-container3">
                              <input type="text" placeholder="Search for product" class="navmain-textinput input" />
                              <button class="navmain-search thq-button-filled">
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
                                  <a href="/profile" rel="noreferrer noopener"
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
                              <img alt="pastedImage" src="../../css/image/logo.png"
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
                            <span class="thq-body-small thq-link">
                              <span>Manager Order</span>
                            </span>
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
              </div>
              <div class="view-detail-body">
                <div class="view-detail-link-page">
                  <div class="view-detail-container1">
                    <span class="view-detail-text thq-body-small thq-link">
                      <a href="/">Home&nbsp;</a>
                    </span>
                    <span class="view-detail-text01 thq-body-small thq-link">
                      <c:if test="${category == 'cpu'}">
                        / <a href="/CPU">CPU -&nbsp;Computer processor</a>
                      </c:if>
                      <c:if test="${category == 'gpu'}">
                        / <a href="/GPU">GPU -&nbsp;Graphics processing unit</a>
                      </c:if>
                      <c:if test="${category == 'mobo'}">
                        / <a href="/MotherBoard">MotherBoard -&nbsp;Main circuit board</a>
                      </c:if>
                      <c:if test="${category == 'psu'}">
                        / <a href="/PSU">PSU -&nbsp;Power Supply Unit</a>
                      </c:if>
                      <c:if test="${category == 'ram'}">
                        / <a href="/RAM">RAM -&nbsp;Random-access memory</a>
                      </c:if>
                      <c:if test="${category == 'ssd'}">
                        / <a href="/SSD">SSD -&nbsp;Solid-state drive</a>
                      </c:if>
                      <c:if test="${category == 'case'}">
                        / <a href="/CASE">Case -&nbsp;Computer case</a>
                      </c:if>
                    </span>
                    <span class="view-detail-text02 thq-body-small">
                      &nbsp;/ ${product.name}&nbsp;
                    </span>
                  </div>
                </div>
                <div class="view-detail-infor-product">
                  <div class="view-detail-image-product">
                    <img alt="image" src="../../images/${product.id}.png" class="view-detail-image" />
                  </div>
                  <c:set var="product" value="${requestScope.product}" />
                  <div class="view-detail-name-price">
                    <span class="view-detail-text03">
                      <span>
                        <c:if test="${category == 'cpu'}">
                          ${product.name}/${product.baseClock}GHz Boost ${product.boostClock}GHz/${product.cores}
                          Cores/${product.threads} Threads/${product.socket}
                        </c:if>
                        <c:if test="${category == 'gpu'}">
                          ${product.name}/${product.baseClock}MHz Boost ${product.boostClock}MHz/${product.vram}GB
                        </c:if>
                        <c:if test="${category == 'mobo'}">
                          ${product.name}/${product.ramType}/${product.socket}
                        </c:if>
                        <c:if test="${category == 'psu'}">
                          ${product.name}/${product.wattage}Watt/${product.efficiency}
                        </c:if>
                        <c:if test="${category == 'ram'}">
                          ${product.name}/${product.latency}CL-X
                        </c:if>
                        <c:if test="${category == 'ssd'}">
                          ${product.name}
                        </c:if>
                        <c:if test="${category == 'case'}">
                          ${product.name}
                        </c:if>&nbsp;
                      </span>
                      <br />
                    </span>
                    <div class="view-detail-rating">
                      <span class="view-detail-text06">0.0</span>
                      <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg>
                      <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="view-detail-link">
                        See reviews
                      </a>
                    </div>
                    <fmt:setLocale value="vi_VN" />
                    <fmt:formatNumber value="${product.sellingPrice}" pattern="###,###,###" var="productSelling" />
                    <span class="view-detail-text07">
                      <span class="view-detail-text08">${productSelling}<u>đ</u></span>
                      <br />
                    </span>
                    <div class="view-detail-container2 thq-button-filled button">
                      <form action="/Cart" method="post">
                        <span class="view-detail-text10">
                          <input type="hidden" name="productID" value="${product.id}" />
                          <c:if test="${category != 'mobo'}">
                            <input type="hidden" name="type" value="${category}" />
                          </c:if>
                          <c:if test="${category == 'mobo'}">
                            <input type="hidden" name="type" value="motherboard" />
                          </c:if>
                          <input type="hidden" name="action" value="addItem" />
                          <button type="submit"><span>Buy Now</span></button>
                          <br />
                        </span>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="view-detail-specifications-vs-description">
                  <div class="view-detail-specfications">
                    <h1 class="view-detail-heading">Specifications</h1>
                    <c:if test="${category == 'cpu' || category == 'gpu' || category == 'ram'}">
                      <form class="view-detail-form-gener">
                        <span class="view-detail-text-title">Genernation</span>
                        <span class="view-detail-text-value">${product.generation}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu' || category == 'mobo'}">
                      <form class="view-detail-form-socket">
                        <span class="view-detail-text-title1">
                          <span>Socket</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value1">${product.socket}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-cores">
                        <span class="view-detail-text-title2">
                          <span>Chipset</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value2">${product.chipset}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-threads">
                        <span class="view-detail-text-title3">
                          <span>IGPU</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value3">
                          <c:if test="${product.igpu == '1'}">
                            Yes
                          </c:if>
                          <c:if test="${product.igpu == '0'}">
                            Yes
                          </c:if>
                        </span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo' || category == 'case'}">
                      <form class="view-detail-form-base-clock">
                        <span class="view-detail-text-title4">
                          <span>FormFactor</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value4">${product.formFactor}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-boost-clock">
                        <span class="view-detail-text-title5">
                          <span>RamType</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value5">${product.ramType}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-tdp">
                        <span class="view-detail-text-title6">
                          <span>MaxRamSpeed</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value6">${product.maxRamSpeed}MHz</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>MaxRamCapacity</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.maxRamCapacity}GB</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>RamSlot</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.ramSlots}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Wifi</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.maxRamCapacity}GB</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'mobo'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>MaxRamCapacity</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">
                          <c:if test="${product.wifi == '1'}">
                            Yes
                          </c:if>
                          <c:if test="${product.wifi == '0'}">
                            Yes
                          </c:if>
                        </span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Cores</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.cores}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Threads</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.threads}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu' || category == 'gpu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>BaseClock</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.baseClock}MHz</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu' || category == 'gpu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>BoostClock</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.boostClock}MHz</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'cpu' || category == 'gpu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>TDP</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.tdp}Watt</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'psu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Wattage</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.wattage}Watt</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'psu'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Efficiency</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.efficiency}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'ssd'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Interface</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.connectionInterface}</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'ram' || category == 'ssd'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Capacity</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.capacity}GB</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'ssd'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Cache</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.cache}MB/GB</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'ram'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Speed</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.speed}MHz</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'ram'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Latency</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.latency}CL-X</span>
                      </form>
                    </c:if>
                    <c:if test="${category == 'case'}">
                      <form class="view-detail-form-igpu">
                        <span class="view-detail-text-title7">
                          <span>Color</span>
                          <br />
                        </span>
                        <span class="view-detail-text-value7">${product.color}</span>
                      </form>
                    </c:if>
                  </div>
                  <div class="view-detail-description">
                    <h1 class="view-detail-text27">
                      <span>Description</span>
                      <br />
                    </h1>
                    <span class="view-detail-text-value8">
                      ${product.description}
                    </span>
                  </div>
                </div>
                <div class="view-detail-rating1">
                  <h1 class="view-detail-text38">
                    <span>
                      Rating &amp; Reviews of
                      <c:if test="${category == 'cpu'}">
                        ${product.name}/${product.baseClock}GHz Boost ${product.boostClock}GHz/${product.cores}
                        Cores/${product.threads} Threads/${product.socket}
                      </c:if>
                      <c:if test="${category == 'gpu'}">
                        ${product.name}/${product.baseClock}MHz Boost ${product.boostClock}MHz/${product.vram}GB
                      </c:if>
                      <c:if test="${category == 'mobo'}">
                        ${product.name}/${product.ramType}/${product.socket}
                      </c:if>
                      <c:if test="${category == 'psu'}">
                        ${product.name}/${product.wattage}Watt/${product.efficiency}
                      </c:if>
                      <c:if test="${category == 'ram'}">
                        ${product.name}/${product.latency}CL-X
                      </c:if>
                      <c:if test="${category == 'ssd'}">
                        ${product.name}
                      </c:if>
                      <c:if test="${category == 'case'}">
                        ${product.name}
                      </c:if>
                    </span>
                    <br />
                  </h1>
                  <div class="view-detail-feedback">
                    <div class="view-detail-product-reviews">
                      <div class="view-detail-review">
                        <h1 class="view-detail-text41">
                          <span class="view-detail-text42">PRODUCT REVIEWS</span>
                          <br class="view-detail-text43" />
                        </h1>
                        <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon02">
                          <path
                            d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                          </path>
                        </svg>
                      </div>
                      <c:if test="${requestScope.ratings != null && not empty requestScope.ratings}">
                        <%ArrayList<Rating> ratings = (ArrayList<Rating>) request.getAttribute("ratings");
                            for(Rating rate : ratings){
                            User user = new User();
                            user.id = String.valueOf(rate.userID);
                            user.retrieveData("user");
                            %>
                            <div class="view-detail-review1">
                              <div class="view-detail-name-vs-date">
                                <span class="view-detail-name-cus">
                                  <%=user.fullName%>
                                </span>
                                <span class="view-detail-date-time">
                                  <date-time-primitive format="DD/MM/YYYY"
                                    date="Mon Jun 17 2024 15:33:26 GMT+0700 (Indochina Time)">
                                    <%=rate.dateRated%>
                                  </date-time-primitive>
                                </span>
                              </div>
                              <div class="view-detail-star-rating">
                                <% for (int i=1; i <=5; i++) { %>
                                  <% if (i <=rate.ratingStar) { %>
                                    <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon08">
                                      <path
                                        d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                      </path>
                                    </svg>
                                    <% } else { %>
                                      <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon12">
                                        <path
                                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                        </path>
                                      </svg>
                                      <% } %>
                                        <% } %>
                              </div>
                              <span>
                                <%=rate.ratingText%>
                              </span>
                            </div>
                            <%}%>
                      </c:if>
                    </div>
                     
                    <c:if test="${rateStatus == 'add'}">
                      <div class="view-detail-rating2">
                          <form action="/product/rate" method="post" id="addForm" onsubmit="return confirmSubmit()">
                          <div class="view-detail-form">
                            <div class="view-detail-container3">
                              <span class="view-detail-average">
                                <input type="number" name="rateStar" min="1" max="5" />
                              </span>
                              <span class="view-detail-five-star">/5</span>
                              <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon34">
                                <path
                                  d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                </path>
                              </svg>
                            </div>
                            <div class="view-detail-container4">
                              <strong class="view-detail-number-review">(3)</strong>
                              <span class="view-detail-text44">
                                &nbsp;reviews &amp; comments
                              </span>
                            </div>
                            <input type="hidden" name="userId" value="${userId}" />
                            <input type="hidden" name="category" value="${category}" />
                            <input type="hidden" name="productID" value="${product.id}" />

                          </div>
                          <div class="view-detail-form1">
                            <input name="rateText" type="text" placeholder="Feedback "
                              class="view-detail-textinput input" />
                          </div>
                          <button class="view-detail-container5 thq-button-filled button" type="submit" name="action"
                            value="add">
                            <svg viewBox="0 0 1024 1024" class="view-detail-icon36">
                              <path
                                d="M919.723 476.544l-78.891-52.565 41.984-85.035c6.315-12.8 5.845-27.904-1.28-40.235-7.168-12.373-19.968-20.352-34.219-21.248l-94.635-6.101-6.144-94.635c-0.853-14.251-8.875-27.093-21.205-34.219-12.373-7.125-27.52-7.68-40.235-1.28l-84.949 42.027-52.608-78.891c-15.829-23.765-55.168-23.765-70.997 0l-52.651 78.848-84.992-41.984c-12.757-6.4-27.904-5.845-40.235 1.28-12.373 7.125-20.352 19.968-21.248 34.219l-6.101 94.592-94.635 6.101c-14.251 0.939-27.093 8.917-34.219 21.248s-7.637 27.477-1.28 40.235l41.984 85.035-78.891 52.608c-11.861 7.936-18.987 21.248-18.987 35.499s7.125 27.563 18.987 35.499l78.933 52.608-42.027 84.992c-6.315 12.8-5.845 27.904 1.28 40.235s19.968 20.352 34.219 21.248l94.635 6.101 6.101 94.635c0.896 14.208 8.875 27.051 21.248 34.176s27.392 7.637 40.235 1.323l84.992-42.027 52.608 78.891c7.936 11.861 21.248 18.987 35.499 18.987s27.563-7.125 35.499-18.987l52.608-78.891 84.949 42.027c12.757 6.315 27.861 5.803 40.235-1.28 12.373-7.125 20.352-19.968 21.248-34.219l6.101-94.592 94.677-6.144c14.251-0.896 27.093-8.875 34.219-21.248s7.637-27.477 1.28-40.235l-41.984-84.992 78.891-52.608c11.861-7.936 18.987-21.248 18.987-35.499-0-14.251-7.125-27.605-18.987-35.499zM747.691 604.416l30.293 61.227-68.267 4.437c-21.419 1.408-38.443 18.432-39.851 39.851l-4.395 68.181-61.227-30.251c-19.2-9.557-42.496-3.285-54.4 14.592l-37.845 56.747-37.931-56.875c-8.149-12.245-21.675-18.987-35.541-18.987-6.357 0-12.8 1.408-18.859 4.437l-61.269 30.251-4.395-68.181c-1.365-21.376-18.432-38.443-39.851-39.851l-68.096-4.395 30.293-61.227c9.515-19.243 3.243-42.539-14.592-54.4l-56.875-37.931 56.832-37.888c17.835-11.904 24.064-35.2 14.592-54.4l-30.293-61.269 68.267-4.395c21.419-1.408 38.443-18.432 39.851-39.851l4.395-68.181 61.227 30.251c19.115 9.429 42.496 3.243 54.4-14.592l37.845-56.789 37.931 56.875c11.904 17.835 35.243 24.021 54.4 14.592l61.269-30.293 4.437 68.224c1.408 21.376 18.475 38.4 39.851 39.808l68.181 4.395-30.251 61.312c-9.515 19.243-3.243 42.496 14.592 54.4l56.832 37.888-56.875 37.931c-17.92 11.819-24.149 35.115-14.677 54.357z">
                              </path>
                            </svg>
                            <span class="view-detail-text45">Submit your reviews</span>
                          </button>
                        </form>
                      </div>
                    </c:if>
                    <c:if test="${rateStatus == 'update'}">
                      <div class="view-detail-rating2">
                          <form action="/product/rate" method="post" id="updateForm" onsubmit="return confirmSubmit()">
                          <div class="view-detail-form">
                            <div class="view-detail-container3">
                              <span class="view-detail-average">
                                <input type="number" name="rateStar" min="1" max="5" value="${rate.ratingStar}" />
                              </span>
                              <span class="view-detail-five-star">/5</span>
                              <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-icon34">
                                <path
                                  d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                                </path>
                              </svg>
                            </div>
                            <div class="view-detail-container4">
                              <strong class="view-detail-number-review">(3)</strong>
                              <span class="view-detail-text44">
                                &nbsp;reviews &amp; comments
                              </span>
                            </div>
                            <input type="hidden" name="productID" value="${product.id}" />
                            <input type="hidden" name="category" value="${category}" />
                            <input type="hidden" name="rateID" value="${rate.id}" />
                          </div>
                          <div class="view-detail-form1">
                            <input name="rateText" value="${rate.ratingText}" type="text" placeholder="Feedback "
                              class="view-detail-textinput input" />
                          </div>
                          <button class="view-detail-container5 thq-button-filled button" type="submit" name="action"
                            value="update">
                            <svg viewBox="0 0 1024 1024" class="view-detail-icon36">
                              <path
                                d="M919.723 476.544l-78.891-52.565 41.984-85.035c6.315-12.8 5.845-27.904-1.28-40.235-7.168-12.373-19.968-20.352-34.219-21.248l-94.635-6.101-6.144-94.635c-0.853-14.251-8.875-27.093-21.205-34.219-12.373-7.125-27.52-7.68-40.235-1.28l-84.949 42.027-52.608-78.891c-15.829-23.765-55.168-23.765-70.997 0l-52.651 78.848-84.992-41.984c-12.757-6.4-27.904-5.845-40.235 1.28-12.373 7.125-20.352 19.968-21.248 34.219l-6.101 94.592-94.635 6.101c-14.251 0.939-27.093 8.917-34.219 21.248s-7.637 27.477-1.28 40.235l41.984 85.035-78.891 52.608c-11.861 7.936-18.987 21.248-18.987 35.499s7.125 27.563 18.987 35.499l78.933 52.608-42.027 84.992c-6.315 12.8-5.845 27.904 1.28 40.235s19.968 20.352 34.219 21.248l94.635 6.101 6.101 94.635c0.896 14.208 8.875 27.051 21.248 34.176s27.392 7.637 40.235 1.323l84.992-42.027 52.608 78.891c7.936 11.861 21.248 18.987 35.499 18.987s27.563-7.125 35.499-18.987l52.608-78.891 84.949 42.027c12.757 6.315 27.861 5.803 40.235-1.28 12.373-7.125 20.352-19.968 21.248-34.219l6.101-94.592 94.677-6.144c14.251-0.896 27.093-8.875 34.219-21.248s7.637-27.477 1.28-40.235l-41.984-84.992 78.891-52.608c11.861-7.936 18.987-21.248 18.987-35.499-0-14.251-7.125-27.605-18.987-35.499zM747.691 604.416l30.293 61.227-68.267 4.437c-21.419 1.408-38.443 18.432-39.851 39.851l-4.395 68.181-61.227-30.251c-19.2-9.557-42.496-3.285-54.4 14.592l-37.845 56.747-37.931-56.875c-8.149-12.245-21.675-18.987-35.541-18.987-6.357 0-12.8 1.408-18.859 4.437l-61.269 30.251-4.395-68.181c-1.365-21.376-18.432-38.443-39.851-39.851l-68.096-4.395 30.293-61.227c9.515-19.243 3.243-42.539-14.592-54.4l-56.875-37.931 56.832-37.888c17.835-11.904 24.064-35.2 14.592-54.4l-30.293-61.269 68.267-4.395c21.419-1.408 38.443-18.432 39.851-39.851l4.395-68.181 61.227 30.251c19.115 9.429 42.496 3.243 54.4-14.592l37.845-56.789 37.931 56.875c11.904 17.835 35.243 24.021 54.4 14.592l61.269-30.293 4.437 68.224c1.408 21.376 18.475 38.4 39.851 39.808l68.181 4.395-30.251 61.312c-9.515 19.243-3.243 42.496 14.592 54.4l56.832 37.888-56.875 37.931c-17.92 11.819-24.149 35.115-14.677 54.357z">
                              </path>
                            </svg>
                            <span class="view-detail-text45">Submit your reviews</span>
                          </button>
                        </form>
                      </div>
                    </c:if>
                  </div>
                </div>
              </div>
              <footer class="footer-footer1 thq-section-padding footer-root-class-name45">
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
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
      document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');

        if (status === "1") {
          Swal.fire({
            title: "Create Rating Successful!",
            icon: 'success',
            confirmButtonText: 'OK'
          });
        }

        if (status === '2') {
          Swal.fire({
            title: "Update Rating Successful!",
            icon: 'success',
            confirmButtonText: 'OK'
          });
        }

        if (status === '-1') {
          Swal.fire({
            title: "Add Rating Fail.",
            icon: 'error',
            confirmButtonText: 'OK'
          });
        }

        if (status === '-2') {
          Swal.fire({
            title: "Update Rating Fail.",
            icon: 'error',
            confirmButtonText: 'OK'
          });
        }

      });
    </script>
        </html>