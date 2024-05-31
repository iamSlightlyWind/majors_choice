<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
            crossorigin="anonymous" />

        <title>Login Form</title>
    </head>

    <body>

        <body>
            <section>
                <div class="container mt-5 pt-5">
                    <div class="row">
                        <div class="col-12 col-sm-7 col-md-6 m-auto">
                            <div class="card border-0 shadow">
                                <div class="card-body">
                                    <svg class="mx-auto my-3" xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                        fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path fill-rule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>

                                    <form id="registerForm" action="register" method="post">
                                        <label for="username">Username:</label><br>
                                        <input type="text" id="username" name="username" class="form-control my-4 py-2"
                                            placeholder="Enter your username" required>

                                        <label for="password">Password:</label>
                                        <input type="password" id="password" name="password"
                                            class="form-control my-4 py-2" placeholder="Enter your password" required>

                                        <label for="repass">Repeat your password:</label>
                                        <input type="password" id="repass" name="repass" class="form-control my-4 py-2"
                                            placeholder="Re-enter your password" required>

                                        <label for="fullname">Full Name:</label>
                                        <input type="text" id="fullname" name="fullname" class="form-control my-4 py-2"
                                            placeholder="Enter your full name" required>

                                        <label for="email">Email:</label><br>
                                        <input type="email" id="email" name="email" value="${gmail}" class="form-control my-4 py-2"
                                            placeholder="Enter your email" required>

                                        <label for="phone">Phone:</label><br>
                                        <input type="text" id="phone" name="phoneNumber" class="form-control my-4 py-2"
                                            placeholder="Enter your phone number" required>

                                        <label for="address">Address:</label>
                                        <input type="text" id="address" name="address" class="form-control my-4 py-2"
                                            placeholder="Enter your address" required>

                                        <label for="dob">Date of Birth:</label>
                                        <input type="date" id="dob" name="dateOfBirth" class="form-control my-4 py-2"
                                            placeholder="dd/mm/yyyy" required>

                                        <input type="submit" value="Register">
                                        <p>${registerStatus}</p>
                                    </form>
            </section>

            </div>
            </div>
            </div>
            </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
                crossorigin="anonymous"></script>

        </body>

    </html>