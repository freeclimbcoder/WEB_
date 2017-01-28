package ui;

public class LangStringValidator {
    public static boolean valid(String lang){
       return ((lang != null) &&
               (   lang.equals("ru") || 
                   lang.equals("en") || 
                   lang.equals("ua"))); 
    }
    
}
