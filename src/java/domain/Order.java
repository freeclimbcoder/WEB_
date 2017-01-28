package domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity(name = "ORDERS")
public class Order implements Serializable {
   
    @Id
    @Column(name = "ORDER_ID")
    @GeneratedValue(strategy =GenerationType.AUTO)
    private int id;
    
    @Embedded
    private Cart cart;
    
    @Column(name="USER_NAME")
    private String userName;
    
    @Column(name="DELIVERY")
    private boolean delivery;
    
    @Column(name="ADDRESS")
    private String address;
    
    @Column(name="DATE")
    private Date date;
    
    private Order(){
    }

    public Order(Cart cart, String userName, boolean delivery, String address) {
        this.cart = cart;
        this.userName = userName;
        this.delivery = delivery;
        this.address = address;
        date = new Date();
    }

    public Cart getCart() {
        return cart;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public boolean isDelivery() {
        return delivery;
    }

    public String getAddress() {
        return address;
    }

    public Date getDate() {
        return date;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setDelivery(boolean delivery) {
        this.delivery = delivery;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public int getTotalPrice(){
        return cart.getTotalPrice();
    }
    
      
}
