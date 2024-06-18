<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <link rel="stylesheet" href="../../css/style.css" />
      <div>
        <link href="../../css/detail-cpu.css" rel="stylesheet" />
        <script type="text/javascript"
          src="https://github.com/teleporthq/date-time-primitive/blob/main/dist/default/lib.umd.js"></script>

        <div class="view-detail-product-container">
          <div class="view-detail-product-header">
            <div class="navbar-container navbar-root-class-name49">
              <div class="navbar-container1"></div>
              <header class="navbar-container2">
                <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                  <img alt="pastedImage" src="../../css/image/logo.png" class="navbar-pasted-image" />
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
                          <span><a href="/">Home</a></span>
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
                      <button class="navbar-account thq-button-filled">
                        <svg viewBox="0 0 731.4285714285713 1024" class="navbar-icon04">
                          <path
                            d="M731.429 799.429c0 83.429-54.857 151.429-121.714 151.429h-488c-66.857 0-121.714-68-121.714-151.429 0-150.286 37.143-324 186.857-324 46.286 45.143 109.143 73.143 178.857 73.143s132.571-28 178.857-73.143c149.714 0 186.857 173.714 186.857 324zM585.143 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z">
                          </path>
                        </svg>
                      </button>
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
                          <img alt="pastedImage" src="public/external/pastedimage-bdsl-200h.png"
                            class="navbar-pasted-image1" />
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
            <div class="menu-function-container menu-function-root-class-name51">
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
          <div class="view-detail-product-body">
            <div class="view-detail-product-link-page">
              <div class="view-detail-product-container1">
                <span class="view-detail-product-text thq-body-small thq-link">
                  Home&nbsp;
                </span>
                <span class="view-detail-product-text01 thq-body-small thq-link">
                  / CPU -&nbsp;Computer processor
                </span>
                <span class="view-detail-product-text02 thq-body-small">
                  &nbsp;/ Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng /
                  5MB / AM4&nbsp;
                </span>
              </div>
            </div>
            <c:set var="product" value="${requestScope.product}" />
            <div class="view-detail-product-infor-product">
              <div class="view-detail-product-image-product">
                <img alt="image"
                  src="public/external/gearvn-amd-athlon-3000g_9a96ebfbbf3f43c7a61cdba59b00e5b5_fc7e2a8f09b24c55b154d39cf9ce96a7_grande-1500h-400w.webp"
                  class="view-detail-product-image" />
              </div>
              <div class="view-detail-product-name-price">
                <span class="view-detail-product-text03">
                  <span>
                    ${product.name}
                    &nbsp;
                  </span>
                  <br />
                </span>
                <div class="view-detail-product-rating">
                  <span class="view-detail-product-text06">0.0</span>
                  <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon">
                    <path
                      d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                    </path>
                  </svg>
                  <a href="https://example.com" target="_blank" rel="noreferrer noopener"
                    class="view-detail-product-link">
                    See reviews
                  </a>
                </div>
                <span class="view-detail-product-text07">
                  <span class="view-detail-product-text08">${product.sellingPrice}</span>
                  <br />
                </span>
                <div class="view-detail-product-container2 thq-button-filled button">
                  <span class="view-detail-product-text10">
                    <span>Buy Now</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text13">
                    (The product will be added to the cart)
                  </span>
                </div>
              </div>
            </div>
            <div class="view-detail-product-specifications-vs-description">
              <div class="view-detail-product-specfications">
                <h1 class="view-detail-product-heading">Specifications</h1>
                <form class="view-detail-product-form-gener">
                  <span class="view-detail-product-text-title">Genernation</span>
                  <span class="view-detail-product-text-value">Genernation</span>
                </form>
                <form class="view-detail-product-form-socket">
                  <span class="view-detail-product-text-title1">
                    <span>Socket</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value1">Genernation</span>
                </form>
                <form class="view-detail-product-form-cores">
                  <span class="view-detail-product-text-title2">
                    <span>Cores</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value2">Genernation</span>
                </form>
                <form class="view-detail-product-form-threads">
                  <span class="view-detail-product-text-title3">
                    <span>Threads</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value3">Genernation</span>
                </form>
                <form class="view-detail-product-form-base-clock">
                  <span class="view-detail-product-text-title4">
                    <span>BaseClock</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value4">Genernation</span>
                </form>
                <form class="view-detail-product-form-boost-clock">
                  <span class="view-detail-product-text-title5">
                    <span>BoostClock</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value5">Genernation</span>
                </form>
                <form class="view-detail-product-form-tdp">
                  <span class="view-detail-product-text-title6">
                    <span>TDP</span>
                    <br />
                  </span>
                  <span class="view-detail-product-text-value6">Genernation</span>
                </form>
              </div>
              <div class="view-detail-product-description">
                <h1 class="view-detail-product-text26">
                  <span>Description</span>
                  <br />
                </h1>
                <span class="view-detail-product-text-value7">
                  <span>
                    Basically we will have a 2-core/4-thread CPU operating at a
                    clock speed of 3.5GHz (an increase of 300MHz compared to the
                    previous generation), L3 Cache capacity of 4MB and integrated
                    with iGPU Radeon Vega 3. iGPU Radeon Vega 3 has 3 NGCUs (192
                    processing threads) and operating clock speeds from 100MHz to
                    1.1GHz. With this iGPU, you can play E-sport games well with
                    high FPS.
                  </span>
                  <br />
                  <br />
                  <span>
                    New AMD Athlon™ processor, integrating advanced Radeon™ Vega
                    graphics processing technology for everyday users. The
                    highest-end processor combined with integrated Radeon Vega
                    graphics that AMD has ever created for consumers, has received
                    high praise for its rapid response, along with advanced
                    processor architecture. suitable for your daily tasks.
                  </span>
                  <br />
                  <br />
                  <span>
                    With the AMD Athlon 3000G CPU optimized for gaming, users can
                    surf the web smoothly and experience high-quality video
                    processing without lag thanks to integrated Radeon™ Graphics.
                    Thanks to that, users can admire today's hot games such as
                    League of Legends, Fifa Online,... at 720p resolution. At the
                    same time, the quality is improved thanks to the combination
                    with a FreeSync-enabled screen, providing perfect anti-tearing
                    ability, peace of mind with fast-moving games such as sports
                    games, shooting games,...
                  </span>
                  <br />
                </span>
              </div>
            </div>
            <div class="view-detail-product-rating1">
              <h1 class="view-detail-product-text37">
                <span>
                  Rating &amp; Reviews of AMD Athlon 3000G / 3.5GHz / 2 Cores 4
                  Threads / 5MB / AM4 Processor
                </span>
                <br />
              </h1>
              <div class="view-detail-product-feedback">
                <div class="view-detail-product-product-reviews">
                  <div class="view-detail-product-review">
                    <h1 class="view-detail-product-text40">
                      <span class="view-detail-product-text41">
                        PRODUCT REVIEWS
                      </span>
                      <br class="view-detail-product-text42" />
                    </h1>
                    <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon02">
                      <path
                        d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                      </path>
                    </svg>
                  </div>
                  <div class="view-detail-product-review1">
                    <div class="view-detail-product-name-vs-date">
                      <span class="view-detail-product-name-cus">
                        Pham Thanh Phong
                      </span>
                      <span class="view-detail-product-date-time">
                        <date-time-primitive format="DD/MM/YYYY"
                          date="Mon Jun 17 2024 15:33:26 GMT+0700 (Indochina Time)"></date-time-primitive>
                      </span>
                    </div>
                    <div class="view-detail-product-star-rating">
                      <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon04">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon06">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon08">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon10">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon12">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg>
                    </div>
                    <span>very good product</span>
                  </div>
                  <div class="view-detail-product-review2">
                    <div class="view-detail-product-name-vs-date1">
                      <span class="view-detail-product-name-cus1">
                        Pham Thanh Phong
                      </span>
                      <span class="view-detail-product-date-time1">
                        <date-time-primitive format="DD/MM/YYYY"
                          date="Mon Jun 17 2024 15:33:26 GMT+0700 (Indochina Time)"></date-time-primitive>
                      </span>
                    </div>
                    <div class="view-detail-product-star-rating1">
                      <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon14">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon16">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon18">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon20">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon22">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg>
                    </div>
                    <span>very good product</span>
                  </div>
                  <div class="view-detail-product-review3">
                    <div class="view-detail-product-name-vs-date2">
                      <span class="view-detail-product-name-cus2">
                        Pham Thanh Phong
                      </span>
                      <span class="view-detail-product-date-time2">
                        <date-time-primitive format="DD/MM/YYYY"
                          date="Mon Jun 17 2024 15:33:26 GMT+0700 (Indochina Time)"></date-time-primitive>
                      </span>
                    </div>
                    <div class="view-detail-product-star-rating2">
                      <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon24">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon26">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon28">
                        <path
                          d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon30">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg><svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon32">
                        <path
                          d="M649.714 573.714l174.857-169.714-241.143-35.429-108-218.286-108 218.286-241.143 35.429 174.857 169.714-41.714 240.571 216-113.714 215.429 113.714zM950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 15.429-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                        </path>
                      </svg>
                    </div>
                    <span>very good product</span>
                  </div>
                </div>
                <div class="view-detail-product-rating2">
                  <div class="view-detail-product-average-rating">
                    <span class="view-detail-product-average">3.0</span>
                    <span class="view-detail-product-five-star">/5</span>
                    <svg viewBox="0 0 950.8571428571428 1024" class="view-detail-product-icon34">
                      <path
                        d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z">
                      </path>
                    </svg>
                  </div>
                  <div class="view-detail-product-total-reviews">
                    <strong class="view-detail-product-number-review">(3)</strong>
                    <span class="view-detail-product-text43">
                      &nbsp;reviews &amp; comments
                    </span>
                  </div>
                  <button type="button" class="view-detail-product-submit-rrviews thq-button-filled button">
                    <svg viewBox="0 0 1024 1024" class="view-detail-product-icon36">
                      <path
                        d="M919.723 476.544l-78.891-52.565 41.984-85.035c6.315-12.8 5.845-27.904-1.28-40.235-7.168-12.373-19.968-20.352-34.219-21.248l-94.635-6.101-6.144-94.635c-0.853-14.251-8.875-27.093-21.205-34.219-12.373-7.125-27.52-7.68-40.235-1.28l-84.949 42.027-52.608-78.891c-15.829-23.765-55.168-23.765-70.997 0l-52.651 78.848-84.992-41.984c-12.757-6.4-27.904-5.845-40.235 1.28-12.373 7.125-20.352 19.968-21.248 34.219l-6.101 94.592-94.635 6.101c-14.251 0.939-27.093 8.917-34.219 21.248s-7.637 27.477-1.28 40.235l41.984 85.035-78.891 52.608c-11.861 7.936-18.987 21.248-18.987 35.499s7.125 27.563 18.987 35.499l78.933 52.608-42.027 84.992c-6.315 12.8-5.845 27.904 1.28 40.235s19.968 20.352 34.219 21.248l94.635 6.101 6.101 94.635c0.896 14.208 8.875 27.051 21.248 34.176s27.392 7.637 40.235 1.323l84.992-42.027 52.608 78.891c7.936 11.861 21.248 18.987 35.499 18.987s27.563-7.125 35.499-18.987l52.608-78.891 84.949 42.027c12.757 6.315 27.861 5.803 40.235-1.28 12.373-7.125 20.352-19.968 21.248-34.219l6.101-94.592 94.677-6.144c14.251-0.896 27.093-8.875 34.219-21.248s7.637-27.477 1.28-40.235l-41.984-84.992 78.891-52.608c11.861-7.936 18.987-21.248 18.987-35.499-0-14.251-7.125-27.605-18.987-35.499zM747.691 604.416l30.293 61.227-68.267 4.437c-21.419 1.408-38.443 18.432-39.851 39.851l-4.395 68.181-61.227-30.251c-19.2-9.557-42.496-3.285-54.4 14.592l-37.845 56.747-37.931-56.875c-8.149-12.245-21.675-18.987-35.541-18.987-6.357 0-12.8 1.408-18.859 4.437l-61.269 30.251-4.395-68.181c-1.365-21.376-18.432-38.443-39.851-39.851l-68.096-4.395 30.293-61.227c9.515-19.243 3.243-42.539-14.592-54.4l-56.875-37.931 56.832-37.888c17.835-11.904 24.064-35.2 14.592-54.4l-30.293-61.269 68.267-4.395c21.419-1.408 38.443-18.432 39.851-39.851l4.395-68.181 61.227 30.251c19.115 9.429 42.496 3.243 54.4-14.592l37.845-56.789 37.931 56.875c11.904 17.835 35.243 24.021 54.4 14.592l61.269-30.293 4.437 68.224c1.408 21.376 18.475 38.4 39.851 39.808l68.181 4.395-30.251 61.312c-9.515 19.243-3.243 42.496 14.592 54.4l56.832 37.888-56.875 37.931c-17.92 11.819-24.149 35.115-14.677 54.357z">
                      </path>
                    </svg>
                    <span class="view-detail-product-text44">
                      Submit your reviews
                    </span>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="chats-chats chats-root-class-name13">
            <div class="chats-container">
              <svg viewBox="0 0 1152 1024" class="chats-icon thq-button-icon thq-icon-medium">
                <path
                  d="M1088 901.166c0 45.5 26.028 84.908 64 104.184v15.938c-10.626 1.454-21.472 2.224-32.5 2.224-68.008 0-129.348-28.528-172.722-74.264-26.222 6.982-54.002 10.752-82.778 10.752-159.058 0-288-114.616-288-256s128.942-256 288-256c159.058 0 288 114.616 288 256 0 55.348-19.764 106.592-53.356 148.466-6.824 14.824-10.644 31.312-10.644 48.7zM512 0c278.458 0 504.992 180.614 511.836 405.52-49.182-21.92-103.586-33.52-159.836-33.52-95.56 0-185.816 33.446-254.138 94.178-70.846 62.972-109.862 147.434-109.862 237.822 0 44.672 9.544 87.888 27.736 127.788-5.228 0.126-10.468 0.212-15.736 0.212-27.156 0-53.81-1.734-79.824-5.044-109.978 109.978-241.25 129.7-368.176 132.596v-26.916c68.536-33.578 128-94.74 128-164.636 0-9.754-0.758-19.33-2.164-28.696-115.796-76.264-189.836-192.754-189.836-323.304 0-229.75 229.23-416 512-416z">
                </path>
              </svg>
              <span class="chats-text">Chats with support</span>
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
        </div>
      </div>
      <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
    </body>

    </html>