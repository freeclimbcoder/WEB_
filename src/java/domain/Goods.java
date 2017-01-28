package domain;

import java.io.Serializable;
import java.util.ArrayList;

public class Goods implements Serializable{
    int id;
    private String name;
    private int price;
    private String information;
    private String mainPhoto;
    private ArrayList <Property> properties;
    private ArrayList <Review> reviews;
    private ArrayList <String> photos;
    
    public Goods(){
    }
    
    public Goods(int id, String name, int price, String info, String photo){
        this.id = id;
        this.name = name;
        this.price = price;
        this.information = info;
        this.mainPhoto = photo;
    }
    
    public Goods(int id, String name, int price, String info, String photo, 
            ArrayList<Property> properties, ArrayList<Review> reviews,
            ArrayList<String> photos){
        
        this(id, name, price, info, photo);
        
        this.photos = photos;
        this.reviews = reviews;
        this.properties = properties;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getMainPhoto() {
        return mainPhoto;
    }

    public void setMainPhoto(String mainPhoto) {
        this.mainPhoto = mainPhoto;
    }

    public ArrayList<Property> getProperties() {
        return properties;
    }

    public void setProperties(ArrayList<Property> properties) {
        this.properties = properties;
    }

    public ArrayList<Review> getReviews() {
        return reviews;
    }

    public void setReviews(ArrayList<Review> reviews) {
        this.reviews = reviews;
    }

    public ArrayList<String> getPhotos() {
        return photos;
    }

    public void setPhotos(ArrayList<String> photos) {
        this.photos = photos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
}
