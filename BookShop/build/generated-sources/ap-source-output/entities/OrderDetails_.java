package entities;

import entities.Orders;
import entities.Products;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Double> unitPrice;
    public static volatile SingularAttribute<OrderDetails, Integer> quantity;
    public static volatile SingularAttribute<OrderDetails, Date> createdDate;
    public static volatile SingularAttribute<OrderDetails, Products> productId;
    public static volatile SingularAttribute<OrderDetails, Double> totalPrice;
    public static volatile SingularAttribute<OrderDetails, Orders> orderId;
    public static volatile SingularAttribute<OrderDetails, Integer> id;
    public static volatile SingularAttribute<OrderDetails, String> productName;
    public static volatile SingularAttribute<OrderDetails, String> status;

}