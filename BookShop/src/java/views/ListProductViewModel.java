/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haudq
 */
public class ListProductViewModel implements  Serializable{
    private int size;
    private List<ProductsViewModel> listProducts = null;

    public ListProductViewModel(int size) {
        this.size = size;
        this.listProducts = new ArrayList<>();
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public List<ProductsViewModel> getListProducts() {
        return listProducts;
    }

    public void setListProducts(List<ProductsViewModel> listProducts) {
        this.listProducts = listProducts;
    }
    
    
}
