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
public class ListDiscountViewModel implements  Serializable{
    private int size;
    private List<DiscountsViewModel> listDiscounts = null;

    public ListDiscountViewModel(int size) {
        this.size = size;
        this.listDiscounts = new ArrayList<>();
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public List<DiscountsViewModel> getListDiscounts() {
        return listDiscounts;
    }

    public void setListDiscounts(List<DiscountsViewModel> listDiscounts) {
        this.listDiscounts = listDiscounts;
    }
    
    
}
