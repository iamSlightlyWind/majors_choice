<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ViewAllProductCPU - Major's Choice1</title>
    <meta property="og:title" content="ViewAllProductCPU - Major's Choice1" />
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
      <link href="../css/view-all-product-cpu.css" rel="stylesheet" />

      <div class="view-all-product-cpu-container">
        <div class="view-all-product-cpu-header">
          <div class="navbar-container navbar-root-class-name">
            <div class="navbar-container1"></div>
            <header class="navbar-container2">
              <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                <img
                  alt="pastedImage"
                  src="../css/image/logo.png"
                  class="navbar-pasted-image"
                />
                <div data-thq="thq-navbar-nav" class="navbar-desktop-menu">
                  <nav class="navbar-links">
                    <form action="/ssdsservlet" method="post">
                    <div class="navbar-container3">
                      <input
                        type="text"
                        placeholder="Search product by name"
                        class="navbar-textinput input"
                        name="searchName"
                        value="${requestScope.searchName}"
                      />
                      <button type="submit" value="Search" class="navbar-search thq-button-filled">
                        <span class="navbar-text thq-body-small">
                          <span>Search</span>
                          <br />
                        </span>
                      </button>
                    </div>
                      </form>
                    <div class="navbar-container4">
                      <a
                        href="home-page.html"
                        class="navbar-home thq-body-small thq-link"
                      >
                        <span>Home</span>
                      </a>
                      <span class="navbar-contact thq-body-small thq-link">
                        <span>Contact</span>
                      </span>
                      <span class="navbar-whoweare thq-body-small thq-link">
                        <span>Who we are</span>
                      </span>
                      <span
                        class="navbar-manager-order thq-body-small thq-link"
                      >
                        Manager Order
                      </span>
                    </div>
                  </nav>
                  <div class="navbar-buttons">
                    <svg
                      viewBox="0 0 1024 1024"
                      class="navbar-icon thq-button-icon thq-icon-medium"
                    >
                      <path
                        d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z"
                      ></path></svg
                    ><svg
                      viewBox="0 0 1024 1024"
                      class="navbar-icon02 thq-button-icon thq-icon-medium"
                    >
                      <path
                        d="M768 682l86 86v42h-684v-42l86-86v-212q0-100 51-174t141-96v-30q0-26 18-45t46-19 46 19 18 45v30q90 22 141 96t51 174v212zM512 938q-36 0-61-24t-25-60h172q0 34-26 59t-60 25z"
                      ></path>
                    </svg>
                    <a
                      href="login.html"
                      class="navbar-account thq-button-filled"
                    >
                      <svg
                        viewBox="0 0 731.4285714285713 1024"
                        class="navbar-icon04"
                      >
                        <path
                          d="M731.429 799.429c0 83.429-54.857 151.429-121.714 151.429h-488c-66.857 0-121.714-68-121.714-151.429 0-150.286 37.143-324 186.857-324 46.286 45.143 109.143 73.143 178.857 73.143s132.571-28 178.857-73.143c149.714 0 186.857 173.714 186.857 324zM585.143 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z"
                        ></path>
                      </svg>
                    </a>
                  </div>
                </div>
                <div data-thq="thq-burger-menu" class="navbar-burger-menu">
                  <svg viewBox="0 0 1024 1024" class="navbar-icon06">
                    <path
                      d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z"
                    ></path>
                  </svg>
                </div>
                <div data-thq="thq-mobile-menu" class="navbar-mobile-menu">
                  <div class="navbar-nav">
                    <div class="navbar-top">
                      <div class="navbar-container5">
                        <img
                          alt="pastedImage"
                          src="public/external/pastedimage-bdsl-200h.png"
                          class="navbar-pasted-image1"
                        />
                      </div>
                      <div data-thq="thq-close-menu" class="navbar-close-menu">
                        <svg viewBox="0 0 1024 1024" class="navbar-icon08">
                          <path
                            d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z"
                          ></path>
                        </svg>
                      </div>
                    </div>
                    <nav class="navbar-links1">
                      <div class="navbar-container6">
                        <input
                          type="text"
                          placeholder="Search product by name"
                          class="navbar-textinput1 input"
                          name="searchName"
                        value="${requestScope.searchName}"
                        />
                        <button
                          class="navbar-search1 thq-button-filled thq-button-animated"
                        >
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
          <div class="menu-function-container menu-function-root-class-name">
            <div class="menu-function-manager">
              <span
                class="menu-function-mgt-ware-house text1 thq-link1 thq-body-small"
              >
                <span>Manager WareHouse</span>
              </span>
              <span
                class="menu-function-mgt-customer text1 thq-link1 thq-body-small"
              >
                Manager Customer
              </span>
              <span
                class="menu-function-mgt-feebcack text1 thq-link1 thq-body-small"
              >
                <span>Feedback</span>
                <br />
              </span>
              <span
                class="menu-function-mgt-staff text1 thq-link1 thq-body-small"
              >
                Manager Staff
              </span>
              <span
                class="menu-function-mgt-report text1 thq-link1 thq-body-small"
              >
                Financial Reports
              </span>
            </div>
          </div>
        </div>
        <div class="view-all-product-cpu-body">
          <div class="view-all-product-cpu-link-page">
            <span class="view-all-product-cpu-text thq-body-small thq-link">
              Home&nbsp;
            </span>
            <span class="view-all-product-cpu-text01">
              / CPU -&nbsp;Computer processor
            </span>
          </div>
          <div class="chats-chats chats-root-class-name">
            <div class="chats-container">
              <svg
                viewBox="0 0 1152 1024"
                class="chats-icon thq-button-icon thq-icon-medium"
              >
                <path
                  d="M1088 901.166c0 45.5 26.028 84.908 64 104.184v15.938c-10.626 1.454-21.472 2.224-32.5 2.224-68.008 0-129.348-28.528-172.722-74.264-26.222 6.982-54.002 10.752-82.778 10.752-159.058 0-288-114.616-288-256s128.942-256 288-256c159.058 0 288 114.616 288 256 0 55.348-19.764 106.592-53.356 148.466-6.824 14.824-10.644 31.312-10.644 48.7zM512 0c278.458 0 504.992 180.614 511.836 405.52-49.182-21.92-103.586-33.52-159.836-33.52-95.56 0-185.816 33.446-254.138 94.178-70.846 62.972-109.862 147.434-109.862 237.822 0 44.672 9.544 87.888 27.736 127.788-5.228 0.126-10.468 0.212-15.736 0.212-27.156 0-53.81-1.734-79.824-5.044-109.978 109.978-241.25 129.7-368.176 132.596v-26.916c68.536-33.578 128-94.74 128-164.636 0-9.754-0.758-19.33-2.164-28.696-115.796-76.264-189.836-192.754-189.836-323.304 0-229.75 229.23-416 512-416z"
                ></path>
              </svg>
              <span class="chats-text">Chats with support</span>
            </div>
          </div>
          <div class="view-all-product-cpu-product">
            <div class="view-all-product-cpu-container01">
              <div class="view-all-product-cpu-container02">
                <svg viewBox="0 0 1024 1024" class="view-all-product-cpu-icon">
                  <path
                    d="M846.72 170.667l-281.984 333.397c-6.272 7.381-10.069 17.024-10.069 27.563v295.339l-85.333-42.667v-252.672c0.043-9.685-3.285-19.499-10.069-27.563l-281.984-333.397zM938.667 85.333h-853.333c-23.552 0-42.667 19.115-42.667 42.667 0 10.539 3.797 20.181 10.069 27.563l331.264 391.68v263.424c0 16.597 9.472 31.019 23.595 38.144l170.667 85.333c21.077 10.539 46.72 2.005 57.259-19.072 3.072-6.229 4.523-12.843 4.48-19.072v-348.757l331.264-391.68c15.232-18.005 12.971-44.928-5.035-60.117-8.064-6.827-17.877-10.155-27.563-10.112z"
                  ></path>
                </svg>
                <h1 class="view-all-product-cpu-text02">
                  <span>Search filter</span>
                  <br />
                </h1>
              </div>
                <c:set var="name" value="${requestScope.searchName}" scope="page"/> 
              <form class="view-all-product-cpu-form" action="/filterssd" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="nameSearch" value="${name}"/>
                <span class="view-all-product-cpu-text05">
                  <span>Frice</span>
                  <br />
                </span>
                <div class="view-all-product-cpu-container03">
                  <span class="view-all-product-cpu-text08">
                    <span>From</span>
                    <br />
                  </span>
                  <input
                    type="number"
                    id="from"
                    placeholder="min "
                    class="view-all-product-cpu-textinput input"
                    name="from"
                    value="${requestScope.from}"
                  />
                </div>
                <div class="view-all-product-cpu-container04">
                  <span class="view-all-product-cpu-text11">
                    <span>To</span>
                    <br />
                  </span>
                  <input
                    type="number"
                    id="to"
                    placeholder="max"
                    class="view-all-product-cpu-textinput1 input"
                    name="to"
                    value="${requestScope.to}"
                  />
                </div>
                  <hr>
                  <c:set var="interfaces" value="${requestScope.interfaces}" />  
                  <span class="view-all-product-cpu-text14">
                      <span>Interface</span>
                      <br />
                  </span>
                  <div class="view-all-product-cpu-container05">
                      <input
                          type="checkbox"
                          class="view-all-product-cpu-checkbox"
                          name="interfaces"
                          value="PCIe 3.0"
                              <c:forEach var="interfacee" items="${interfaces}">
                                  <c:if test="${interfacee == 'PCIe 3.0'}">
                                      checked
                                  </c:if>
                              </c:forEach>
                          />
                      <span class="view-all-product-cpu-text17">
                          <span>PCIe 3.0</span>
                          <br />
                      </span>
                  </div>
                  <div class="view-all-product-cpu-container05">
                      <input
                          type="checkbox"
                          class="view-all-product-cpu-checkbox"
                          name="interfaces"
                          value="PCIe 4.0"
                              <c:forEach var="interfacee" items="${interfaces}">
                                  <c:if test="${interfacee == 'PCIe 4.0'}">
                                      checked
                                  </c:if>
                              </c:forEach>
                          />
                      <span class="view-all-product-cpu-text17">
                          <span>PCIe 4.0</span>
                          <br />
                      </span>
                  </div>  
                  <div class="view-all-product-cpu-container05">
                      <input
                          type="checkbox"
                          class="view-all-product-cpu-checkbox"
                          name="interfaces"
                          value="SATA 2.5"
                              <c:forEach var="interfacee" items="${interfaces}">
                                  <c:if test="${interfacee == 'SATA 2.5'}">
                                      checked
                                  </c:if>
                              </c:forEach>
                          />
                      <span class="view-all-product-cpu-text17">
                          <span>SATA 2.5</span>
                          <br />
                      </span>
                  </div> 
                  <hr> 
                 <span class="view-all-product-cpu-text05">
                  <span>Capacity</span>
                  <br />
                </span>
                <div class="view-all-product-cpu-container03">
                  <span class="view-all-product-cpu-text08">
                    <span>From</span>
                    <br />
                  </span>
                  <input
                    type="number"
                    id="from"
                    placeholder="min "
                    class="view-all-product-cpu-textinput input"
                    name="fromCapacity"
                    value="${requestScope.fromCapacity}"
                  />
                </div>
                <div class="view-all-product-cpu-container04">
                  <span class="view-all-product-cpu-text11">
                    <span>To</span>
                    <br />
                  </span>
                  <input
                    type="number"
                    id="to"
                    placeholder="max"
                    class="view-all-product-cpu-textinput1 input"
                    name="toCapacity"
                    value="${requestScope.toCapacity}"
                  />
                </div>                                                        
                <hr> 
                <c:set var="caches" value="${requestScope.caches}" />
                <span class="view-all-product-cpu-text05">
                  <span>Cache</span>
                  <br />
                </span>
                <div class="view-all-product-cpu-container06">
                  <input
                    type="checkbox"
                    class="view-all-product-cpu-checkbox1"
                    name="cache"
                    value="0"
                        <c:forEach var="cache" items="${caches}">
                            <c:if test="${cache == '0'}">
                                checked
                            </c:if>
                        </c:forEach>
                  />
                  <span class="view-all-product-cpu-text20">
                    <span>0</span>
                    <br />
                  </span>
                </div>
                <div class="view-all-product-cpu-container06">
                  <input
                    type="checkbox"
                    class="view-all-product-cpu-checkbox1"
                    name="cache"
                    value="1"
                        <c:forEach var="cache" items="${caches}">
                            <c:if test="${cache == '1'}">
                                checked
                            </c:if>
                        </c:forEach>
                  />
                  <span class="view-all-product-cpu-text20">
                    <span>Other</span>
                    <br />
                  </span>
                </div>                              
                <button type="submit" value="Filter">Filter</button>
              </form>                         
            </div>
            <div class="view-all-product-cpu-container09">
              <c:forEach var="ssd" items="${requestScope.ssds}" >
                    <div class="component1-container component1-root-class-name">
                        <img
                            alt="image"
                            src="public/New Folder/gearvn-amd-athlon-3000g_9a96ebfbbf3f43c7a61cdba59b00e5b5_fc7e2a8f09b24c55b154d39cf9ce96a7_grande-1500h.webp"
                            loading="eager"
                            class="component1-image"
                            />
                        <h1 class="component1-text thq-link">
                            <span>
                                <a href="/view/detail/product?category=ssd&id=${ssd.id}">${ssd.name}</a>
                            </span>
                        </h1>
                        <span class="component1-text1">
                            <span>${ssd.sellingPrice}</span>
                            <br />
                        </span>
                        <div class="component1-container1">
                            <span class="component1-text4"><span>0.0</span></span>
                            <svg
                                viewBox="0 0 950.8571428571428 1024"
                                class="component1-icon"
                                >
                            <path
                                d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z"
                                ></path>
                            </svg>
                            <a
                                href="https://example.com"
                                target="_blank"
                                rel="noreferrer noopener"
                                class="component1-link"
                                >
                                <span>(0 Review)</span>
                            </a>
                        </div>
                    </div> 
              </c:forEach>  
            </div>
          </div>
          <svg viewBox="0 0 1024 1024" class="view-all-product-cpu-icon2">
            <path
              d="M846.72 170.667l-281.984 333.397c-6.272 7.381-10.069 17.024-10.069 27.563v295.339l-85.333-42.667v-252.672c0.043-9.685-3.285-19.499-10.069-27.563l-281.984-333.397zM938.667 85.333h-853.333c-23.552 0-42.667 19.115-42.667 42.667 0 10.539 3.797 20.181 10.069 27.563l331.264 391.68v263.424c0 16.597 9.472 31.019 23.595 38.144l170.667 85.333c21.077 10.539 46.72 2.005 57.259-19.072 3.072-6.229 4.523-12.843 4.48-19.072v-348.757l331.264-391.68c15.232-18.005 12.971-44.928-5.035-60.117-8.064-6.827-17.877-10.155-27.563-10.112z"
            ></path>
          </svg>
        </div>
        <div class="view-all-product-cpu-footer">
          <div
            class="contact-contact20 thq-section-padding contact-root-class-name2"
          >
            <div class="contact-max-width thq-section-max-width">
              <div class="contact-section-title">
                <span class="thq-body-small">
                  <span>
                    Our customer service team is available to help you with any
                    inquiries.
                  </span>
                </span>
                <div class="contact-content">
                  <h2 class="thq-heading-2"><span>Contact Us</span></h2>
                  <p class="contact-text2 thq-body-large">
                    <span>
                      Have a question or need assistance? Feel free to reach out
                      to us.
                    </span>
                  </p>
                </div>
              </div>
              <div class="contact-row">
                <div class="contact-content1">
                  <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                    <path
                      d="M854 342v-86l-342 214-342-214v86l342 212zM854 170q34 0 59 26t25 60v512q0 34-25 60t-59 26h-684q-34 0-59-26t-25-60v-512q0-34 25-60t59-26h684z"
                    ></path>
                  </svg>
                  <div class="contact-contact-info">
                    <div class="contact-content2">
                      <h3 class="contact-text3 thq-heading-3">Email</h3>
                      <p class="contact-text4 thq-body-large">
                        <span>
                          For business inquiries or partnerships, please contact
                          us via email.
                        </span>
                      </p>
                    </div>
                    <span class="contact-email thq-body-small">
                      <span>support@themajorones.dev</span>
                    </span>
                  </div>
                </div>
                <div class="contact-content3">
                  <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                    <path
                      d="M282 460q96 186 282 282l94-94q20-20 44-10 72 24 152 24 18 0 30 12t12 30v150q0 18-12 30t-30 12q-300 0-513-213t-213-513q0-18 12-30t30-12h150q18 0 30 12t12 30q0 80 24 152 8 26-10 44z"
                    ></path>
                  </svg>
                  <div class="contact-contact-info1">
                    <div class="contact-content4">
                      <h3 class="contact-text5 thq-heading-3">Phone</h3>
                      <p class="contact-text6 thq-body-large">
                        <span>
                          Follow us on social media for the latest updates and
                          promotions.
                        </span>
                      </p>
                    </div>
                    <span class="contact-phone thq-body-small">
                      <span>+84 929199387</span>
                    </span>
                  </div>
                </div>
                <div class="contact-content5">
                  <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                    <path
                      d="M512 0c-176.732 0-320 143.268-320 320 0 320 320 704 320 704s320-384 320-704c0-176.732-143.27-320-320-320zM512 512c-106.040 0-192-85.96-192-192s85.96-192 192-192 192 85.96 192 192-85.96 192-192 192z"
                    ></path>
                  </svg>
                  <div class="contact-contact-info2">
                    <div class="contact-content6">
                      <h3 class="contact-text7 thq-heading-3">Office</h3>
                      <p class="contact-text8 thq-body-large">
                        <span>
                          We value your feedback and strive to provide the best
                          shopping experience.
                        </span>
                      </p>
                    </div>
                    <span class="contact-address thq-body-small">
                      <span>123 Main Street, City, Country</span>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <footer
            class="footer-footer1 thq-section-padding footer-root-class-name4"
          >
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
                        <input
                          type="email"
                          placeholder="Enter your email"
                          class="footer-text-input thq-input"
                        />
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
                        <svg
                          viewBox="0 0 877.7142857142857 1024"
                          class="thq-icon-small"
                        >
                          <path
                            d="M713.143 73.143c90.857 0 164.571 73.714 164.571 164.571v548.571c0 90.857-73.714 164.571-164.571 164.571h-107.429v-340h113.714l17.143-132.571h-130.857v-84.571c0-38.286 10.286-64 65.714-64l69.714-0.571v-118.286c-12-1.714-53.714-5.143-101.714-5.143-101.143 0-170.857 61.714-170.857 174.857v97.714h-114.286v132.571h114.286v340h-304c-90.857 0-164.571-73.714-164.571-164.571v-548.571c0-90.857 73.714-164.571 164.571-164.571h548.571z"
                          ></path>
                        </svg>
                        <span class="thq-body-small">Facebook</span>
                      </div>
                      <div class="footer-link1">
                        <svg
                          viewBox="0 0 877.7142857142857 1024"
                          class="thq-icon-small"
                        >
                          <path
                            d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z"
                          ></path>
                        </svg>
                        <span class="thq-body-small">Instagram</span>
                      </div>
                      <div class="footer-link2">
                        <svg viewBox="0 0 1024 1024" class="footer-icon4">
                          <path
                            d="M854 342v-86l-342 214-342-214v86l342 212zM854 170q34 0 59 26t25 60v512q0 34-25 60t-59 26h-684q-34 0-59-26t-25-60v-512q0-34 25-60t59-26h684z"
                          ></path>
                        </svg>
                        <span class="thq-body-small">
                          Email :&nbsp;support@themajorones.dev
                        </span>
                      </div>
                      <div class="footer-link3">
                        <svg viewBox="0 0 1024 1024" class="footer-icon6">
                          <path
                            d="M282 460q96 186 282 282l94-94q20-20 44-10 72 24 152 24 18 0 30 12t12 30v150q0 18-12 30t-30 12q-300 0-513-213t-213-513q0-18 12-30t30-12h150q18 0 30 12t12 30q0 80 24 152 8 26-10 44z"
                          ></path>
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
    </div>
<script>
    function validateForm() {
        var from = parseFloat(document.getElementById("from").value);
        var to = parseFloat(document.getElementById("to").value);

        if (from<0 || to<0) {
            alert("Please enter valid numbers for 'From' and 'To'.");
            return false;
        }

        if (from > to) {
            alert("The 'From' value cannot be greater than the 'To' value. Please enter again.");
            return false;
        }
        
        return true; // Allow form submission
    }
</script>
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
</html>
