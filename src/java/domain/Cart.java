package domain;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
@Embeddable
public class Cart {
    @ElementCollection(fetch = FetchType.EAGER)
    private List <CartItem> cartItemList = new ArrayList<CartItem>() ;

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = (ArrayList<CartItem>)cartItemList;
    }

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public Cart() {
        cartItemList = new ArrayList<CartItem>();
    }

    public Cart(int id) {
        this();
        this.addItem(id);
    }

    public int getTotalPrice() {
        int total = 0;
        for (CartItem item : cartItemList) {
            total += item.getTotalPrice();
        }
        return total;
    }

    public void addItem(int id) {

        for (CartItem item : cartItemList) {
            if (item.checkId(id)) {
                item.incAmount();
                return;
            }
        }
        cartItemList.add(new CartItem(id));
    }

    public void remoreItem(int id) {
        int i = 0;
        for (i = 0; i < cartItemList.size(); i++) {
            if (cartItemList.get(i).checkId(id)) {
                break;
            }
        }
        if (i < cartItemList.size()) {
            if (cartItemList.get(i).getAmount() == 1) {
                cartItemList.remove(i);
            } else {
                cartItemList.get(i).decAmount();
            }

        }
    }

    public void setLang(String lang) {
        for (CartItem item : cartItemList) {
            item.setLang(lang);
        }
    }

    public boolean isEmpty() {
        return cartItemList.isEmpty();
    }
    
   

}
