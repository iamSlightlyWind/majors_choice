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
import packages.CPU;

/**
 *
 * @author PC
 */
public class DAOCPU extends Database {

    public Vector<CPU> getAll(String sql) {
        Vector<CPU> vector = new Vector<CPU>();
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String generation = rs.getString(3);
                String socket = rs.getString(4);
                int cores = rs.getInt(5);
                int threads = rs.getInt(6);
                int baseClock = rs.getInt(7);
                int boostClock = rs.getInt(8);
                int tdp = rs.getInt(9);
                CPU cpu = new CPU(id, baseClock, boostClock, generation, name, generation, socket, cores, threads, baseClock, boostClock, tdp);
                vector.add(cpu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int insertCPU(CPU cpu) {
        int n = 0;
        String sqlInsert = "INSERT INTO [dbo].[cpus]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[generation]\n"
                + "           ,[socket]\n"
                + "           ,[cores]\n"
                + "           ,[threads]\n"
                + "           ,[baseClock]\n"
                + "           ,[boostClock]\n"
                + "           ,[tdp]"
                + ",[images])"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?,?,?);";
        System.out.println(sqlInsert);
        try {
            PreparedStatement statement = connection.prepareStatement(sqlInsert);
            statement.setInt(1, cpu.getId());
            statement.setString(2, cpu.getName());
            statement.setString(3, cpu.getGeneration());
            statement.setString(4, cpu.getSocket());
            statement.setInt(5, cpu.getCores());
            statement.setInt(6, cpu.getThreads());
            statement.setInt(7, cpu.getBaseClock());
            statement.setInt(8, cpu.getBoostClock());
            statement.setInt(9, cpu.getTdp());
            statement.setString(10, cpu.getImages());
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCPU(CPU cpu) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[cpus]\n"
                + "   SET [id] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[generation] = ?\n"
                + "      ,[socket] = ?\n"
                + "      ,[cores] = ?\n"
                + "      ,[threads] = ?\n"
                + "      ,[baseClock] = ?\n"
                + "      ,[boostClock] = ?\n"
                + "      ,[tdp] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sqlUpdate);
            statement.setInt(1, cpu.getId());
            statement.setString(2, cpu.getName());
            statement.setString(3, cpu.getGeneration());
            statement.setString(4, cpu.getSocket());
            statement.setInt(5, cpu.getCores());
            statement.setInt(6, cpu.getThreads());
            statement.setInt(7, cpu.getBaseClock());
            statement.setInt(8, cpu.getBoostClock());
            statement.setInt(9, cpu.getTdp());
            statement.setInt(10, cpu.getId());
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            //log
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeCPU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[cpus]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        DAOCPU dao = new DAOCPU();
        dao.getAll("select * from cpus");
//        int n = dao.insertCPU(new CPU(24, 0, 0, "test", "test", "test", "test", 3, 3, 3, 3, 3));
//        int m = dao.updateCPU(new CPU(20, 0, 0, "tesr", "tesr", "tesr", "tesr", 4, 4, 4, 4, 4));
//            int v = dao.removeCPU(20);
//        Vector<CPU> vector = dao.getAll("select * from cpus");
//        for (CPU cpu : vector) {
//            System.out.println(cpu);
//        }
    }
}
