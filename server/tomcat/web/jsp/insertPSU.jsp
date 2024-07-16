<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="java.util.Vector,packages.PSU" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>ManageProductAdd - Major's Choice</title>
            <meta property="og:title" content="ManageProductAdd - Major's Choice" />
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
            <link rel="stylesheet" href="../css/style.css" />
            <div>
                <link href="../css/add-product-cpu.css" rel="stylesheet" />

                <div class="manage-product-add-container">
                    <div class="manage-product-add-header">
                        <div class="navmain-container navmain-root-class-name13">
                            <header class="navmain-container1"></header>
                            <header class="navmain-container2">
                                <header data-thq="thq-navbar" class="navmain-navbar-interactive"
                                    style="overflow:hidden">
                                    <a href="/" class="navmain-link">
                                        <img alt="pastedImage" src="public/external/pastedimage-eh8r-200h.png"
                                            class="navmain-pasted-image" />
                                    </a>
                                    <div data-thq="thq-navbar-nav" class="navmain-desktop-menu">
                                        <nav class="navmain-links">
                                            <div class="navmain-container3">
                                                <input type="text" placeholder="Search for product"
                                                    class="navmain-textinput input" />
                                                <button class="navmain-search thq-button-filled">
                                                    <span class="navmain-text thq-body-small">
                                                        <span>Search</span>
                                                        <br />
                                                    </span>
                                                </button>
                                            </div>
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
                                                <a href="/order" class="navmain-manager-order thq-body-small thq-link">
                                                    Manage Order
                                                </a>
                                            </div>
                                        </nav>
                                        <div class="navmain-buttons">
                                            <a href="/cart" target="_blank" rel="noreferrer noopener"
                                                class="navmain-link1">
                                                <svg viewBox="0 0 1024 1024"
                                                    class="navmain-icon thq-button-icon thq-icon-medium">
                                                    <path
                                                        d="M726 768q34 0 59 26t25 60-25 59-59 25-60-25-26-59 26-60 60-26zM42 86h140l40 84h632q18 0 30 13t12 31q0 2-6 20l-152 276q-24 44-74 44h-318l-38 70-2 6q0 10 10 10h494v86h-512q-34 0-59-26t-25-60q0-20 10-40l58-106-154-324h-86v-84zM298 768q34 0 60 26t26 60-26 59-60 25-59-25-25-59 25-60 59-26z">
                                                    </path>
                                                </svg>
                                            </a>
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
                                                    <img alt="pastedImage" src="../css/image/logo.png"
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
                                                    <button
                                                        class="navmain-search1 thq-button-filled thq-button-animated">
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
                        <div class="navstaff-container navstaff-root-class-name16">
                            <div class="navstaff-manager">
                                <span class="navstaff-mgt-ware-house text1 thq-link1 thq-body-small">
                                    Manage WareHouse
                                </span>
                                <a href="/manage/profile?actor=user"
                                    class="navstaff-mgt-customer text1 thq-link1 thq-body-small">
                                    Manage Customer
                                </a>
                                <a href="/manage/profile?actor=staff"
                                    class="navstaff-mgt-staff text1 thq-link1 thq-body-small">
                                    Manage Staff
                                </a>
                                <span class="navstaff-mgt-report text1 thq-link1 thq-body-small">
                                    Statistics
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="manage-product-add-body">
                        <div class="manage-product-add-link-page">
                            <div class="manage-product-add-container01">
                                <span class="manage-product-add-text thq-body-small thq-link">
                                    Home&nbsp;
                                </span>
                                <span class="manage-product-add-text01 thq-body-small thq-link">
                                    &nbsp;/ Manager WareHouse
                                </span>
                                <span class="manage-product-add-text02 thq-body-small">
                                    &nbsp;/ Add New Product - New Product PSU&nbsp;
                                </span>
                            </div>
                        </div>
                        <div class="manage-product-add-root">
                            <div class="menu-add-product-menu-add-product menu-add-product-root-class-name5">
                                <div class="menu-add-product-container">
                                    <h1 class="menu-add-product-text">
                                        <span>Add new product</span>
                                    </h1>
                                </div>
                                <ul class="menu-add-product-ul list">
                                    <li class="menu-add-product-li list-item">
                                        <span class="menu-add-product-text1 thq-link">
                                            <span>Product CPU</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li1 list-item">
                                        <span class="menu-add-product-text2 thq-link">
                                            <span>Product GPU</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li2 list-item">
                                        <span class="menu-add-product-text3 thq-link">
                                            <span>Product Mobo</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li3 list-item">
                                        <span class="menu-add-product-text4 thq-link">
                                            <span>Product PSU</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li4 list-item">
                                        <span class="menu-add-product-text5 thq-link">
                                            <span>Product RAM</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li5 list-item">
                                        <span class="menu-add-product-text6 thq-link">
                                            <span>Product SSD</span>
                                        </span>
                                    </li>
                                    <li class="menu-add-product-li6 list-item">
                                        <span class="menu-add-product-text7 thq-link">
                                            <span>Product CASE</span>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="manage-product-add-root-form">
                                <h1 class="manage-product-add-text03">
                                    <span>Product PSU</span>
                                    <br />
                                </h1>
                                <form action="/psus?service=insertPSU" method="post" enctype="multipart/form-data">
                                    <div class="manage-product-add-form">
                                        <span class="manage-product-add-text06">Selling Price</span>
                                        <input type="number" placeholder="Number" name="sellingPrice"
                                            class="manage-product-add-textinput input" />
                                    </div>
                                    <div class="manage-product-add-form01">
                                        <span class="manage-product-add-text07">Cost Price</span>
                                        <input type="number" placeholder="Number" name="costPrice"
                                            class="manage-product-add-textinput01 input" />
                                    </div>
                                    <div class="manage-product-add-form02">
                                        <span class="manage-product-add-text08">
                                            <span>Image</span>
                                            <br />
                                        </span>
                                        <input type="file" name="image" class="manage-product-add-textinput02 input" />
                                    </div>
                                    <div class="manage-product-add-form03">
                                        <span class="manage-product-add-text11">
                                            <span>Name</span>
                                            <br />
                                        </span>
                                        <div class="manage-product-add-container02">
                                            <input type="text" placeholder="Text" name="name"
                                                class="manage-product-add-textinput03 input" />
                                        </div>
                                    </div>
                                    <div class="manage-product-add-form04">
                                        <span class="manage-product-add-text14">
                                            <span>Wattage</span>
                                            <br />
                                        </span>
                                        <div class="manage-product-add-container03">
                                            <input type="number" placeholder="Number" name="wattage"
                                                class="manage-product-add-textinput04 input" />
                                        </div>
                                    </div>
                                    <div class="manage-product-add-form05">
                                        <span class="manage-product-add-text17">
                                            <span>Efficiency</span>
                                            <br />
                                        </span>
                                        <div class="manage-product-add-container04">
                                            <input type="text" placeholder="Text" name="efficiency"
                                                class="manage-product-add-textinput05 input" />
                                        </div>
                                    </div>
                                    <div class="manage-product-add-form12">
                                        <span class="manage-product-add-text38">
                                            <span>Quantity</span>
                                            <br />
                                        </span>
                                        <div class="manage-product-add-container11">
                                            <input type="number" placeholder="Number" name="quantity"
                                                class="manage-product-add-textinput12 input" />
                                        </div>
                                    </div>
                                    <div class="manage-product-add-container13">
                                        <input type="submit" name="submit" value="Add PSU"
                                            class="manage-product-add-button thq-button-filled button" />
                                        <input type="reset" value="Reset"
                                            class="manage-product-add-button1 button thq-button-outline" />
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="manage-product-add-footer">
                            <footer class="footer-footer1 thq-section-padding footer-root-class-name12">
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
                                                        <input type="email" placeholder="Enter your email"
                                                            class="footer-text-input thq-input" />
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
                                                        <svg viewBox="0 0 877.7142857142857 1024"
                                                            class="thq-icon-small">
                                                            <path
                                                                d="M713.143 73.143c90.857 0 164.571 73.714 164.571 164.571v548.571c0 90.857-73.714 164.571-164.571 164.571h-107.429v-340h113.714l17.143-132.571h-130.857v-84.571c0-38.286 10.286-64 65.714-64l69.714-0.571v-118.286c-12-1.714-53.714-5.143-101.714-5.143-101.143 0-170.857 61.714-170.857 174.857v97.714h-114.286v132.571h114.286v340h-304c-90.857 0-164.571-73.714-164.571-164.571v-548.571c0-90.857 73.714-164.571 164.571-164.571h548.571z">
                                                            </path>
                                                        </svg>
                                                        <span class="thq-body-small">Facebook</span>
                                                    </div>
                                                    <div class="footer-link1">
                                                        <svg viewBox="0 0 877.7142857142857 1024"
                                                            class="thq-icon-small">
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
                </div>
                <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
        </body>

        </html>