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
                    <form action="/" method="post">
                      <div class="navbar-container3">                        
                              <input type="text" placeholder="Search product by name" name="searchName" class="navbar-textinput input"/>
                              <button class="navbar-search thq-button-filled" type="su">
                                  <span class="navbar-text thq-body-small">
                                      <span>Search</span>
                                      <br />
                                  </span>
                              </button>                         
                      </div>
                     </form>
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
                    <li data-thq="thq-dropdown" class="home-page-dropdown079 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle031">
                        <span class="home-page-text089">
                          <span style="color:red">Brand</span>
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
                                <a href="/filtercpu?brand=amd"><span>AMD</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtercpu?brand=intel"><span>Intel</span></a>
                              <br />
                            </span>
                          </div>
                        </li>                      
                      </ul>
                    </li>   
                   <li data-thq="thq-dropdown" class="home-page-dropdown026 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle026">
                        <span class="home-page-text075">
                          <span style="color:red">Generation</span>
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
                                <a href="/filtercpu?generation=Cezanne"><span>Cezanne</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown028 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle028">
                            <span class="home-page-text081">
                                <a href="/filtercpu?generation=Zen 3"><span>Zen 3</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown029 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle029">
                            <span class="home-page-text084">
                                <a href="/filtercpu?generation=raphael"><span>Raphael</span></a>
                              <br />
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown030 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle030">
                              <a href="/filtercpu?generation=raptorlake"><span class="home-page-text088">Raptor Lake</span></a>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown031 list-item"></li>
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown032 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle031">
                        <span class="home-page-text089">
                          <span style="color:red">Socket</span>
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
                                <a href="/filtercpu?socket=am4"><span>AM4</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtercpu?socket=am5"><span>AM5</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown035 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle034">
                              <a href="/filtercpu?socket=lga1700" class="home-page-text099"><span>LGA 1700</span></a>
                          </div>
                        </li>
                      </ul>
                    </li>                                          
                    <li data-thq="thq-dropdown" class="home-page-dropdown080 list-item"></li>
                  </ul>
                </div>
                <div data-thq="thq-dropdown" class="home-page-dropdown-psu list-item">
                  <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle166">
                    <span class="home-page-text423">
                      <span><a href="/psusservlet">GPU</a></span>
                      <br />
                    </span>
                    <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow30"></div>
                    <svg viewBox="0 0 1024 1024" class="home-page-icon60">
                      <path d="M426 726v-428l214 214z"></path>
                    </svg>
                  </div>
                  <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list30">                   
                    <li data-thq="thq-dropdown" class="home-page-dropdown195 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle171">
                          <span class="home-page-text430" style="color:red">Brand</span>
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
                                <a href="/filtergpu?brand=amd"><span>AMD</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtergpu?brand=nvidia"><span>NVIDIA</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>  
                    </li>                  
                    <li data-thq="thq-dropdown" class="home-page-dropdown201 list-item">
                        <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle171">
                            <span class="home-page-text430" style="color:red">Generation</span>
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
                                <a href="/filtergpu?generation=rdna"><span>RDNA</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtergpu?generation=ampere"><span>Ampere</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtergpu?generation=adalovelace"><span>Ada LoveLace</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>  
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown202 list-item"></li>
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
                            <span style="color:red">Socket</span>
                          <br />
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow25">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon50">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>                   
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filtermobo?socket=am4"><span>AM4</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?socket=am5"><span>AM5</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?socket=lga1700"><span>LGA 1700</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
                    
                    <li data-thq="thq-dropdown" class="home-page-dropdown172 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle161">
                          <span class="home-page-text418 list-item" style="color:red">
                          Form Factor
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow27">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon54">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>                  
                      <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filtermobo?formFactor=atx"><span>ATX</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?formFactor=matx"><span>mATX</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?formFactor=mITX"><span>mITX</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown176 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle162">
                          <span class="home-page-text419 list-item" style="color:red">Ram Type</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow28">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon56">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>                   
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filtermobo?ramType=ddr4"><span>DDR4</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?ramType=ddr5"><span>DDR5</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown180 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle163">
                          <span class="home-page-text420 list-item" style="color:red">
                          Wifi
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow29">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon58">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                         <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filtermobo?wifi=1"><span>Yes</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filtermobo?wifi=0"><span>No</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
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
                    <li data-thq="thq-dropdown" class="home-page-dropdown195 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle171">
                          <span class="home-page-text430" style="color:red">Efficiency</span>
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
                                <a href="/filterpsu?efficiency=80platin"><span>80+ platin</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterpsu?efficiency=80gold"><span>80+ gold</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                               <a href="/filterpsu?efficiency=80titani"><span>80+ titani</span></a>
                              <br />
                            </span>
                          </div>
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
                          <span class="home-page-name list-item" style="color:red">Generation</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow33">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon66">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filterram?generation=ddr4"><span>DDR4</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?generation=ddr5"><span>DDR5</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown207 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle179">
                          <span class="home-page-generation list-item" style="color:red">
                          Capacity
                        </span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow34">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon68">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filterram?capacity=16"><span>16</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?capacity=32"><span>32</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                         <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?capacity=64"><span>64</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown211 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle181">
                          <span class="home-page-text437 list-item" style="color:red">Spped</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow35">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon70">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                                          
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                
                                <a href="/filterram?speed=3000"><span>3000</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?speed=3200"><span>3200</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                         <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?speed=3600"><span>3600</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                               <a href="/filterram?speed=5600"><span>5600</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?speed=6000"><span>6000</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?speed=6400"><span>6400</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown215 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle183">
                          <span class="home-page-text438" style="color:red">Latency</span>
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
                                
                                <a href="/filterram?latency=15"><span>15</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?latency=16"><span>16</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                         <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?latency=18"><span>18</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                               <a href="/filterram?latency=36"><span>36</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?latency=38"><span>38</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul> 
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown216 list-item">
                        <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle183">
                          <span class="home-page-text438" style="color:red">Capacity</span>
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
                                
                                <a href="/filterram?capacity=16"><span>16</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?capacity=32"><span>32</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                         <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterram?capacity=64"><span>64</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        
                      </ul>
                    </li>
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
                          <span class="home-page-text442 list-item" style="color:red">Inteface</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow37">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon74">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filterssd?interfaces=PCIe3"><span class="home-page-text443">PCIe 3.0</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterssd?interfaces=PCIe4"><span class="home-page-text443">PCIe 4.0</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                         <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterssd?interfaces=SATA25"><span class="home-page-text443">SATA 2.5</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        
                      </ul>
                    </li>
                    <li data-thq="thq-dropdown" class="home-page-dropdown219 list-item">
                      <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle185">
                          <span class="home-page-text442 list-item" style="color:red">Cache</span>
                        <div data-thq="thq-dropdown-arrow" class="home-page-dropdown-arrow37">
                          <svg viewBox="0 0 1024 1024" class="home-page-icon74">
                            <path d="M426 726v-428l214 214z"></path>
                          </svg>
                        </div>
                      </div>                     
                        <ul data-thq="thq-dropdown-list" class="home-page-dropdown-list09">
                        <li data-thq="thq-dropdown" class="home-page-dropdown033 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle032">
                            <span class="home-page-text093">
                                <a href="/filterssd?cache=0"><span class="home-page-text443">0</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                        <li data-thq="thq-dropdown" class="home-page-dropdown034 list-item">
                          <div data-thq="thq-dropdown-toggle" class="home-page-dropdown-toggle033">
                            <span class="home-page-text096">
                                <a href="/filterssd?cache=1"><span class="home-page-text443">1</span></a>
                              <br />
                            </span>
                          </div>
                        </li>
                      </ul>
                    </li>
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
                          <a href="/view/detail/product?category=cpu&id=${cpu.id}">
                              <div class="component1-container component1-root-class-name4">
                                  <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                  <h1 class="component1-text thq-link">
                                      <span>
                                          ${cpu.name}
                                      </span>
                                  </h1>
                                  <span class="component1-text1">
                                      <fmt:setLocale value="vi_VN" />
                                      <fmt:formatNumber value="${cpu.sellingPrice}" pattern="###,###,###" var="cpuSelling" />
                                      <span>${cpuSelling}<u>đ</u></span>
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
                          </a>
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
                          <a href="/view/detail/product?category=gpu&id=${gpu.id}">
                              <div class="component1-container component1-root-class-name4">
                                  <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                  <h1 class="component1-text thq-link">
                                      <span>
                                          ${gpu.name}
                                      </span>
                                  </h1>
                                  <span class="component1-text1">
                                      <fmt:setLocale value="vi_VN" />
                                      <fmt:formatNumber value="${gpu.sellingPrice}" pattern="###,###,###" var="gpuSelling" />
                                      <span>${gpuSelling}<u>đ</u></span>
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
                          </a>
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
                          <a href="/view/detail/product?category=mobo&id=${mobo.id}">
                              <div class="component1-container component1-root-class-name4">
                                  <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                  <h1 class="component1-text thq-link">
                                      <span>
                                          ${mobo.name}
                                      </span>
                                  </h1>
                                  <span class="component1-text1">
                                      <fmt:setLocale value="vi_VN" />
                                      <fmt:formatNumber value="${mobo.sellingPrice}" pattern="###,###,###" var="moboSelling" />
                                      <span>${moboSelling}<u>đ</u></span>
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
                          </a>
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
                          <a href="/view/detail/product?category=psu&id=${psu.id}">
                              <div class="component1-container component1-root-class-name4">
                                  <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                  <h1 class="component1-text thq-link">
                                      <span>
                                          ${psu.name}
                                      </span>
                                  </h1>
                                  <span class="component1-text1">
                                      <fmt:setLocale value="vi_VN" /> 
                                      <fmt:formatNumber value="${psu.sellingPrice}" pattern="###,###,###" var="psuSelling" />
                                      <span>${psuSelling}<u>đ</u></span>
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
                          </a>
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
                            <a href="/view/detail/product?category=ram&id=${ram.id}">
                                <div class="component1-container component1-root-class-name4">
                                    <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                    <h1 class="component1-text thq-link">
                                        <span>
                                            ${ram.name}
                                        </span>
                                    </h1>
                                    <span class="component1-text1">
                                        <fmt:setLocale value="vi_VN" />
                                        <fmt:formatNumber value="${ram.sellingPrice}" pattern="###,###,###"  var="ramSelling" />
                                        <span>${ramSelling}<u>đ</u></span>
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
                            </a>
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
                          <a href="/view/detail/product?category=ssd&id=${ssd.id}">
                              <div class="component1-container component1-root-class-name4">
                                  <img alt="image" src="./css/image/amd300w.webp" loading="eager" class="component1-image" />
                                  <h1 class="component1-text thq-link">
                                      <span>
                                          ${ssd.name}
                                      </span>
                                  </h1>
                                  <span class="component1-text1">
                                      <fmt:setLocale value="vi_VN" />
                                      <fmt:formatNumber value="${ssd.sellingPrice}" pattern="###,###,###" var="ssdSelling" />
                                      <span>${ssdSelling}<u>đ</u></span>
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
                          </a>
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