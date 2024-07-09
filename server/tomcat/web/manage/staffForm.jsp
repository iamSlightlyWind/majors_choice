<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>EditCustomer - Major's Choice</title>
    <meta property="og:title" content="EditCustomer - Major's Choice" />
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
  </head>
  <body>
    <link rel="stylesheet" href="../css/style.css" />
    <div>
      <link href="../css/edit-customer.css" rel="stylesheet" />

      <div class="edit-customer-container">
        <div class="edit-customer-header">
          <div class="navbar-container navbar-root-class-name46">
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
                      </span>
                        <a href="/order">
                          <span class="navbar-manager-order thq-body-small thq-link">
                            Manage Order
                          </span>
                        </a>
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
           <% String role=(String) request.getSession().getAttribute("table"); if ("staff".equals(role) || "manager"
              .equals(role)) { %>
              <div class="menu-function-container menu-function-root-class-name7">
                <div class="menu-function-manager">
                  <span class="menu-function-mgt-ware-house text1 thq-link1 thq-body-small">
                    <span>Manager WareHouse</span>
                  </span>
                   <a href="/manage/profile?actor=user">
                    <span class="menu-function-mgt-customer text1 thq-link1 thq-body-small">
                      Manage Customer
                    </span>
                  </a>

                  <c:if test="${sessionScope.role == 'manager'}">
                      <a href="/manage/profile?actor=staff">
                          <span class="menu-function-mgt-staff text1 thq-link1 thq-body-small">
                              Manage Staff
                          </span>
                      </a>
                      <span class="menu-function-mgt-report text1 thq-link1 thq-body-small">
                            Statistics
                      </span>
                  </c:if>                 
                </div>
              </div>
              <% } %>
        </div>
        <div class="edit-customer-body">
          <div class="edit-customer-link-page">
            <div class="edit-customer-container1">
              <span class="edit-customer-text thq-body-small thq-link">
                  <a href="/"> Home&nbsp;</a>
              </span>
              <span class="edit-customer-text01 thq-body-small thq-link">
                  <a href="/manage/profile?actor=staff">&nbsp;/ Manage Customer</a>
              </span>
              <span class="edit-customer-text02 thq-body-small">
                &nbsp;/ Edit Customer&nbsp;
              </span>
            </div>
          </div>
          <div class="edit-customer-root">
            <div class="edit-customer-container2">
              <h1 class="edit-customer-text03">Edit Staff</h1>
            </div>
            <div class="edit-customer-container3">
               <form action="/manage/profile/staff" method="post" id="profileForm">
                         <c:if test="${submitAction=='Update'}">
                        <div class="edit-customer-form">
                            <span class="edit-customer-text04">
                                <span>Active</span>
                                <br />
                            </span>
                            <select class="edit-customer-select" name="active" required>
                                <option value="1" ${staff.active==1 ? 'selected' : '' }>Activated</option>
                                <option value="-1" ${staff.active==-1 ? 'selected' : '' }>Deactivated</option>
                            </select>
                        </div>
                         </c:if>
                        <div class="edit-customer-form1">
                            <span class="edit-customer-text07">Full Name</span>
                            <input
                                type="text"
                                placeholder="Name customer"
                                class="edit-customer-textinput input"
                                name="fullname" value="${staff.fullName}" required
                                />
                        </div>
                        <div class="edit-customer-form2">
                            <span class="edit-customer-text08">
                                <span>UserName</span>
                                <br />
                            </span>
                            <input
                                type="text"
                                placeholder="email"
                                class="edit-customer-textinput1 input"
                                name="username" value="${staff.username}" required
                                />
                        </div>
                        <div class="edit-customer-form3">
                            <span class="edit-customer-text11">
                                <span>Password</span>
                                <br />
                            </span>
                            <input
                                type="password"
                                placeholder="phone"
                                class="edit-customer-textinput2 input"
                                name="password" value="${staff.password}" required
                                />
                        </div>
<%--                        <div class="edit-customer-form4">
                            <span class="edit-customer-text14">
                                <span>Address</span>
                                <br />
                            </span>
                            <input
                                type="text"
                                placeholder="Address"
                                class="edit-customer-textinput3 input"
                                name="address" value="${user.address}" required
                                />
                          <div class="edit-customer-form5">
                            <span class="edit-customer-text17">
                                <span>Date Of Birth</span>
                         </div>
                             <br />
                            </span>
                            <input type="date" class="edit-customer-textinput4 input" name="dob" value="${user.dateOfBirth}" readonly/>
                        </div>--%>
                       
                        <input type="hidden" name="actor" value="staffs" />
                        <input type="hidden" name="id" value="${staff.id}" />  
                        <input type="hidden" id="submitAction" name="action" value="${submitAction}">
                            <button class="edit-profile-component-button1 thq-button-filled button"
                                style="margin-left: 80%"                                 
                                >${submitAction}
                            </button>
                    </form>
            </div>
          </div>
        </div>
        <div class="edit-customer-footer">
          <footer
            class="footer-footer1 thq-section-padding footer-root-class-name42"
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
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script type="text/javascript">
        document.getElementById('profileForm').onsubmit = function(event) {
            event.preventDefault();
            var action = document.getElementById('submitAction').value;
            confirmChange(action).then(function(isConfirmed) {
                if (isConfirmed) {
                    document.getElementById('profileForm').submit();
                }
            });
        };

        function confirmChange(action) {
            var title, text;
            if (action === 'Add') {
                title = 'Are you sure you want to add this profile?';
                text = 'New records will be added to the system.';
            } else if (action === 'Update') {
                title = 'Are you sure you want to update this profile?';
                text = 'The record will be updated to the system.';
            }
             return Swal.fire({
                title: title,
                text: text,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, done!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                return result.isConfirmed;
            });
        }
    </script>

</html>

