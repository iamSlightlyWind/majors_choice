package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import packages.*;

public class Database {
    public Connection connection;

    public Database() {
        try {
            String username = "sa";
            String password = System.getenv("SQLPASSWORD") != null ? System.getenv("SQLPASSWORD") : "123";
            String database = "major";

            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + database;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String selectAll(String table) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from " + table);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            StringBuilder result = new StringBuilder();
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    result.append(metaData.getColumnName(i)).append(": ").append(resultSet.getString(i)).append("\n");
                }
                result.append("\n");
            }
            return result.toString();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean forceActivate(String username) {
        try {
            String sql = "{call forceActivate(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean userExists(String email) { // check if email exists, use exclusively for google login/register
        try {
            String sql = "{call userExists(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, email);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<CPU> getCPUs() {
        try {
            String sql = "{call getCPU()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<CPU> cpus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                String socket = resultSet.getString("socket");
                int cores = resultSet.getInt("cores");
                int threads = resultSet.getInt("threads");
                int baseClock = resultSet.getInt("baseClock");
                int boostClock = resultSet.getInt("boostClock");
                int tdp = resultSet.getInt("tdp");
                cpus.add(new CPU(id, sellingPrice, costPrice, description, name, generation, socket, cores, threads,
                        baseClock, boostClock, tdp));
            }
            return cpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<GPU> getGPUs() {
        try {
            String sql = "{call getGPU()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<GPU> gpus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                int vram = resultSet.getInt("vram");
                int baseClock = resultSet.getInt("baseClock");
                int boostClock = resultSet.getInt("boostClock");
                int tdp = resultSet.getInt("tdp");
                gpus.add(
                        new GPU(id, sellingPrice, costPrice, description, name, generation, vram, baseClock, boostClock,
                                tdp));
            }
            return gpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<RAM> getRAMs() {
        try {
            String sql = "{call getRAM()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<RAM> rams = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String generation = resultSet.getString("generation");
                int capacity = resultSet.getInt("capacity");
                int speed = resultSet.getInt("speed");
                int latency = resultSet.getInt("latency");
                rams.add(new RAM(id, sellingPrice, costPrice, description, name, generation, capacity, speed, latency));
            }
            return rams;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Motherboard> getMotherboards() {
        try {
            String sql = "{call getMotherboard()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Motherboard> motherboards = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String socket = resultSet.getString("socket");
                String chipset = resultSet.getString("chipset");
                String formFactor = resultSet.getString("formFactor");
                String ramType = resultSet.getString("ramType");
                int maxRamSpeed = resultSet.getInt("maxRamSpeed");
                int ramSlots = resultSet.getInt("ramSlots");
                int wifi = resultSet.getInt("wifi");
                motherboards.add(new Motherboard(id, sellingPrice, costPrice, description, name, socket, chipset,
                        formFactor, ramType, maxRamSpeed, ramSlots, wifi));
            }
            return motherboards;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<SSD> getSSDs() {
        try {
            String sql = "{call getSSD()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<SSD> ssds = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String interfaceType = resultSet.getString("interface");
                int capacity = resultSet.getInt("capacity");
                int cache = resultSet.getInt("cache");
                ssds.add(new SSD(id, sellingPrice, costPrice, description, name, interfaceType, capacity, cache));
            }
            return ssds;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<PSU> getPSUs() {
        try {
            String sql = "{call getPSU()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<PSU> psus = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                int wattage = resultSet.getInt("wattage");
                String efficiency = resultSet.getString("efficiency");
                psus.add(new PSU(id, sellingPrice, costPrice, description, name, wattage, efficiency));
            }
            return psus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Case> getCases() {
        try {
            String sql = "{call getCase()}";
            CallableStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<Case> cases = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String type = resultSet.getString("type");
                String formFactor = resultSet.getString("formFactor");
                String color = resultSet.getString("color");
                cases.add(new Case(id, sellingPrice, costPrice, description, name, type, formFactor, color));
            }
            return cases;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}