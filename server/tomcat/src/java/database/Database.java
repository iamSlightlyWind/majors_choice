package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import main.User;
import packages.*;
import packages.wrap.*;

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

    public boolean userExists(String email) {
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

    public ArrayList<CPU> getCPUs(String inputName) {
        try {
            String sql = "{call getCPU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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

    public ArrayList<GPU> getGPUs(String inputName) {
        try {
            String sql = "{call getGPU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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

    public ArrayList<RAM> getRAMs(String inputName) {
        try {
            String sql = "{call getRAM(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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

    public ArrayList<Motherboard> getMotherboards(String inputName) {
        try {
            String sql = "{call getMotherboard(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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

    public ArrayList<SSD> getSSDs(String inputName) {
        try {
            String sql = "{call getSSD(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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

    public ArrayList<PSU> getPSUs(String inputName) {
        try {
            String sql = "{call getPSU(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, inputName);
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
        // cases.add(new Case(id, sellingPrice, costPrice, description, name, type,
        // formFactor, color));
        // }
        // return cases;
        // } catch (SQLException ex) {
        // Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        // }
        return null;
    }

    public int deleteCart(int userID) {
        try {
            String sql = "{call deleteCart(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int updateCart(int userID, ArrayList<Product> products) {
        if (deleteCart(userID) == 1) {
            try {
                String sql = "{call addToCart(?, ?, ?, ?, ?)}";
                CallableStatement statement = connection.prepareCall(sql);
                for (Product product : products) {
                    statement.setInt(1, userID);
                    statement.setInt(2, product.id);
                    statement.setDouble(3, product.sellingPrice);
                    statement.setDouble(4, product.costPrice);
                    statement.registerOutParameter(5, Types.INTEGER);

                    statement.execute();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
                return -1;
            }
        } else
            return -1;
        return 1;
    }

    public int placeOrder(int userID) {
        try {
            String sql = "{call placeOrder(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();

            if (statement.getInt(2) == 1) {
                deleteCart(userID);
            }

            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        deleteCart(userID);
        return 1;
    }

    public ArrayList<Product> getCart(int userID) {
        ArrayList<CPU> cpus = getCPUs("");
        ArrayList<GPU> gpus = getGPUs("");
        ArrayList<Motherboard> motherboards = getMotherboards("");
        ArrayList<RAM> rams = getRAMs("");
        ArrayList<SSD> ssds = getSSDs("");
        ArrayList<PSU> psus = getPSUs("");
        ArrayList<Case> cases = getCases();
        ArrayList<Product> products = new ArrayList<>();

        try {
            String sql = "{call getCartItems(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("productId");
                double sellingPrice = resultSet.getDouble("sellingPrice");
                double costPrice = resultSet.getDouble("costPrice");
                String type = resultSet.getString("productType");
                switch (type) {
                    case "CPU":
                        for (CPU cpu : cpus) {
                            if (cpu.id == id) {
                                cpu.sellingPrice = sellingPrice;
                                cpu.costPrice = costPrice;
                                products.add(cpu);
                                break;
                            }
                        }
                        break;
                    case "GPU":
                        for (GPU gpu : gpus) {
                            if (gpu.id == id) {
                                gpu.sellingPrice = sellingPrice;
                                gpu.costPrice = costPrice;
                                products.add(gpu);
                                break;
                            }
                        }
                        break;
                    case "Motherboard":
                        for (Motherboard motherboard : motherboards) {
                            if (motherboard.id == id) {
                                motherboard.sellingPrice = sellingPrice;
                                motherboard.costPrice = costPrice;
                                products.add(motherboard);
                                break;
                            }
                        }
                        break;
                    case "RAM":
                        for (RAM ram : rams) {
                            if (ram.id == id) {
                                ram.sellingPrice = sellingPrice;
                                ram.costPrice = costPrice;
                                products.add(ram);
                                break;
                            }
                        }
                        break;
                    case "SSD":
                        for (SSD ssd : ssds) {
                            if (ssd.id == id) {
                                ssd.sellingPrice = sellingPrice;
                                ssd.costPrice = costPrice;
                                products.add(ssd);
                                break;
                            }
                        }
                        break;
                    case "PSU":
                        for (PSU psu : psus) {
                            if (psu.id == id) {
                                psu.sellingPrice = sellingPrice;
                                psu.costPrice = costPrice;
                                products.add(psu);
                                break;
                            }
                        }
                        break;
                    case "Case":
                        for (Case c : cases) {
                            if (c.id == id) {
                                c.sellingPrice = sellingPrice;
                                c.costPrice = costPrice;
                                products.add(c);
                                break;
                            }
                        }
                        break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Order> getOrders(int userID) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "{call getOrders(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                boolean found = false;
                for (Order order : orders) {
                    if (order.id == resultSet.getInt("id")) {
                        found = true;
                        order.products
                                .add(new Product(resultSet.getInt("productId"), resultSet.getString("productName"),
                                        resultSet.getDouble("sellingPrice"), resultSet.getDouble("costPrice")));
                        order.user = new User();
                        order.user.id = resultSet.getInt("userId") + "";
                        order.user.retrieveData("user");
                        break;
                    }
                }

                if (!found) {
                    Order order = new Order(resultSet.getInt("id"), resultSet.getString("status"));
                    orders.add(order);
                    order.products.add(new Product(resultSet.getInt("productId"), resultSet.getString("productName"),
                            resultSet.getDouble("sellingPrice"), resultSet.getDouble("costPrice")));
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (Order order : orders) {
            order.updateQuantity();
        }
        return orders;
    }

    public ArrayList<User> getUserDetails(String tableName) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "{call GetUserDetails(?)}";
            CallableStatement statement = this.connection.prepareCall(sql);
            statement.setString(1, tableName);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                if (tableName.equals("staffs")) {
                    user.username = rs.getString("username");
                    user.retrieveData("staff");
                    users.add(user);
                } else {
                    user.username = rs.getString("username");
                    user.retrieveData("user");
                    users.add(user);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return users;
    }

    public int addStaff(User staff) {
        try {
            String sql = "{call addStaff(?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, staff.username);
            statement.setString(2, staff.password);
            statement.setString(3, staff.fullName);
            statement.registerOutParameter(4, Types.INTEGER);

            statement.execute();
            return statement.getInt(4);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int updateStaff(User staff) {
        try {
            String sql = "{call updateStaff(?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, Integer.parseInt(staff.id));
            statement.setString(2, staff.username);
            statement.setString(3, staff.password);
            statement.setString(4, staff.fullName);
            statement.setInt(5, staff.active);
            statement.registerOutParameter(6, Types.INTEGER);

            statement.execute();
            return statement.getInt(6);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public String getOrderStatus(int orderId) {
        String result = "";
        try {
            String sql = "{call getOrderStatus(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getString("status");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        switch (result) {
            case "Pending":
                return "pending";
            case "Cancellation Requested":
                return "cancel";
            case "Cancelled":
                return "cancelled";
            case "Cancellation Denied, Shipping Pending":
                return "denied";
            case "Shipping":
                return "shipping";
            case "Completed":
                return "completed";
            default:
                return null;
        }
    }

    public boolean updateOrder(int id, String action) {
        String current = getOrderStatus(id);
        System.out.println(">> Status: " + current);

        switch (action) {
            case "cancel":
                if (current.equals("pending")) {
                    RequestOrderCancel(id);
                    return true;
                } else
                    return false;
            case "approve":
                if (current.equals("cancel")) {
                    ApproveOrderCancel(id);
                    return true;
                } else
                    return false;
            case "deny":
                if (current.equals("cancel")) {
                    DenyOrderCancel(id);
                    return true;
                } else
                    return false;
            case "ship":
                if (current.equals("pending") || current.equals("denied")) {
                    ShipOrder(id);
                    return true;
                } else
                    return false;
            case "complete":
                if (current.equals("shipping")) {
                    CompleteOrder(id);
                    return true;
                } else
                    return false;
        }
        return false;
    }

    public void CompleteOrder(int orderId) {
        try {
            String sql = "{call CompleteOrder(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void ShipOrder(int orderId) {
        try {
            String sql = "{call ShipOrder(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DenyOrderCancel(int orderId) {
        try {
            String sql = "{call DenyOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void ApproveOrderCancel(int orderId) {
        try {
            String sql = "{call ApproveOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void RequestOrderCancel(int orderId) {
        try {
            String sql = "{call RequestOrderCancel(?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, orderId);

            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}