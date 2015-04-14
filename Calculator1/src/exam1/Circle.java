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
public class Circle implements Figure{

    private double r;
    
    @Override
    public void readParameters() {
        System.out.print("\n Please enter r: ");
        r = Exam1.input.nextDouble();
    }

    @Override
    public double calculateSurface() {
       return Math.PI * r * r;
    }
    
}
