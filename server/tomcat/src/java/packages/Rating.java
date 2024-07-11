/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package packages;

import database.Database;
import java.util.ArrayList;

/**
 *
 * @author thang
 */
public class Rating {
    public int id;
    public int userID;
    public int productID;
    public int ratingStar;
    public String ratingText;
    public String dateRated;

    public Rating(int id, int userID, int productID, int ratingStar, String ratingText, String dateRated) {
        this.id = id;
        this.userID = userID;
        this.productID = productID;
        this.ratingStar = ratingStar;
        this.ratingText = ratingText;
        this.dateRated = dateRated;
    }
    
    public Rating(int productId, int userId){
        ArrayList<Rating> list = Database.getRating(productId);
        for (Rating rating : list) {
            if(rating.userID == userId){
                this.id = rating.id;
                this.productID = rating.productID;
                this.userID = rating.userID;
                this.ratingStar = rating.ratingStar;
                this.ratingText = rating.ratingText;
                this.dateRated = rating.dateRated;
                return;
            }
        }
    }

    public int getId() {
        return id;
    }

    public int getUserID() {
        return userID;
    }

    public int getProductID() {
        return productID;
    }

    public int getRatingStar() {
        return ratingStar;
    }

    public String getRatingText() {
        return ratingText;
    }

    public String getDateRated() {
        return dateRated;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setRatingStar(int ratingStar) {
        this.ratingStar = ratingStar;
    }

    public void setRatingText(String ratingText) {
        this.ratingText = ratingText;
    }

    public void setDateRated(String dateRated) {
        this.dateRated = dateRated;
    }   
    
    public static double percentRate(int id){
        ArrayList<Rating> rates = Database.getRating(id);
        double percent = 0;
        int sumStar = 0;
        
        for (Rating rate : rates) {
            sumStar += rate.ratingStar;
        }
        
        percent = (double) sumStar/rates.size();
        return percent;                       
    }
}
