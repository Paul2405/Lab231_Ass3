package entities;

import entities.Orders;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Discounts.class)
public class Discounts_ { 

    public static volatile SingularAttribute<Discounts, Users> creator;
    public static volatile SingularAttribute<Discounts, Double> discountPercent;
    public static volatile SingularAttribute<Discounts, Date> createdDate;
    public static volatile SingularAttribute<Discounts, String> code;
    public static volatile SingularAttribute<Discounts, Date> modifyDate;
    public static volatile SingularAttribute<Discounts, String> name;
    public static volatile ListAttribute<Discounts, Orders> orderList;
    public static volatile SingularAttribute<Discounts, Integer> id;

}