package main;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

import database.Database;

public class UserGoogle extends User {
    public void setGoogleAccount() {
        try {
            String sql = "{call setGoogleUser(?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void setCredentials(){
        username = email;
        password = id;
    }

    public int login() {
        setCredentials();
        try {
            String sql = "{call googleLogin(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public int register() {
        setCredentials();
        int result = super.register(true);
        if (result == 1) {
            Database db = new Database();
            db.forceActivate(username);
            setGoogleAccount();
        }

        return result;
    }
}