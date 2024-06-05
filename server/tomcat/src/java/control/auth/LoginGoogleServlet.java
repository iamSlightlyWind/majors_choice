package control.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import main.Constants;
import main.UserGoogle;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

@WebServlet(urlPatterns = { "/LoginGoogleServelet" })
public class LoginGoogleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Database db = new Database();
        int result;

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        if (!action.equals("Update Information")) {
            UserGoogle user = getUserInfo(getToken(request.getParameter("code")));
            session.setAttribute("username", user.email);
            if (!db.userExists(user.email)) {
                user.register();
                request.setAttribute("registerStatus", "Please enter the remaining information to continue");
                request.setAttribute("registerButton", "Update Information");
                request.setAttribute("gmail", user.email);
                request.getRequestDispatcher("googleRegister.jsp").forward(request, response);
            } else {
                result = user.login();
                if (result == 1) {
                    session.setAttribute("username", user.username);
                    request.setAttribute("loginStatus", "Logged in successfully");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("loginStatus", "Login failed!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } else {
            UserGoogle user = new UserGoogle();
            user.username = (String) session.getAttribute("username");
            user.fullName = request.getParameter("fullName");
            user.phoneNumber = request.getParameter("phoneNumber");
            user.address = request.getParameter("address");
            user.dateOfBirth = request.getParameter("dateOfBirth");

            System.out.println("Update: " + user.updateInformation());
            request.setAttribute("loginStatus", "Logged in successfully");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
