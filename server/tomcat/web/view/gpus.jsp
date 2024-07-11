<%-- 
    Document   : cpus1
    Created on : Jul 11, 2024, 4:53:20 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ViewCategory - Major's Choice1</title>
    <meta property="og:title" content="ViewCategory - Major's Choice1" />
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
      <link href="../css/view-category.css" rel="stylesheet" />

      <div class="view-category-container">
        <div class="view-category-header">
          <div class="navmain-container navmain-root-class-name">
            <header class="navmain-container1"></header>
            <header class="navmain-container2">
              <header data-thq="thq-navbar" class="navmain-navbar-interactive">
                <a href="/" class="navmain-link">
                  <img
                    alt="pastedImage"
                    src="../css/image/logo.png" 
                    class="navmain-pasted-image"
                  />
                </a>
                <div data-thq="thq-navbar-nav" class="navmain-desktop-menu">
                  <nav class="navmain-links">
                      <form action="/CPU" method="post">
                    <div class="navmain-container3">
                      <input
                        type="text"
                        placeholder="Search for product"
                        name="searchName" value="${requestScope.searchName}"
                        class="navmain-textinput input"
                      />
                      <button class="navmain-search thq-button-filled" type="submit" value="Search" >
                        <span class="navmain-text thq-body-small">
                          <span>Search</span>
                          <br />
                        </span>
                      </button>
                    </div>
                     </form>     
                    <div class="navmain-container4">
                      <a
                        href="/"
                        class="navmain-home thq-body-small thq-link"
                      >
                        <span>Home</span>
                      </a>
                      <span class="navmain-contact thq-body-small thq-link">
                        Contact Us
                      </span>
                      <span class="navmain-whoweare thq-body-small thq-link">
                        <span>Who we are</span>
                      </span>
                      <a
                        href="/order"
                        class="navmain-manager-order thq-body-small thq-link"
                      >
                        Manage Order
                      </a>
                    </div>
                  </nav>
                  <div class="navmain-buttons">
                    <a
                      href="/Cart"
                      rel="noreferrer noopener"
                      class="navmain-link1"
                    >
                      <svg
                        viewBox="0 0 1024 1024"
                        class="navmain-icon thq-button-icon thq-icon-medium"
                      >
                        <path
                          d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z"
                        ></path>
                      </svg>
                    </a>
                    <a
                      href="/profile"
                      rel="noreferrer noopener"
                      class="navmain-account thq-button-filled"
                    >
                      <svg
                        viewBox="0 0 731.4285714285713 1024"
                        class="navmain-icon2"
                      >
                        <path
                          d="M731.429 799.429c0 83.429-54.857 151.429-121.714 151.429h-488c-66.857 0-121.714-68-121.714-151.429 0-150.286 37.143-324 186.857-324 46.286 45.143 109.143 73.143 178.857 73.143s132.571-28 178.857-73.143c149.714 0 186.857 173.714 186.857 324zM585.143 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z"
                        ></path>
                      </svg>
                    </a>
                  </div>
                </div>
                <div data-thq="thq-burger-menu" class="navmain-burger-menu">
                  <svg viewBox="0 0 1024 1024" class="navmain-icon4">
                    <path
                      d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z"
                    ></path>
                  </svg>
                </div>
                <div data-thq="thq-mobile-menu" class="navmain-mobile-menu">
                  <div class="navmain-nav">
                    <div class="navmain-top">
                      <div class="navmain-container5">
                        <img
                          alt="pastedImage"
                          src="../css/image/logo.png"
                          class="navmain-pasted-image1"
                        />
                      </div>
                      <div data-thq="thq-close-menu" class="navmain-close-menu">
                        <svg viewBox="0 0 1024 1024" class="navmain-icon6">
                          <path
                            d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z"
                          ></path>
                        </svg>
                      </div>
                    </div>
                    <nav class="navmain-links1">
                      <div class="navmain-container6">
                        <input
                          type="text"
                          placeholder="Search product by name"
                          class="navmain-textinput1 input"
                        />
                        <button
                          class="navmain-search1 thq-button-filled thq-button-animated"
                        >
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
          <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role) || "manager"
              .equals(role)) { %>              
          <div class="navstaff-container navstaff-root-class-name">
            <div class="navstaff-manager">
              <span
                class="navstaff-mgt-ware-house text1 thq-link1 thq-body-small"
              >
                Manage WareHouse
              </span>
              <a
                href="manage/profile?actor=user.html"
                class="navstaff-mgt-customer text1 thq-link1 thq-body-small"
              >
                Manage Customer
              </a>
                <c:if test="${sessionScope.role == 'manager'}">
              <a
                href="manage/profile?actor=staff.html"
                class="navstaff-mgt-staff text1 thq-link1 thq-body-small"
              >
                Manage Staff
              </a>
              <span class="navstaff-mgt-report text1 thq-link1 thq-body-small">
                Statistics
              </span>
              </c:if>   
            </div>
          </div>
            <% } %>
        </div>
        <div class="view-category-body">
          <div class="view-category-link-page">
            <span class="view-category-text thq-body-small thq-link">
                <a href="/"> Home&nbsp;</a>
            </span>
            <span class="view-category-text01">
                / <a href="/CPU">GPU -&nbsp;Computer processor</a>
            </span>
          </div>
          <div class="view-category-product">
            <div class="view-category-container01">
              <div class="view-category-container02">
                <svg viewBox="0 0 1024 1024" class="view-category-icon">
                  <path
                    d="M846.72 170.667l-281.984 333.397c-6.272 7.381-10.069 17.024-10.069 27.563v295.339l-85.333-42.667v-252.672c0.043-9.685-3.285-19.499-10.069-27.563l-281.984-333.397zM938.667 85.333h-853.333c-23.552 0-42.667 19.115-42.667 42.667 0 10.539 3.797 20.181 10.069 27.563l331.264 391.68v263.424c0 16.597 9.472 31.019 23.595 38.144l170.667 85.333c21.077 10.539 46.72 2.005 57.259-19.072 3.072-6.229 4.523-12.843 4.48-19.072v-348.757l331.264-391.68c15.232-18.005 12.971-44.928-5.035-60.117-8.064-6.827-17.877-10.155-27.563-10.112z"
                  ></path>
                </svg>
                <c:set var="name" value="${requestScope.searchName}" scope="page" />
                <h1 class="view-category-text02">
                  <span>Search filter</span>
                  <br />
                </h1>
              </div>
              <form class="view-category-form" action="/FilterGPU" method="post"
                  onsubmit="return validateForm()">
                  <input type="hidden" name="nameSearch" value="${name}" />
                <span class="view-category-text05">
                  <span>Frice</span>
                  <br />
                </span>
                <div class="view-category-container03">
                  <span class="view-category-text08">
                    <span>From</span>
                    <br />
                  </span>
                  <input
                    placeholder="min "
                    type="number" id="from"
                     name="from" value="${requestScope.from}"
                    class="view-category-textinput input"
                  />
                </div>
                <div class="view-category-container04">
                  <span class="view-category-text11">
                    <span>To</span>
                    <br />
                  </span>
                  <input
                    type="number" id="to"
                    name="to" value="${requestScope.to}"
                    placeholder="max "
                    class="view-category-textinput1 input"
                  />
                </div>
                 <c:set var="brands" value="${requestScope.brands}" />    
                 <div class="view-category-form">
                     <span class="view-category-text14">
                         <span>Brand</span>
                         <br />
                     </span>
                     <div class="view-category-container05">
                         <input
                             type="checkbox"
                             class="view-category-checkbox"
                             name="brand" value="amd" 
                             <c:forEach var="brand" items="${brands}">
                                 <c:if test="${brand == 'amd'}">
                                     checked
                                 </c:if>
                             </c:forEach>
                             />
                         <span class="view-category-text17">
                             <span>AMD</span>
                             <br />
                         </span>
                     </div>
                     <div class="view-category-container06">
                         <input
                             type="checkbox"
                             name="brand" value="intel"
                             class="view-category-checkbox1"
                             <c:forEach var="brand" items="${brands}">
                                 <c:if test="${brand == 'nvidia'}">
                                     checked
                                 </c:if>
                             </c:forEach>
                             />
                         <span class="view-category-text20">
                             <span>NVIDIA</span>
                             <br />
                         </span>
                     </div>
                 </div>
                <c:set var="generations" value="${requestScope.generations}" />   
                 <div class="view-category-form">
                     <span class="view-category-text14">
                         <span>Genernation</span>
                         <br />
                     </span>
                     <div class="view-category-container05">
                         <input
                             type="checkbox"
                             class="view-category-checkbox"
                             name="generation" value="rdna" 
                             <c:forEach var="generation" items="${generations}">
                                 <c:if test="${generation == 'rdna'}">
                                     checked
                                 </c:if>
                             </c:forEach>
                             />
                         <span class="view-category-text17">
                             <span>RDNA</span>
                             <br />
                         </span>
                     </div>
                     <div class="view-category-container06">
                         <input
                             type="checkbox"
                             name="generation" value="ampere"
                             class="view-category-checkbox1"
                              <c:forEach var="generation" items="${generations}">
                    <c:if test="${generation == 'ampere'}">
                      checked
                    </c:if>
                    </c:forEach>
                             />
                         <span class="view-category-text20">
                             <span>Ampere</span>
                             <br />
                         </span>
                     </div>
                     <div class="view-category-container06">
                         <input
                             type="checkbox"
                             class="view-category-checkbox1"
                              name="generation" value="ada lovelace"
                      <c:forEach var="generation" items="${generations}">
                    <c:if test="${generation == 'ada lovelace' || generation == 'adalovelace'}">
                      checked
                    </c:if>
                    </c:forEach>
                             />
                         <span class="view-category-text20">
                             <span>Ada Love Lace</span>
                             <br />
                         </span>
                     </div>                    
                 </div>
                
                 <div class="view-category-form">
                     <span class="view-category-text05">
                         <span>Vram</span>
                         <br />
                     </span>
                     <div class="view-category-container03">
                         <span class="view-category-text08">
                             <span>From</span>
                             <br />
                         </span>
                         <input
                             placeholder="min " id="Vramfrom"
                             name="fromVRAM" value="${requestScope.fromVRAM}"
                             class="view-category-textinput input"
                             />
                     </div>
                     <div class="view-category-container04">
                         <span class="view-category-text11">
                             <span>To</span>
                             <br />
                         </span>
                         <input
                             type="number" id="Vramto"
                             name="toVRAM" value="${requestScope.toVRAM}"
                             placeholder="max "
                             class="view-category-textinput1 input"
                             />
                     </div>
                 </div>
                 <div class="view-category-form">
                    <span class="view-category-text05">
                        <span>TDP</span>
                        <br />
                    </span>
                    <div class="view-category-container03">
                        <span class="view-category-text08">
                            <span>From</span>
                            <br />
                        </span>
                        <input
                            placeholder="min "
                            type="number" id="TDPfrom"
                            name="fromTDP" value="${requestScope.fromTDP}"
                            class="view-category-textinput input"
                            />
                    </div>
                    <div class="view-category-container04">
                        <span class="view-category-text11">
                            <span>To</span>
                            <br />
                        </span>
                        <input
                            type="number" id="TDPto"
                            name="toTDP" value="${requestScope.toTDP}"
                            placeholder="max "
                            class="view-category-textinput1 input"
                            />
                    </div>
                 </div>
                <button
                    type="submit"
                    value="Filter"
                    class="view-category-button button thq-button-outline"
                    >
                    <span>
                        <span>Filter</span>
                        <br />
                    </span>
                </button>           
              </form>             
            </div>
            <div class="view-category-container09">
                 <c:forEach var="gpu" items="${requestScope.gpus}">
                <a
                href="/view/detail/product?category=gpu&id=${gpu.id}"
                rel="noreferrer noopener"
              >
                <div class="product-container product-root-class-name116">
                  <img
                    alt="image"
                    src="../images/${gpu.id}.png"
                    loading="eager"
                    class="product-image"
                  />
                  <h1 class="product-text thq-link">
                    <span>
                      ${gpu.name}
                    </span>
                  </h1>
                  <span class="product-text1">
                    <span>
                        <fmt:setLocale value="vi_VN"/>
                      <fmt:formatNumber value="${gpu.sellingPrice}" type="number" pattern="#,###,###" var="GSellingPrice" />
                      <span id="sellingPrice">${GSellingPrice}<u>đ</u></span>
                    </span>
                    <br />
                  </span>
                  <div class="product-container1">
                    <span class="product-text4"><span>0.0</span></span>
                    <svg
                      viewBox="0 0 950.8571428571428 1024"
                      class="product-icon"
                    >
                      <path
                        d="M950.857 369.714c0 10.286-7.429 20-14.857 27.429l-207.429 202.286 49.143 285.714c0.571 4 0.571 7.429 0.571 11.429 0 14.857-6.857 28.571-23.429 28.571-8 0-16-2.857-22.857-6.857l-256.571-134.857-256.571 134.857c-7.429 4-14.857 6.857-22.857 6.857-16.571 0-24-13.714-24-28.571 0-4 0.571-7.429 1.143-11.429l49.143-285.714-208-202.286c-6.857-7.429-14.286-17.143-14.286-27.429 0-17.143 17.714-24 32-26.286l286.857-41.714 128.571-260c5.143-10.857 14.857-23.429 28-23.429s22.857 12.571 28 23.429l128.571 260 286.857 41.714c13.714 2.286 32 9.143 32 26.286z"
                      ></path>
                    </svg>
                    <span class="product-text5"><span>(0 Review)</span></span>
                  </div>
                </div>
              </a>
                </c:forEach>
            </div>
          </div>
          <svg viewBox="0 0 1024 1024" class="view-category-icon2">
            <path
              d="M846.72 170.667l-281.984 333.397c-6.272 7.381-10.069 17.024-10.069 27.563v295.339l-85.333-42.667v-252.672c0.043-9.685-3.285-19.499-10.069-27.563l-281.984-333.397zM938.667 85.333h-853.333c-23.552 0-42.667 19.115-42.667 42.667 0 10.539 3.797 20.181 10.069 27.563l331.264 391.68v263.424c0 16.597 9.472 31.019 23.595 38.144l170.667 85.333c21.077 10.539 46.72 2.005 57.259-19.072 3.072-6.229 4.523-12.843 4.48-19.072v-348.757l331.264-391.68c15.232-18.005 12.971-44.928-5.035-60.117-8.064-6.827-17.877-10.155-27.563-10.112z"
            ></path>
          </svg>
        </div>
        <div class="view-category-footer">
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
                        <a
                          href="mailto:support@themajorones.dev?subject=Support"
                          class="footer-social-link5 thq-body-small"
                        >
                          Email : support@themajorones.dev
                        </a>
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
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
  <script>
        function validateForm() {
          var from = parseFloat(document.getElementById("from").value);
          var to = parseFloat(document.getElementById("to").value);
          var Cfrom = parseFloat(document.getElementById("Vramfrom").value);
          var Cto = parseFloat(document.getElementById("Vramto").value);
          var Tfrom = parseFloat(document.getElementById("TDPfrom").value);
          var Tto = parseFloat(document.getElementById("TDPto").value);
          
          if (from < 0 || to < 0) {
            alert("Please enter valid numbers for 'From' and 'To' in Price.");
            return false;
          }

          if (from > to) {
            alert("The 'From' value cannot be greater than the 'To' value in Price. Please enter again.");
            return false;
          }
          
          if (Cfrom < 0 || Cto < 0) {
            alert("Please enter valid numbers for 'From' and 'To' in Core.");
            return false;
          }

          if (Cfrom > Cto) {
            alert("The 'From' value cannot be greater than the 'To' value in Core. Please enter again.");
            return false;
          }
          
          if (Tfrom < 0 || Tto < 0) {
            alert("Please enter valid numbers for 'From' and 'To' in TDP.");
            return false;
          }

          if (Tfrom > Tto) {
            alert("The 'From' value cannot be greater than the 'To' value in TDP. Please enter again.");
            return false;
          }

          return true; // Allow form submission
        }
      </script>
</html>

