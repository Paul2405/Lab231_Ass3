/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import entities.Products;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author haudq
 */
public class ProductCartViewModel implements Serializable{
    private Map<Integer, ProductsViewModel> product;
    private DiscountsViewModel discount;

    public ProductCartViewModel() {
    }

    public Map<Integer, ProductsViewModel> getProduct() {
        return product;
    }

    public void setProduct(Map<Integer, ProductsViewModel> product) {
        this.product = product;
    }

    public DiscountsViewModel getDiscount() {
        return discount;
    }

    public void setDiscount(DiscountsViewModel discount) {
        this.discount = discount;
    }

    
}
