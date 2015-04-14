/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package exam2;

/**
 *
 * @author fmi
 */
public class Exam2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Ski mySki = new Ski(5.4, 150.4, 234.00);
        Bicycle myBicycle = new Bicycle("Mountain bike model 345", 689.95);
        System.out.println(mySki);
        System.out.println(myBicycle);
        System.out.println("Lower price is: " + compareProducts(mySki, myBicycle));
    }
    
    private static double compareProducts(Product pr1, Product pr2) {
        return (pr1.getPrice() < pr2.getPrice())? pr1.getPrice() : pr2.getPrice(); 
    }
    
}
