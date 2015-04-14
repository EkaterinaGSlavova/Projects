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
public class Ski extends Product{
    private double width;
    private double lenght;   

    public Ski(double width, double height, double price) {
        super(price);
        this.width = width;
        this.lenght = height;
    }

    @Override
    public String toString() {
        return "Ski{" + "width=" + width + ", height=" + lenght + ", price=" + price + '}';
    }   
}
