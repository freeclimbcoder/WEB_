package domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Comment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String userName;
    @Lob
    private String message;
    private Date date;

    public Comment() {
    }

    public Comment(String userName, String message) {
        this.userName = userName;
        this.message = message;
        this.date = new Date();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFormatedDate(String lang) {
        if (lang == null)
                lang = "ru";
        SimpleDateFormat dateFormat;
        if (lang.equals("en")) {
            dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        } else {
             dateFormat = new SimpleDateFormat("dd.MM.yyyy");

        }

        return dateFormat.format(this.getDate());
    }

}
