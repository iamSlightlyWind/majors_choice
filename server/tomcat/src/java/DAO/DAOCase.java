/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import database.Database;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import packages.Case;

/**
 *
 * @author PC
 */
public class DAOCase extends Database {

    public Vector<Case> getAll(String sql) {
        Vector<Case> vector = new Vector<Case>();
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String type = rs.getString(3);
                String formFactor = rs.getString(4);
                String color = rs.getString(5);
                Case cases = new Case(name, type, formFactor, color, id, id, id, color);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int updateCase(Case cases) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[cases]\n"
                + "   SET [id] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[formFactor] = ?\n"
                + "      ,[color] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sqlUpdate);
            statement.setInt(1, cases.getId());
            statement.setString(2, cases.getName());
            statement.setString(3, cases.getType());
            statement.setString(4, cases.getFormFactor());
            statement.setString(5, cases.getColor());
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            //log
            Logger.getLogger(DAOCase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int insertCase(Case cases) {
        int n = 0;
        String sqlInsert = "INSERT INTO [dbo].[cases]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[type]\n"
                + "           ,[formfator]\n"
                + "           ,[color]"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        System.out.println(sqlInsert);
        try {
            PreparedStatement statement = connection.prepareStatement(sqlInsert);
            statement.setInt(1, cases.getId());
            statement.setString(2, cases.getName());
            statement.setString(3, cases.getType());
            statement.setString(4, cases.getFormFactor());
            statement.setString(5, cases.getColor());
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DAOCase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int removeCase(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[cases]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(DAOCase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
//        DAOCase dao = new DAOCase();
//        Vector<Case> vector = dao.getAll("select * from cases");
//        for (Case cases : vector) {
//            System.out.println(cases);
//        }
    }
}
