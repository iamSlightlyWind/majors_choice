package database;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import packages.CPU;
import packages.Case;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.SSD;

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

    public ArrayList<CPU> getCPUs(String sql) {
        try {
            // String sql = "{call getCPU()}";
            PreparedStatement statement = connection.prepareCall(sql);
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
                String image = resultSet.getString("image");
                cpus.add(new CPU(generation, socket, cores, threads, baseClock, boostClock, tdp, image, name, id, sellingPrice, costPrice, description));
            }
            return cpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Case> getCases() {
        // try {
        // String sql = "{call getCase()}";
        // CallableStatement statement = connection.prepareCall(sql);
        // ResultSet resultSet = statement.executeQuery();
        // ArrayList<Case> cases = new ArrayList<>();
        // while (resultSet.next()) {
        // int id = resultSet.getInt("id");
        // double sellingPrice = resultSet.getDouble("sellingPrice");
        // double costPrice = resultSet.getDouble("costPrice");
        // String description = resultSet.getString("description");
        // String name = resultSet.getString("name");
        // String type = resultSet.getString("type");
        // String formFactor = resultSet.getString("formFactor");
        // String color = resultSet.getString("color");
        // cases.add(new Case(name, type, formFactor, color, id, sellingPrice,
        // costPrice, description));
        // }
        // return cases;
        // } catch (SQLException ex) {
        // Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        // }
        return null;
    }

    public int addProductCPU(double sellingPrice, double costPrice, String name, String generation, String socket,
            int cores, int threads, int baseClock, int boostClock, int tdp, String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductCPU(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);
            // callableStatement.setInt(1, productId); // Use the new ID
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setString(5, socket);
            callableStatement.setInt(6, cores);
            callableStatement.setInt(7, threads);
            callableStatement.setInt(8, baseClock);
            callableStatement.setInt(9, boostClock);
            callableStatement.setInt(10, tdp);
            callableStatement.setString(11, image);
            callableStatement.registerOutParameter(12, Types.NVARCHAR);

            callableStatement.execute();

            // Return the newly generated ID
            return productId;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int getMaxProductId() {
        int maxId = 0;
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            if (resultSet.next()) {
                maxId = resultSet.getInt("max_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return maxId;
    }

    public int updateProductCPU(int id, double sellingPrice, double costPrice, String name, String generation,
            String socket,
            int cores, int threads, int baseClock, int boostClock, int tdp, String image) {
        try {
            // Prepare and execute the SQL statement to update the CPU product
            String sql = "{call updateProductCPU(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setString(6, socket);
            callableStatement.setInt(7, cores);
            callableStatement.setInt(8, threads);
            callableStatement.setInt(9, baseClock);
            callableStatement.setInt(10, boostClock);
            callableStatement.setInt(11, tdp);
            callableStatement.setString(12, image);
            callableStatement.registerOutParameter(13, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(13);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removeCPU(int id) {
        int n = 0;
        String sqlDeleteFromCPUs = "DELETE FROM [dbo].[cpus] WHERE id = ?";
        String sqlDeleteFromProducts = "DELETE FROM [dbo].[products] WHERE id = ?";

        try {
            // Set auto-commit to false
            connection.setAutoCommit(false);

            // Prepare and execute delete from cpus
            PreparedStatement psDeleteFromCPUs = connection.prepareStatement(sqlDeleteFromCPUs);
            psDeleteFromCPUs.setInt(1, id);
            n += psDeleteFromCPUs.executeUpdate();

            // Prepare and execute delete from products
            PreparedStatement psDeleteFromProducts = connection.prepareStatement(sqlDeleteFromProducts);
            psDeleteFromProducts.setInt(1, id);
            n += psDeleteFromProducts.executeUpdate();

            // Commit transaction
            connection.commit();

        } catch (SQLException ex) {
            // Rollback transaction if any error occurs
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException e) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
            }
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                // Set auto-commit back to true
                if (connection != null) {
                    connection.setAutoCommit(true);
                }
            } catch (SQLException e) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return n;
    }

    public ArrayList<GPU> getGPUs(String sql) {
        try {
            // String sql = "{call getGPU()}";
            PreparedStatement statement = connection.prepareCall(sql);
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
                String image = resultSet.getString("image");
                gpus.add(
                        new GPU(generation, vram, baseClock, boostClock, tdp, image, name, id, sellingPrice, costPrice, description));
            }
            return gpus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addProductGPU(double sellingPrice, double costPrice, String name, String generation, int vram,
            int baseClock, int boostClock, int tdp, String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductGPU(? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);
            // callableStatement.setInt(1, productId); // Use the new ID
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setInt(5, vram);
            callableStatement.setInt(6, baseClock);
            callableStatement.setInt(7, boostClock);
            callableStatement.setInt(8, tdp);
            callableStatement.setString(9, image);
            callableStatement.registerOutParameter(10, Types.NVARCHAR);

            callableStatement.execute();
            return productId;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int updateProductGPU(int id, double sellingPrice, double costPrice, String name, String generation, int vram,
            int baseClock, int boostClock, int tdp, String image) {
        try {
            // Prepare and execute the SQL statement to update the CPU product
            String sql = "{call updateProductGPU(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setInt(6, vram);
            callableStatement.setInt(7, baseClock);
            callableStatement.setInt(8, boostClock);
            callableStatement.setInt(9, tdp);
            callableStatement.setString(10, image);
            callableStatement.registerOutParameter(11, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(11);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removeGPU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[gpus]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Motherboard> getMotherboards(String sql) {
        try {
            // String sql = "{call getGPU()}";
            PreparedStatement statement = connection.prepareCall(sql);
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
                String image = resultSet.getString("image");
                motherboards.add(
                        new Motherboard(socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image, name, id, sellingPrice, costPrice, description));
            }
            return motherboards;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addProductMotherboard(double sellingPrice, double costPrice, String name, String socket, String chipset,
            String formFactor, String ramType, int maxRamSpeed, int ramSlots, int wifi, String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductMotherboard(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);
            // callableStatement.setInt(1, productId); // Use the new ID
            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, socket);
            callableStatement.setString(5, chipset);
            callableStatement.setString(6, formFactor);
            callableStatement.setString(7, ramType);
            callableStatement.setInt(8, maxRamSpeed);
            callableStatement.setInt(9, ramSlots);
            callableStatement.setInt(10, wifi);
            callableStatement.setString(11, image);
            callableStatement.registerOutParameter(12, Types.NVARCHAR);

            callableStatement.execute();
            return productId;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int updateProductMotherboard(int id, double sellingPrice, double costPrice, String name, String socket,
            String chipset, String formFactor, String ramType, int maxRamSpeed,
            int ramSlots, int wifi, String image) {
        try {
            // Prepare and execute the SQL statement to update the CPU product
            String sql = "{call updateProductMotherboard(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, socket);
            callableStatement.setString(6, chipset);
            callableStatement.setString(7, formFactor);
            callableStatement.setString(8, ramType);
            callableStatement.setInt(9, maxRamSpeed);
            callableStatement.setInt(10, ramSlots);
            callableStatement.setInt(11, wifi);
            callableStatement.setString(12, image);
            callableStatement.registerOutParameter(13, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(13);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removeMotherboard(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[motherboards]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<PSU> getPSUs(String sql) {
        try {
            // String sql = "{call getGPU()}";
            PreparedStatement statement = connection.prepareCall(sql);
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
                String image = resultSet.getString("image");
                psus.add(
                        new PSU(wattage, efficiency, image, name, id, sellingPrice, costPrice, description));
            }
            return psus;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addProductPSU(double sellingPrice, double costPrice, String name, int wattage, String efficiency,
            String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductPSU(?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setInt(4, wattage);
            callableStatement.setString(5, efficiency);
            callableStatement.setString(6, image);
            callableStatement.registerOutParameter(7, Types.NVARCHAR);

            callableStatement.execute();
            return callableStatement.getInt(7);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int updateProductPSU(int id, double sellingPrice, double costPrice, String name, int wattage,
            String efficiency, String image) {
        try {
            // Prepare and execute the SQL statement to update the CPU product
            String sql = "{call updateProductPSU(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setInt(5, wattage);
            callableStatement.setString(6, efficiency);
            callableStatement.setString(7, image);
            callableStatement.registerOutParameter(8, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(8);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removePSU(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[psus]\n"
                + "      WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<RAM> getRAMs(String sql) {
        try {
            PreparedStatement statement = connection.prepareCall(sql);
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
                String image = resultSet.getString("image");
                rams.add(
                        new RAM(generation, capacity, speed, latency, image, name, id, sellingPrice, costPrice, description));
            }
            return rams;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addProductRAM(double sellingPrice, double costPrice, String name, String generation, int capacity,
            int speed, int latency, String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductRAM(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, generation);
            callableStatement.setInt(5, capacity);
            callableStatement.setInt(6, speed);
            callableStatement.setInt(7, latency);
            callableStatement.setString(8, image);
            callableStatement.registerOutParameter(9, Types.INTEGER);

            callableStatement.execute();
            return callableStatement.getInt(9); // Get the product ID from the output parameter
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int updateProductRAM(int id, double sellingPrice, double costPrice, String name, String generation,
            int capacity, int speed, int latency, String image) {
        try {
            String sql = "{call updateProductRAM(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, generation);
            callableStatement.setInt(6, capacity);
            callableStatement.setInt(7, speed);
            callableStatement.setInt(8, latency);
            callableStatement.setString(9, image);
            callableStatement.registerOutParameter(10, Types.VARCHAR);

            callableStatement.execute();

            String result = callableStatement.getString(10);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removeRAM(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[rams] WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<SSD> getSSDs(String sql) {
        try {
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet resultSet = statement.executeQuery();
            ArrayList<SSD> ssds = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String description = resultSet.getString("description");
                String name = resultSet.getString("name");
                String connectionInterface = resultSet.getString("interface");
                int capacity = resultSet.getInt("capacity");
                int cache = resultSet.getInt("cache");
                String image = resultSet.getString("image");
                ssds.add(
                        new SSD(connectionInterface, capacity, cache, image, name, id, sellingPrice, costPrice, description));
            }
            return ssds;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addProductSSD(double sellingPrice, double costPrice, String name, String connectionInterface,
            int capacity, int cache, String image) {
        try {
            Database db = new Database();
            String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
            Statement statement = db.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
            int productId = 0;
            if (resultSet.next()) {
                productId = resultSet.getInt("max_id") + 1;
            }
            String sql = "{call addProductSSD(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = db.connection.prepareCall(sql);

            callableStatement.setDouble(1, sellingPrice);
            callableStatement.setDouble(2, costPrice);
            callableStatement.setString(3, name);
            callableStatement.setString(4, connectionInterface);
            callableStatement.setInt(5, capacity);
            callableStatement.setInt(6, cache);
            callableStatement.setString(7, image);
            callableStatement.registerOutParameter(8, Types.NVARCHAR);

            callableStatement.execute();
            return productId;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int updateProductSSD(int id, double sellingPrice, double costPrice, String name, String connectionInterface,
            int capacity, int cache, String image) {
        try {
            // Prepare and execute the SQL statement to update the SSD product
            String sql = "{call updateProductSSD(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);
            callableStatement.setDouble(2, sellingPrice);
            callableStatement.setDouble(3, costPrice);
            callableStatement.setString(4, name);
            callableStatement.setString(5, connectionInterface);
            callableStatement.setInt(6, capacity);
            callableStatement.setInt(7, cache);
            callableStatement.setString(8, image);
            callableStatement.registerOutParameter(9, Types.VARCHAR);

            callableStatement.execute();

            // Get the result from the output parameter
            String result = callableStatement.getString(9);
            if ("Update successful".equals(result)) {
                return 1;
            } else {
                System.out.println("Error: " + result);
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public int removeSSD(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[ssds] WHERE id = " + id;
        try {
            Statement state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        Database database = new Database();
        // int result = database.addProductPSU(2, 2, "test", 2, "test", "test");
        // int result = database.updateProductRAM(188, 22, 22, "test", "test", 2, 2, 2,
        // "test");

        // if (result == 1) {
        // System.out.println("CPU updated successfully.");
        // } else {
        // System.out.println("Failed to update CPU.");
        // }
        // int id = database.getCPUs("select * from cpus join products on cpus.id=
        // products.id where cpus.id = 10").get(0).getId();
        // System.out.println(id);
        ArrayList<CPU> cpus = database.getCPUs("{call getCPU()}");
        ;
    }

}
