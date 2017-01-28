package domain;

import dao.Dao;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class CartItem implements Serializable  {

    public CartItem() {
    }
    
    public CartItem(int id){
        goodsId = id;
        amount = 1;
    }
    
    @Transient
    private Goods goods;
    @Column(name="AMOUNT")
    private int amount;
    @Column(name="GOODS_ID")
    private  int goodsId;
    
    public boolean checkId(int id){
        return (id == goodsId);
    }
    public void incAmount(){
        amount ++;
    }
    public void decAmount(){
        amount --;
    }
    public int getAmount(){
        return amount;
    }
    public void setLang(String lang){
        goods = Dao.getGoodsListItemById(goodsId, lang);
    }
    public String getName(){
        return goods.getName();
    }
    public String getDescription(){
        return goods.getInformation();
    }
    public String getPicture(){
        return goods.getMainPhoto();
    }
    public int getPrice(){
        return goods.getPrice();
    }
    public int getTotalPrice(){
        return (goods.getPrice() * amount);
    }
    
    public int getId(){
        return goodsId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public Goods getGoods() {
        return goods;
    }
    
    
    
}
