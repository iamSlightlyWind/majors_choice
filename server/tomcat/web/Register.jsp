<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create an Account</title>
        <style>
            .gradient-custom-3 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
            }
            .gradient-custom-4 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
            }
        </style>
        <!-- Include any additional CSS or JS libraries as needed -->
        <!-- Example: Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="vh-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>          
                                    <form action="register" method="post">
 
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="user" id="username" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example1cg">Username </label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="password" name="pass" id="password" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example4cg">Password </label>
                                        </div>
   
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="password" name="repass" id="repassword" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                        </div>                           

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="name" id="fullname" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Full Name</label>
                                        </div>
 
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="email" id="email" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Emai  &nbsp;&nbsp;${EE}${FE}</label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="phone" id="phone" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Phone</label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="address" id="address" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Address </label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="date" name="dateOfBirth" id="birthDate" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Date Of Birth</label>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <input type="submit" value ="Register" data-mdb-button-init data-mdb-ripple-init class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" />
                                        </div>
                                        <c:if test="${requestScope.error!=null}">
                                            <p style="color: aqua; font-family:sans-serif"> &nbsp;${requestScope.error}</p>
                                        </c:if>
                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="Login.jsp" class="fw-bold text-body"><u>Login here</u></a></p>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Include any additional JS libraries as needed -->
        <!-- Example: Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
