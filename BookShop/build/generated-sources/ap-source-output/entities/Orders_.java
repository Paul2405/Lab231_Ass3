package entities;

import entities.Discounts;
import entities.OrderDetails;
import entities.Payments;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, String> address;
    public static volatile ListAttribute<Orders, Payments> paymentsList;
    public static volatile SingularAttribute<Orders, String> city;
    public static volatile SingularAttribute<Orders, Double> totalPrice;
    public static volatile SingularAttribute<Orders, Double> finalPrice;
    public static volatile SingularAttribute<Orders, String> ward;
    public static volatile SingularAttribute<Orders, Users> userId;
    public static volatile SingularAttribute<Orders, String> phoneNumber;
    public static volatile SingularAttribute<Orders, Date> createdDate;
    public static volatile ListAttribute<Orders, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Orders, String> district;
    public static volatile SingularAttribute<Orders, String> orderCode;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Discounts> discountId;
    public static volatile SingularAttribute<Orders, String> status;

}