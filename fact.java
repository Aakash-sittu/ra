
//Java Program to find the Factorial of a Number
import java.util.*;

public class fact {
    public static void main(String[] args) {
        int facto = 1;
        try (// Take input from the user
             // Create an instance of the Scanner Class
                Scanner sc = new Scanner(System.in)) {
            // Declare and Initialize the variable
            System.out.println("Enter the number: ");
            int num = sc.nextInt();
            int i = 1;
            while (i <= num) {
                facto = facto * i;
                i++;
            }
        }
        System.out.println("Factorial of the number: " + facto);
    }
}