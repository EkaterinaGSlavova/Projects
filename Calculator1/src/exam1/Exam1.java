/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package exam1;

import java.util.Scanner;
/**
 *
 * @author fmi
 */
public class Exam1 {

    public static Scanner input = new Scanner(System.in);
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("Please choose the figure 1. Circle, 2. Trapeze");
        int choice = input.nextInt();
        Figure figure;
        
        if (choice == 1) figure = new Circle();
        else figure = new Trapeze();
        
        // the same code!!!
        // чрез един и същ програмен код да се въведат размерите на фигурата и да сe изведе лицето й.
        figure.readParameters();
        System.out.println("The surface is " + figure.calculateSurface());
    }
    
}
