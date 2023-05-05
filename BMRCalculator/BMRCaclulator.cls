public class BMRCalculator {
    public static Double calculateBMR(String gender, Double weight, Double height, Integer age) {
        Double bmr = 0.0;
        
        if (gender.equalsIgnoreCase('male')) {
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
        } else if (gender.equalsIgnoreCase('female')) {
            bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
        }
        
        return bmr;
    }
}
