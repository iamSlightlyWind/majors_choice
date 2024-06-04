package packages;

import packages.wrap.Package;

public class CPU extends Package {
    public String name;
    public String generation;
    public String socket;
    public int cores;
    public int threads;
    public int baseClock;
    public int boostClock;
    public int tdp;
    public int id;
    public double sellingPrice;
    public double costPrice;
    public String description;

    public CPU(int id, double sellingPrice, double costPrice, String description, String name, String generation,
            String socket, int cores, int threads, int baseClock, int boostClock, int tdp) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.generation = generation;
        this.socket = socket;
        this.cores = cores;
        this.threads = threads;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
    }

    /*
     * create procedure getInformationCPU
     * 
     * @id int,
     * 
     * @sellingPrice decimal(18,2) output,
     * 
     * @costPrice decimal(18,2) output,
     * 
     * @description nvarchar(max) output,
     * 
     * @name nvarchar(50) output,
     * 
     * @generation nvarchar(50) output,
     * 
     * @socket nvarchar(10) output,
     * 
     * @cores int output,
     * 
     * @threads int output,
     * 
     * @baseClock int output,
     * 
     * @boostClock int output,
     * 
     * @tdp int output
     * as
     * begin
     * select @sellingPrice = sellingPrice, @costPrice = costPrice, @description =
     * description
     * from products
     * where id = @id;
     * 
     * select @name = name, @generation = generation, @socket = socket, @cores =
     * cores, @threads = threads, @baseClock = baseClock, @boostClock =
     * boostClock, @tdp = tdp
     * from cpus
     * where id = @id;
     * end
     * go
     */

    public void getInformation() {
        
    }
}