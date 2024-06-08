<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />

    <title>Login Form</title>
  </head>

  <body>
    <section>
      <div class="container mt-5 pt-5">
        <div class="row">
          <div class="col-12 col-sm-7 col-md-6 m-auto">
            <div class="card border-0 shadow">
              <div class="card-body">
                <svg class="mx-auto my-3" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                  class="bi bi-person-circle" viewBox="0 0 16 16">
                  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                  <path fill-rule="evenodd"
                    d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <form id="loginForm" action="login" method="post">
                  <input type="text" name="user" id="" class="form-control my-4 py-2" placeholder="Username" />
                  <input type="password" name="pass" id="" class="form-control my-4 py-2" placeholder="Password" />
                  <div class="g-recaptcha" data-sitekey="6LdK--8pAAAAABv-L5jPFsFySBjogEmHiFt87qcV"></div>
		  <div class="error"></div>
                  <div class="text-center mt-3">
                    <button class="btn btn-primary">Login</button>
                    <a href="recovery.jsp" class="nav-link">Forgot Password ?</a>
                    <a href="register.jsp" class="nav-link">Don't Have An Account ?</a>
                    <a href="loginEmployee.jsp">Login For Employee</a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://choice.themajorones.dev/LoginGoogleServlet&response_type=code
		   &client_id=171238715094-e9f1676d321k53paem4hrbfbo1113nlb.apps.googleusercontent.com&approval_prompt=force" class="nav-link">Login with Google ?</a>
                  </div>
                </form>
                <p>${loginStatus}</p>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>    
            <script src="js/recaptchar.js"></script>
            <script>
                window.onload = function (){
                handleFormSubmission("loginForm");
		};
            </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
      crossorigin="anonymous"></script>
  </body>

  </html>