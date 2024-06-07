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

public class DAOCPU extends Database {

    public Vector<CPU> getAll(String sql) {
        Vector<CPU> vector = new Vector<CPU>();
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
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
                CPU cpu = new CPU(id, baseClock, boostClock, generation, name, generation, socket, cores, threads,
                        baseClock, boostClock, tdp);
                vector.add(cpu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int insertCPU(CPU cpu) {
        int n = 0;

        String sqlInsertProduct = "INSERT INTO [dbo].[products] ([sellingPrice], [costPrice]) VALUES (?, ?);";
        String sqlInsertCPU = "INSERT INTO [dbo].[cpus] ([id], [name], [generation], [socket], [cores], [threads], [baseClock], [boostClock], [tdp], [image]) VALUES (?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement productStatement = connection.prepareStatement(sqlInsertProduct,
                    Statement.RETURN_GENERATED_KEYS);
            productStatement.setDouble(1, 0);
            productStatement.setDouble(2, 0);
            productStatement.executeUpdate();

            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id");
            }

            PreparedStatement cpuStatement = connection.prepareStatement(sqlInsertCPU);
            cpuStatement.setInt(1, productId);
            System.out.println("name: " + cpu.getName());
            System.out.println("generation: " + cpu.getGeneration());
            System.out.println("socket: " + cpu.getSocket());
            System.out.println("cores: " + cpu.getCores());
            System.out.println("threads: " + cpu.getThreads());
            System.out.println("baseClock: " + cpu.getBaseClock());
            System.out.println("boostClock: " + cpu.getBoostClock());
            System.out.println("tdp: " + cpu.getTdp());
            System.out.println("images: " + cpu.getImages());

            cpuStatement.setString(2, cpu.getName());
            cpuStatement.setString(3, cpu.getGeneration());
            cpuStatement.setString(4, cpu.getSocket());
            cpuStatement.setInt(5, cpu.getCores());
            cpuStatement.setInt(6, cpu.getThreads());
            cpuStatement.setInt(7, cpu.getBaseClock());
            cpuStatement.setInt(8, cpu.getBoostClock());
            cpuStatement.setInt(9, cpu.getTdp());
            cpuStatement.setString(10, cpu.getImages());
            n = cpuStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCPU(CPU cpu) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[cpus] SET [id] = ?, [name] = ?, [generation] = ?, [socket] = ?, [cores] = ?, [threads] = ?, [baseClock] = ?, [boostClock] = ?, [tdp] = ? WHERE [id] = ?";
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
            Logger.getLogger(DAOCPU.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeCPU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[cpus]  WHERE id = " + id;
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
        // int n = dao.insertCPU(new CPU(24, 0, 0, "test", "test", "test", "test", 3, 3,
        // 3, 3, 3));
        // int m = dao.updateCPU(new CPU(20, 0, 0, "tesr", "tesr", "tesr", "tesr", 4, 4,
        // 4, 4, 4));
        // int v = dao.removeCPU(20);
        // Vector<CPU> vector = dao.getAll("select * from cpus");
        // for (CPU cpu : vector) {
        // System.out.println(cpu);
        // }
    }
}
