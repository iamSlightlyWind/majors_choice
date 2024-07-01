package packages.wrap;

import java.util.ArrayList;
import main.User;
import packages.*;

public class Validation {

    static ArrayList<CPU> cpus = new ArrayList<CPU>();
    static ArrayList<GPU> gpus = new ArrayList<GPU>();
    static ArrayList<RAM> rams = new ArrayList<RAM>();
    static ArrayList<Motherboard> motherboard = new ArrayList<Motherboard>();
    static ArrayList<PSU> psus = new ArrayList<PSU>();
    static ArrayList<SSD> storages = new ArrayList<SSD>();

    public static void validate(Cart cart) {
        for (Product product : cart.products) {
            if (product instanceof CPU) {
                cpus.add((CPU) product);
            } else if (product instanceof GPU) {
                gpus.add((GPU) product);
            } else if (product instanceof RAM) {
                rams.add((RAM) product);
            } else if (product instanceof Motherboard) {
                motherboard.add((Motherboard) product);
            } else if (product instanceof PSU) {
                psus.add((PSU) product);
            } else if (product instanceof SSD) {
                storages.add((SSD) product);
            }
        }

        System.out.println("Socket: " + socketMatch());
        System.out.println("Graphics: " + graphicsOutput());
        System.out.println("RAM Type: " + ramType());
        System.out.println("RAM Matching: " + ramMatching());
        System.out.println("RAM Speed: " + ramSpeed());
        System.out.println("RAM Capacity: " + ramCapacity());
        System.out.println("Power Budget: " + powerBudget());
    }

    @SuppressWarnings("unused")
    static int powerConsumption() {
        int totalPower = 0;
        for (CPU cpu : cpus) {
            totalPower += cpu.tdp;
        }

        for (GPU gpu : gpus) {
            totalPower += gpu.tdp;
        }

        for (Motherboard mobo : motherboard) {
            totalPower += 50;
        }

        for (RAM ram : rams) {
            totalPower += 5;
        }

        for (SSD storage : storages) {
            totalPower += 5;
        }

        return totalPower + 20;
    }

    static String powerBudget() {
        String error = checkQuantity(new String[] { "psu" });

        if (!error.equals("")) {
            return error;
        } else {
            if (powerConsumption() * 1.3 > psus.get(0).wattage * 0.8) {
                return pass("powerBudgetOptimal");
            } else if (powerConsumption() > psus.get(0).wattage) {
                return error("powerBudgetNotOptimal");
            } else {
                return error("powerBudgetNotEnough");
            }
        }
    }

    static String ramCapacity() {
        String error = checkQuantity(new String[] { "ram" });

        if (!error.equals("")) {
            return error;
        } else {
            error = checkQuantity(new String[] { "motherboard" });
            if (!error.equals("")) {
                return error;
            } else {
                int totalCapacity = 0;
                for (RAM ram : rams) {
                    totalCapacity += ram.capacity;
                }
                if (totalCapacity > motherboard.get(0).maxRamCapacity) {
                    return error("ramCapacity");
                }else return pass("ramCapacity");
            }
        }
    }

    static int ramSticks() {
        int ramSticks = 0;
        for (RAM ram : rams) {
            if (ram.generation.equals("DDR5") && ram.capacity == 64) {
                ramSticks += 2;
            } else {
                ramSticks++;
            }
        }
        return ramSticks;
    }

    static String ramMatching() {
        String error = checkQuantity(new String[] { "ram" });

        if (!error.equals("")) {
            return error;
        } else {
            if (ramSticks() % 2 != 0) {
                return error("ramQuantityEvenError");
            } else {
                for (int i = 0; i < rams.size() - 1; i++) {
                    if (!rams.get(i).compare(rams.get(i + 1))) {
                        return error("ramMismatch");
                    }
                }
            }
        }

        return pass("ramMatching");
    }

    static String ramType() {
        String error = checkQuantity(new String[] { "ram" });

        if (!error.equals("")) {
            return error;
        } else {
            error = checkQuantity(new String[] { "motherboard" });
            if (!error.equals("")) {
                return error;
            }
            if (rams.get(0).generation.equals("DDR4") && motherboard.get(0).ramType.equals("DDR5")) {
                return error("DDR4RamMismatch");
            } else if (rams.get(0).generation.equals("DDR5") && motherboard.get(0).ramType.equals("DDR4")) {
                return error("DDR5RamMismatch");
            } else if (ramSticks() > motherboard.get(0).ramSlots) {
                return error("moreRamThanSlots");
            }
        }

        return pass("ramType");
    }

    static String ramSpeed() {
        String error = checkQuantity(new String[] { "ram" });

        if (!error.equals("")) {
            return error;
        } else {
            error = checkQuantity(new String[] { "motherboard" });
            if (!error.equals("")) {
                return error;
            }
            for (RAM ram : rams) {
                if (ram.speed > motherboard.get(0).maxRamSpeed) {
                    return error("ramFasterThanMobo");
                }
            }
        }

        return pass("ramSpeed");
    }

    static String socketMatch() {
        String[] components = { "cpu", "motherboard" };
        String error = checkQuantity(components);

        if (!error.equals("")) {
            return error;
        } else {
            if (cpus.get(0).socket.equals(motherboard.get(0).socket)) {
                return pass("socketMatch");
            } else {
                return error("socketMismatch");
            }
        }
    }

    static String graphicsOutput() {
        String error;

        error = checkQuantity(new String[] { "gpu" });
        if (error.equals("")) {
            return pass("gpuPresent");
        } else {
            error = checkQuantity(new String[] { "cpu", "motherboard" });
            if (!error.equals("")) {
                return "No GPU present. " + error;
            } else if (error.equals("")) {
                if (!cpus.get(0).igpu.equals("") && motherboard.get(0).igpu == 1) {
                    return pass("igpuGraphicsOutput");
                } else if (cpus.get(0).igpu.equals("") && motherboard.get(0).igpu == 1) {
                    return error("igpuMoboNoCPU");
                } else if (!cpus.get(0).igpu.equals("") && motherboard.get(0).igpu == 0) {
                    return error("igpuCPUNoMobo");
                }
            }
        }

        return "";
    }

    static String pass(String message) {
        switch (message) {
            case "socketMatch":
                return "Sockets match. CPU and Motherboard are compatible.";
            case "gpuPresent":
                return "GPU(s) present, can output graphics.";
            case "igpuGraphicsOutput":
                return "Motherboard and CPU can output integrated graphics. Consider a discrete GPU for better performance.";
            case "ramMatching":
                return "RAM sticks matched. Same model of RAM sticks present.";
            case "ramType":
                return "RAM type matched. RAM and Motherboard are compatible.";
            case "ramSpeed":
                return "RAM can be used with the motherboard.";
            case "powerBudgetOptimal":
                return "Power budget is optimal. PSU wattage is 30% more than cart specification power consumption.";
            case "ramCapacity":
                return "RAM capacity is within the motherboard's supported capacity.";
            default:
                return "Unknown error.";
        }
    }

    static String error(String compactError) {
        switch (compactError) {
            case "socketMismatch":
                return "Sockets do not match. CPU and motherboard are not compatible.";
            case "igpuMoboNoCPU":
                return "No GPU present. However, Motherboard can output integrated graphics, but CPU cannot. Consider a CPU with integrated graphics.";
            case "igpuCPUNoMobo":
                return "No GPU present. However, CPU can output integrated graphics, but motherboard cannot. Consider a motherboard with integrated graphics.";
            case "DDR4RamMismatch":
                return "Motherboard supports DDR4 RAM, but DDR5 RAM is in the cart. Consider using DDR4 RAM instead or a different motherboard.";
            case "DDR5RamMismatch":
                return "Motherboard supports DDR5 RAM, but DDR4 RAM is in the cart. Consider using DDR5 RAM instead or a different motherboard.";
            case "ramMismatch":
                return "There are different models of RAM in the cart. Consider using the same model for better performance.";
            case "ramQuantityEvenError":
                return "There should be an even number of RAM sticks in the cart for dual-channel or quad-channel memory. Consider adjusting the quantity of RAM sticks accordingly.";
            case "moreRamThanSlots":
                return "There are more RAM sticks in the cart than there are slots on the motherboard. Consider adjusting the quantity of RAM sticks or using a different motherboard.";
            case "ramFasterThanMobo":
                return "The RAM speed is faster than the motherboard's supported speed and will be underclocked. Consider using RAM with a speed that the motherboard supports.";
            case "powerBudgetNotOptimal":
                return "Power budget is not optimal. PSU wattage is not 30% more than cart specification power consumption. Consider using a PSU with higher wattage.";
            case "powerBudgetNotEnough":
                return "Power budget is not enough. PSU wattage is less than cart specification power consumption. Consider using a PSU with higher wattage.";
        }

        String error = "";
        switch (compactError) {
            case "cpuQuantity+":
                error = "there should be only one CPU in the cart.";
                break;
            case "cpuQuantity-":
                error = "there should be a CPU in the cart.";
                break;
            case "moboQuantity+":
                error = "there should be only one motherboard in the cart.";
                break;
            case "moboQuantity-":
                error = "there should be a motherboard in the cart.";
                break;
            case "psuQuantity+":
                error = "there should be only one PSU in the cart.";
                break;
            case "psuQuantity-":
                error = "there should be a PSU in the cart.";
                break;
            case "gpuQuantity-":
                error = "there should be a GPU in the cart.";
                break;
            case "ramQuantity-":
                error = "there should be at least one RAM stick in the cart.";
                break;
        }

        return "To validate, " + error;
    }

    static String checkQuantity(String[] components) {
        for (int i = 0; i < components.length; i++) {
            switch (components[i]) {
                case "cpu":
                    if (cpus.size() > 1) {
                        return error("cpuQuantity+");
                    } else if (cpus.size() == 0) {
                        return error("cpuQuantity-");
                    }
                    break;
                case "motherboard":
                    if (motherboard.size() > 1) {
                        return error("moboQuantity+");
                    } else if (motherboard.size() == 0) {
                        return error("moboQuantity-");
                    }
                    break;
                case "psu":
                    if (psus.size() > 1) {
                        return error("psuQuantity+");
                    } else if (psus.size() == 0) {
                        return error("psuQuantity-");
                    }
                    break;
                case "gpu":
                    if (gpus.size() > 0) {
                        return "";
                    } else if (gpus.size() == 0) {
                        return error("gpuQuantity-");
                    }
                    break;
                case "ram":
                    if (rams.size() > 0) {
                        return "";
                    } else if (rams.size() == 0) {
                        return error("ramQuantity-");
                    }
                    break;
            }
        }
        return "";
    }

    public static void main(String[] args) {
        User currentUser = new User();
        currentUser.username = "phong";
        currentUser.retrieveData("user");

        currentUser.cart.validate();
    }
}