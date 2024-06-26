package control.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

public class LoginGoogleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        if (action.equals("Update Information")) {
            UserGoogle user = new UserGoogle();
            user.username = request.getParameter("email");
            user.fullName = request.getParameter("fullName");
            user.phoneNumber = request.getParameter("phoneNumber");
            user.address = request.getParameter("address");
            user.dateOfBirth = request.getParameter("dateOfBirth");
            user.active = 1;
            user.updateInformation();

            request.getSession().setAttribute("table", "user");
            request.getSession().setAttribute("userObject", user);
            request.getRequestDispatcher("/").forward(request, response);
        } else {
            UserGoogle user = getUserInfo(getToken(request.getParameter("code")));

            if (!Database.userExists(user.email)) {
                user.register();
                request.setAttribute("registerStatus", "Please enter the remaining information to continue");
                request.setAttribute("registerButton", "Update Information");
                request.setAttribute("gmail", user.email);
                request.getRequestDispatcher("/auth/googleRegister.jsp").forward(request, response);
            } else {
                if (user.login() == 1) {
                    user.retrieveData("user");
                    request.getSession().setAttribute("table", "user");
                    user.retrieveData((String) request.getSession().getAttribute("table"));
                    response.sendRedirect("/");
                } else {
                    request.setAttribute("loginStatus", "Login failed!");
                    request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                }
            }

            request.getSession().setAttribute("userObject", user);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
