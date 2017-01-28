package domain;
import java.io.Serializable;
import java.util.Random;


public class Review implements Serializable{
    private String author;
    private String review;
    
    public Review(){
        
    }

    public Review(String author, String review) {
        this.author = author;
        this.review = review;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
    
    
}
