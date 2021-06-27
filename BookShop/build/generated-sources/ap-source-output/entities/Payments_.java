package entities;

import entities.Orders;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Payments.class)
public class Payments_ { 

    public static volatile SingularAttribute<Payments, Double> amount;
    public static volatile SingularAttribute<Payments, Date> createdDate;
    public static volatile SingularAttribute<Payments, Orders> orderId;
    public static volatile SingularAttribute<Payments, Users> customerId;
    public static volatile SingularAttribute<Payments, Integer> id;
    public static volatile SingularAttribute<Payments, String> paymentType;
    public static volatile SingularAttribute<Payments, String> status;

}