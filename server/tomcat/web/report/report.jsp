<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Page - Major's Choice1</title>
    <meta property="og:title" content="Page - Major's Choice1" />
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
      <link href="../css/report.css" rel="stylesheet" />

      <div class="page-container">
        <div class="navmain-container navmain-root-class-name60">
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
                   <form action="/" method="post"> 
                  <div class="navmain-container3">
                    <input
                      type="text"
                      placeholder="Search for product"
                      class="navmain-textinput input"
                    />
                    <button class="navmain-search thq-button-filled">
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
                      <% if (!"staff".equals(request.getSession().getAttribute("table"))) { %>  
                      <a
                          href="/order"
                          class="navmain-manager-order thq-body-small thq-link"
                          >
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
                  <a
                    href="Cart.html"
                    target="_blank"
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
                        src="public/external/pastedimage-bdsl-200h.png"
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
        <div class="navstaff-container navstaff-root-class-name57">
          <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role) || "manager"
              .equals(role)) { %>  
          <div class="navstaff-manager">
            <a href="/cpus" class="navstaff-mgt-ware-house text1 thq-link1 thq-body-small">Manage
                    Warehouse</a>
            <a href="/manage/profile?actor=user"
                    class="navstaff-mgt-customer text1 thq-link1 thq-body-small">Manage Customer</a>
                  <a href="/order" class="navstaff-mgt-customer text1 thq-link1 thq-body-small">Manage Order</a>
                  <a href="/manage/profile?actor=staff" class="navstaff-mgt-staff text1 thq-link1 thq-body-small">Manage
                    Staff</a>
                  <a href="/stats" class="navstaff-mgt-report text1 thq-link1 thq-body-small">Statistics</a>
          </div>
          <% } %>
        </div>
        <div class="page-table">
          <h1 class="page-text">
            <span>Statistics</span>
            <br />
          </h1>
          <div class="page-list-detail">
              <form class="page-form-tittle" action="/stats" method="post" id="myForm">
              <span class="page-text03">From Date</span>
              <input
                  id="startDate"
                type="date"
                name="startDate"
                value="${startDate}"
                placeholder="placeholder"
                class="input page-textinput"
              />
              <span class="page-text04">To Date</span>
              <input
                  id="endDate"
                type="date"
                name="endDate"
                value="${endDate}"
                placeholder="placeholder"
                class="input page-textinput1"
              />
              <button type="submit" class="button page-button">Button</button>
            </form>
          </div>
          <div class="page-control">
            <div class="page-container01 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon">
                <path
                  d="M228 174l622 624-54 54-94-96q-38 34-104 48v92h-128v-92q-66-14-110-56t-48-108h94q8 90 128 90 74 0 102-40l-150-148q-166-50-166-168l-146-146zM534 294q-38 0-66 12l-62-62q28-14 64-24v-92h128v94q64 16 99 60t37 102h-94q-4-90-106-90z"
                ></path>
              </svg>
              <span class="page-text05">Expense</span>
              <fmt:setLocale value="vi_VN" />
              <fmt:formatNumber value="${TotalExpense}" type="number" pattern="#,###,###"
                                var="formattedSellingPrice" />
              <span class="page-text06">${formattedSellingPrice}đ</span>
            </div>
            <div class="page-container02 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon02">
                <path
                  d="M504 466q44 12 73 24t61 33 49 53 17 76q0 62-41 101t-109 51v92h-128v-92q-66-14-109-56t-47-108h94q8 90 126 90 62 0 89-23t27-53q0-72-128-104-200-46-200-176 0-58 42-99t106-55v-92h128v94q66 16 101 60t37 102h-94q-4-90-108-90-52 0-83 22t-31 58q0 58 128 92z"
                ></path>
              </svg>
              <span class="page-text07">Revenue</span>
              <fmt:setLocale value="vi_VN" />
              <fmt:formatNumber value="${TotalRevenue}" type="number" pattern="#,###,###"
                                var="RevenueSellingPrice" />
              <span class="page-text08">${RevenueSellingPrice}đ</span>
            </div>
            <div class="page-container03 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon04">
                <path
                  d="M480 64c-265.096 0-480 214.904-480 480 0 265.098 214.904 480 480 480 265.098 0 480-214.902 480-480 0-265.096-214.902-480-480-480zM480 928c-212.078 0-384-171.922-384-384s171.922-384 384-384c212.078 0 384 171.922 384 384s-171.922 384-384 384zM512 512v-128h128v-64h-128v-64h-64v64h-128v256h128v128h-128v64h128v64h64v-64h128.002l-0.002-256h-128zM448 512h-64v-128h64v128zM576.002 704h-64.002v-128h64.002v128z"
                ></path>
              </svg>
              <span class="page-text09">Profit</span>
              <fmt:setLocale value="vi_VN" />
              <fmt:formatNumber value="${Profit}" pattern="#,###,###"
                                var="ProfitSellingPrice" />
              <span class="page-text10">${ProfitSellingPrice}đ</span>
            </div>
            <div class="page-container04 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon06">
                <path
                  d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z"
                ></path>
              </svg>
              <span class="page-text11">Completed Sales</span>
              <span class="page-text12">${completedOrders}</span>
            </div>
            <div class="page-container05 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon08">
                <path d="M960 608l-288 288-96-96-64 64 160 160 352-352z"></path>
                <path
                  d="M448 768h320v-115.128c-67.22-39.2-156.308-66.11-256-74.26v-52.78c70.498-39.728 128-138.772 128-237.832 0-159.058 0-288-192-288s-192 128.942-192 288c0 99.060 57.502 198.104 128 237.832v52.78c-217.102 17.748-384 124.42-384 253.388h448v-64z"
                ></path>
              </svg>
              <span class="page-text13">Orders / Users</span>
              <span class="page-text14">${PercentageUsersWithCompletedOrders}% of all Users</span>
            </div>
            <div class="page-container06 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon11">
                <path
                  d="M128 896h896v128h-1024v-1024h128zM288 832c-53.020 0-96-42.98-96-96s42.98-96 96-96c2.828 0 5.622 0.148 8.388 0.386l103.192-171.986c-9.84-15.070-15.58-33.062-15.58-52.402 0-53.020 42.98-96 96-96s96 42.98 96 96c0 19.342-5.74 37.332-15.58 52.402l103.192 171.986c2.766-0.238 5.56-0.386 8.388-0.386 2.136 0 4.248 0.094 6.35 0.23l170.356-298.122c-10.536-15.408-16.706-34.036-16.706-54.11 0-53.020 42.98-96 96-96s96 42.98 96 96c0 53.020-42.98 96-96 96-2.14 0-4.248-0.094-6.35-0.232l-170.356 298.124c10.536 15.406 16.706 34.036 16.706 54.11 0 53.020-42.98 96-96 96s-96-42.98-96-96c0-19.34 5.74-37.332 15.578-52.402l-103.19-171.984c-2.766 0.238-5.56 0.386-8.388 0.386s-5.622-0.146-8.388-0.386l-103.192 171.986c9.84 15.068 15.58 33.060 15.58 52.4 0 53.020-42.98 96-96 96z"
                ></path>
              </svg>
              <span class="page-text15">Average Order</span>
              <span class="page-text16">
                  <fmt:setLocale value="vi_VN" />
              <fmt:formatNumber value="${AverageOrderValue}" pattern="#,###,###"
                                var="AverOrderSellingPrice" />
                <span>${AverOrderSellingPrice}đ</span>
                <br />
              </span>
            </div>
            <div class="page-container07 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon13">
                <path
                  d="M480 64c-265.096 0-480 214.904-480 480 0 265.098 214.904 480 480 480 265.098 0 480-214.902 480-480 0-265.096-214.902-480-480-480zM480 928c-212.078 0-384-171.922-384-384s171.922-384 384-384c212.078 0 384 171.922 384 384s-171.922 384-384 384zM512 512v-128h128v-64h-128v-64h-64v64h-128v256h128v128h-128v64h128v64h64v-64h128.002l-0.002-256h-128zM448 512h-64v-128h64v128zM576.002 704h-64.002v-128h64.002v128z"
                ></path>
              </svg>
              <span class="page-text19">Profit</span>
              <span class="page-text20">
                <span>${ProfitPercentage}%</span>
                <br />
              </span>
            </div>
            <div class="page-container08 thq-button-outline">
              <svg viewBox="0 0 1024 1024" class="page-icon15">
                <path
                  d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z"
                ></path>
              </svg>
              <span class="page-text23">Completed Sales</span>
              <span class="page-text24">
                <span>${PercentageCompletedOrders}% of all Orders</span>
                <br />
              </span>
            </div>
            <div class="page-container09 thq-button-outline">
              <svg viewBox="0 0 1097.142857142857 1024" class="page-icon17">
                <path
                  d="M438.857 658.286h219.429v-54.857h-73.143v-256h-65.143l-84.571 78.286 44 45.714c13.714-12 22.286-18.286 31.429-32.571h1.143v164.571h-73.143v54.857zM731.429 512c0 104-62.857 237.714-182.857 237.714s-182.857-133.714-182.857-237.714 62.857-237.714 182.857-237.714 182.857 133.714 182.857 237.714zM1024 658.286v-292.571c-80.571 0-146.286-65.714-146.286-146.286h-658.286c0 80.571-65.714 146.286-146.286 146.286v292.571c80.571 0 146.286 65.714 146.286 146.286h658.286c0-80.571 65.714-146.286 146.286-146.286zM1097.143 182.857v658.286c0 20-16.571 36.571-36.571 36.571h-1024c-20 0-36.571-16.571-36.571-36.571v-658.286c0-20 16.571-36.571 36.571-36.571h1024c20 0 36.571 16.571 36.571 36.571z"
                ></path>
              </svg>
              <span class="page-text27">Cash Sales</span>
              <span class="page-text28">
                <span>${cashPercentage}% of all Orders</span>
                <br />
              </span>
            </div>
            <div class="page-container10 thq-button-outline">
              <svg viewBox="0 0 1097.142857142857 1024" class="page-icon19">
                <path
                  d="M1005.714 73.143c50.286 0 91.429 41.143 91.429 91.429v694.857c0 50.286-41.143 91.429-91.429 91.429h-914.286c-50.286 0-91.429-41.143-91.429-91.429v-694.857c0-50.286 41.143-91.429 91.429-91.429h914.286zM91.429 146.286c-9.714 0-18.286 8.571-18.286 18.286v128h950.857v-128c0-9.714-8.571-18.286-18.286-18.286h-914.286zM1005.714 877.714c9.714 0 18.286-8.571 18.286-18.286v-347.429h-950.857v347.429c0 9.714 8.571 18.286 18.286 18.286h914.286zM146.286 804.571v-73.143h146.286v73.143h-146.286zM365.714 804.571v-73.143h219.429v73.143h-219.429z"
                ></path>
              </svg>
              <span class="page-text31">Banking Sales</span>
              <span class="page-text32">
                <span>${cardPercentage}% of all Orders</span>
                <br />
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
<script>
    // Assuming your form has an ID of 'myForm', and your date inputs have IDs 'startDate' and 'endDate'
document.getElementById('myForm').addEventListener('submit', function(event) {
var startDate = new Date(document.getElementById('startDate').value);
var endDate = new Date(document.getElementById('endDate').value);

// Check if start date is greater than end date
if (startDate > endDate) {
    // Prevent form submission
    event.preventDefault();
    // Display an error message or handle the error as needed
    alert('Start date cannot exceed the end date.');
    // Optionally, reset the start date or focus on it for correction
    // document.getElementById('startDate').value = '';
    // document.getElementById('startDate').focus();
}
});
</script>
  </body>
</html>

