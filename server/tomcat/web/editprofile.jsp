<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <title>editProfile - Major's Choice1</title>
      <meta property="og:title" content="editProfile - Major's Choice1" />
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
        <link href="./css/edit-profile.css" rel="stylesheet" />

        <div class="edit-profile-container">
          <div class="navbar-container navbar-root-class-name19">
            <div class="navbar-container1"></div>
            <header class="navbar-container2">
              <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                <img alt="pastedImage" src="public/external/pastedimage-eh8r-200h.png" class="navbar-pasted-image" />
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
                    <svg viewBox="0 0 1024 1024" class="navbar-icon thq-button-icon thq-icon-medium">
                      <path
                        d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                      </path>
                    </svg><svg viewBox="0 0 1024 1024" class="navbar-icon02 thq-button-icon thq-icon-medium">
                      <path
                        d="M768 682l86 86v42h-684v-42l86-86v-212q0-100 51-174t141-96v-30q0-26 18-45t46-19 46 19 18 45v30q90 22 141 96t51 174v212zM512 938q-36 0-61-24t-25-60h172q0 34-26 59t-60 25z">
                      </path>
                    </svg>
                    <a href="login.html" class="navbar-account thq-button-filled">
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
                      <a href="/order">
                        <span class="thq-body-small thq-link">
                          <span>Manage Order</span>
                        </span>
                      </a>
                    </nav>
                  </div>
                  <div class="navbar-buttons1"></div>
                </div>
              </header>
            </header>
          </div>
          <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role) || "manager"
            .equals(role)) { %>
            <div class="menu-function-container menu-function-root-class-name7">
              <div class="menu-function-manager">
                <span class="menu-function-mgt-ware-house text1 thq-link1 thq-body-small">
                  <span>Manage WareHouse</span>
                </span>
                <span class="menu-function-mgt-customer text1 thq-link1 thq-body-small">
                  Manage Customer
                </span>
                <span class="menu-function-mgt-feebcack text1 thq-link1 thq-body-small">
                  <span>Feedback</span>
                  <br />
                </span>
                <span class="menu-function-mgt-staff text1 thq-link1 thq-body-small">
                  Manage Staff
                </span>
                <span class="menu-function-mgt-report text1 thq-link1 thq-body-small">
                  Financial Reports
                </span>
              </div>
            </div>
            <% } %>
              <div class="edit-profile-component-container edit-profile-component-root-class-name">
                <div class="edit-profile-component-container01">
                  <div class="edit-profile-component-container02">
                    <div class="edit-profile-component-container03">
                      <img alt="image" src="https://play.teleporthq.io/static/svg/default-img.svg"
                        class="edit-profile-component-image" />
                      <button type="button" class="edit-profile-component-button button">
                        Save Changes
                      </button>
                    </div>
                  </div>
                  <div class="edit-profile-component-container04">
                    <div class="edit-profile-component-container05">
                      <h1 class="edit-profile-component-text">Edit Profile</h1>
                    </div>
                    <div class="edit-profile-component-container06">
                      <form class="edit-profile-component-form" action="/editprofile" method="post"
                        onsubmit="return confirmChange();">
                        <c:set var="user" value="${requestScope.user}" />
                        <c:if test="${requestScope.possition != null}">
                          <span class="edit-profile-component-text1">ID</span>
                          <div class="edit-profile-component-container07">
                            <input type="text" class="edit-profile-component-textinput input" name="id"
                              value="${user.id}" readonly />
                          </div>
                        </c:if>
                        <span class="edit-profile-component-text1">Usename</span>
                        <div class="edit-profile-component-container07">
                          <input type="text" placeholder="Enter Password" class="edit-profile-component-textinput input"
                            name="username" value="${user.username}" readonly
                          />
                        </div>
                    </div>
                    <div class="edit-profile-component-container08">
                      <div class="edit-profile-component-container09">
                        <div class="edit-profile-component-container10">
                          <div class="edit-profile-component-container11">
                            <span class="edit-profile-component-text2">Password</span>
                          </div>
                          <div class="edit-profile-component-container12">
                            <input type="password" placeholder="Enter Password"
                              class="edit-profile-component-textinput1 input" type="password" name="password"
                              value="${user.password}" required
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                    <c:if test="${requestScope.possition != null}">
                      <span class="edit-profile-component-text1">Possition</span>
                      <div class="edit-profile-component-container07">
                        <input type="text" class="edit-profile-component-textinput input" name="possition"
                          value="${requestScope.possition}" readonly
                        />
                      </div>
                      <span class="edit-profile-component-text1">Active</span>
                      <div class="edit-profile-component-container07">
                        <input type="number" class="edit-profile-component-textinput input" name="active"
                          value="${user.active}" min="0" max="1" required
                        />
                      </div>
                    </c:if>
                    <div class="edit-profile-component-container13">
                      <div class="edit-profile-component-container14">
                        <div class="edit-profile-component-container15">
                          <span class="edit-profile-component-text3">Full Name</span>
                        </div>
                        <div class="edit-profile-component-container16">
                          <input type="text" placeholder="Enter Full Name"
                            class="edit-profile-component-textinput2 input" name="fullname" value="${user.fullName}"
                            required />
                        </div>
                      </div>
                    </div>
                    <div class="edit-profile-component-container13">
                      <div class="edit-profile-component-container14">
                        <div class="edit-profile-component-container15">
                          <span class="edit-profile-component-text3">Phone</span>
                        </div>
                        <div class="edit-profile-component-container16">
                          <input type="text" placeholder="Enter Phone Number"
                            class="edit-profile-component-textinput2 input" name="phoneNumber"
                            value="${user.phoneNumber}" required />
                        </div>
                      </div>
                    </div>
                    <div class="edit-profile-component-container17">
                      <div class="edit-profile-component-container18">
                        <div class="edit-profile-component-container19">
                          <div class="edit-profile-component-container20">
                            <span class="edit-profile-component-text4">Email</span>
                          </div>
                        </div>
                        <div class="edit-profile-component-container21">
                          <input type="text" placeholder="Enter Email" class="edit-profile-component-textinput3 input"
                            name="email" value="${user.email}" required />
                        </div>
                      </div>
                    </div>
                    <div class="edit-profile-component-container22">
                      <div class="edit-profile-component-container23">
                        <div class="edit-profile-component-container24">
                          <span class="edit-profile-component-text5">Address</span>
                        </div>
                        <div class="edit-profile-component-container25">
                          <input type="text" placeholder="Enter Address" class="edit-profile-component-textinput4 input"
                            name="address" value="${user.address}" required />
                        </div>
                      </div>
                    </div>
                    <div class="edit-profile-component-container26">
                      <div class="edit-profile-component-container27">
                        <div class="edit-profile-component-container28">
                          <span class="edit-profile-component-text6">DoB</span>
                        </div>
                        <div class="edit-profile-component-container29">
                          <input type="date" placeholder="Text" class="edit-profile-component-textinput5 input"
                            name="dateOfBirth" value="${user.dateOfBirth}" required />
                        </div>
                      </div>
                    </div>
                    <c:if test="${requestScope.possition != null}">
                      <div class="edit-profile-component-container26">
                        <div class="edit-profile-component-container27">
                          <div class="edit-profile-component-container28">
                            <span class="edit-profile-component-text6">Date Joined</span>
                          </div>
                          <div class="edit-profile-component-container29">
                            <input type="date" placeholder="Text" class="edit-profile-component-textinput5 input"
                              name="dateJoined" value="${user.dateJoined}" readonly />
                          </div>
                        </div>
                      </div>
                    </c:if>
                    <div>
                      <span style="color: greenyellow; font-size: 25px">${requestScope.status} </span>
                    </div>
                    <div class="edit-profile-component-container30">
                      <button class="edit-profile-component-navlink thq-button-filled button thq-button-outline"
                        type="submit">Save Edit</button>
                    </div>
                  </div>
                  </form>
                </div>
              </div>
              <div class="contact-contact20 thq-section-padding contact-root-class-name9">
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
                          d="M854 342v-86l-342 214-342-214v86l342 212zM854 170q34 0 59 26t25 60v512q0 34-25 60t-59 26h-684q-34 0-59-26t-25-60v-512q0-34 25-60t59-26h684z">
                        </path>
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
                          <span>info@majorschoice.com</span>
                        </span>
                      </div>
                    </div>
                    <div class="contact-content3">
                      <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                        <path
                          d="M282 460q96 186 282 282l94-94q20-20 44-10 72 24 152 24 18 0 30 12t12 30v150q0 18-12 30t-30 12q-300 0-513-213t-213-513q0-18 12-30t30-12h150q18 0 30 12t12 30q0 80 24 152 8 26-10 44z">
                        </path>
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
                          d="M512 0c-176.732 0-320 143.268-320 320 0 320 320 704 320 704s320-384 320-704c0-176.732-143.27-320-320-320zM512 512c-106.040 0-192-85.96-192-192s85.96-192 192-192 192 85.96 192 192-85.96 192-192 192z">
                        </path>
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
              <footer class="footer-footer1 thq-section-padding footer-root-class-name11">
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
                              Email :&nbsp;info@majorschoice.com
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