
package domain;

import java.io.Serializable;
import java.util.Random;

public class Property implements Serializable{
    
    private String property;
    private String value;

    public Property() {
    }
    
    
    
    public Property(String property, String value){
         this.property = property;
         this.value = value;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    
    
    
}
