package data;

    public class GenerateData {

        public static String getEmail() {
            int random = (int)(Math.random() * 1000000000);
            return "instructor" + random + "@tekschool.us";
        }
    }

