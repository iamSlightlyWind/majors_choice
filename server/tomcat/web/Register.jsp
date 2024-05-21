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
                                    <c:if test="${requestScope.u1!=null}">
                                        <c:set var="u" value="${requestScope.u1}"/>
                                    </c:if>
                                    <form action="register" method="get">
                                        <c:if test="${requestScope.errorU!=null}">
                                            <c:set var="eU" value="${requestScope.errorU}"/>
                                        </c:if>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="user" value="${u.username}" id="username" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example1cg">Username &nbsp;&nbsp;${eU} </label>
                                        </div>
                                        <c:if test="${requestScope.errorP!=null}">
                                            <c:set var="eP" value="${requestScope.errorP}"/>
                                        </c:if>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="password" name="pass" value="${u.password}" id="password" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example4cg">Password &nbsp;&nbsp;${eP}</label>
                                        </div>
                                        <c:if test="${requestScope.reP!=null}">
                                            <c:set var="reP" value="${requestScope.reP}"/>
                                        </c:if>    
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="password" name="repass" value="${reP}" id="repassword" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                        </div>                           

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="name" value="${u.fullName}" id="fullname" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Full Name</label>
                                        </div>
                                        <c:if test="${requestScope.errorEE!=null}">
                                            <c:set var="EE" value="${requestScope.errorEE}"/>
                                        </c:if>  
                                        <c:if test="${requestScope.errorFE!=null}">
                                            <c:set var="FE" value="${requestScope.errorFE}"/>
                                        </c:if> 
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="email" value="${u.email}" id="email" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Email  &nbsp;&nbsp;${EE}${FE}</label>
                                        </div>
                                        <c:if test="${requestScope.errorEP!=null}">
                                            <c:set var="EP" value="${requestScope.errorEP}"/>
                                        </c:if>  
                                        <c:if test="${requestScope.errorFP!=null}">
                                            <c:set var="FP" value="${requestScope.errorFP}"/>
                                        </c:if> 
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="phone" value="${u.phoneNumber}" id="phone" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Phone &nbsp;&nbsp;${EP}${FP}</label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="address" value="${u.address}" id="address" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Address </label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="date" name="dateOfBirth" value="${u.birthDate}" id="birthDate" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Date Of Birth</label>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                        </div>
                                        <c:if test="${requestScope.success!=null}">
                                            <p style="color: aqua; font-family:sans-serif"> &nbsp;${requestScope.success}</p>
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
