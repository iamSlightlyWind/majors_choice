<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />

    <title>Login Form</title>
  </head>
  <body>
    <section>
    <div class="container mt-5 pt-5">
    <div class="row">
    <div class="col-12 col-sm-7 col-md-6 m-auto">
    <div class="card border-0 shadow">
    <div class="card-body">
    <svg class="mx-auto my-3" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
    </svg>
    <form action="homepage">
        <form id="resetPasswordForm" action="/submit_reset_password" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="form-control my-4 py-2" placeholder="Enter your email" required>
        <span id="emailError" class="error">Email must end with @gmail.com.</span>

        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" class="form-control my-4 py-2" placeholder="Enter your new password" required>
        <span id="passwordError" class="error">Password must contain at least one special character.</span>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" class="form-control my-4 py-2" placeholder="Re-enter your new password" required>
        <span id="confirmPasswordError" class="error">Passwords do not match.</span><br>

        <input type="submit" value="Reset Password">
    </form>
                
    </div>
    </div>
    </div>
    </div>
    </div>
    </section>
<script>
        document.getElementById('resetPasswordForm').addEventListener('submit', function(e) {
            var email = document.getElementById('email').value;
            var newPassword = document.getElementById('new_password').value;
            var confirmPassword = document.getElementById('confirm_password').value;

            var emailError = document.getElementById('emailError');
            var passwordError = document.getElementById('passwordError');
            var confirmPasswordError = document.getElementById('confirmPasswordError');

            var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            var passwordPattern = /[!@#$%^&*(),.?":{}|<>]/; // at least one special character

            // Reset error messages
            emailError.style.display = 'none';
            passwordError.style.display = 'none';
            confirmPasswordError.style.display = 'none';

            var isValid = true;

            // Validate email
            if (!emailPattern.test(email)) {
                emailError.style.display = 'block';
                isValid = false;
            }

            // Validate new password
            if (!passwordPattern.test(newPassword)) {
                passwordError.style.display = 'block';
                isValid = false;
            }

            // Check if the passwords match
            if (newPassword !== confirmPassword) {
                confirmPasswordError.style.display = 'block';
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault(); // Prevent form submission if any validation fails
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  </body>
</html>
