/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import views.DiscountsViewModel;
import views.ProductCartViewModel;
import views.ProductsViewModel;

/**
 *
 * @author haudq
 */
public class ProductCart implements Serializable {

    private Map<Integer, ProductsViewModel> product = null;
    private DiscountsViewModel discount = null;

    public ProductCart() {
        this.product = new TreeMap<Integer, ProductsViewModel>();
    }

    public DiscountsViewModel getDiscount() {
        return discount;
    }

    public void setDiscount(DiscountsViewModel discount) {
        this.discount = discount;
    }
    
    public void addToCard(Integer id, ProductsViewModel productsViewModel) {
        ProductsViewModel temp = product.get(id);
        if (temp != null) {
            product.remove(id);
        } else {
            temp = productsViewModel;
        }
        Integer quantity = temp.getQuantity();
        temp.setQuantity(quantity + 1);
        Double total = temp.getQuantity() * temp.getPrice();
        temp.setTotalPrice(total);
        product.put(id, temp);
    }

    public boolean remove(int id) {
        ProductsViewModel productsViewModel = product.remove(id);
        if (productsViewModel != null) {
            return true;
        }
        return false;
    }

    public ProductCartViewModel get() {
        ProductCartViewModel cartViewModel = new ProductCartViewModel();
        cartViewModel.setProduct(product);
        cartViewModel.setDiscount(discount);
        return cartViewModel;
    }

    public boolean update(Integer id, Integer quantity) {
        ProductsViewModel temp = product.get(id);
        temp.setQuantity(quantity);
        Double total = temp.getQuantity() * temp.getPrice();
        temp.setTotalPrice(total);
        temp = product.put(id, temp);
        if (temp != null) {
            return true;
        } else {
            return false;
        }
    }
}
