package main;

public class Constants {
    
    public static String GOOGLE_CLIENT_ID = "171238715094-e9f1676d321k53paem4hrbfbo1113nlb.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = System.getenv("GOOGLE_CLIENT_SECRET");

    public static String GOOGLE_REDIRECT_URI = "https://choice.themajorones.dev/LoginGoogleServlet";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";

}