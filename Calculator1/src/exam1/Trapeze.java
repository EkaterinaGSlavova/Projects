/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package exam1;

/**
 *
 * @author fmi
 */
public class Trapeze implements Figure {
    private double a;
    private double b;
    private double h;
    
    
    @Override
    public void readParameters() {
        System.out.print("\n Please enter a: ");
        a = Exam1.input.nextDouble();

        System.out.print("\n Please enter b: ");
        b = Exam1.input.nextDouble();
        
        System.out.print("\n Please enter h: ");
        h = Exam1.input.nextDouble();
    }

    @Override
    public double calculateSurface() {
        return ((a+b)/2)*h;
    }
    
}
