package data;

public class GenerateData {
    public static String getEmail(){
        int random = (int)Math.random()*100000;
        return "student---tek" + random+"@gmail.com";
    }
}
