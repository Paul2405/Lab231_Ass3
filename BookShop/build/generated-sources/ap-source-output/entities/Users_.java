package entities;

import entities.Categories;
import entities.Discounts;
import entities.Orders;
import entities.Payments;
import entities.ProductChangeHistorys;
import entities.Products;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> country;
    public static volatile SingularAttribute<Users, String> images;
    public static volatile ListAttribute<Users, Products> productsList;
    public static volatile SingularAttribute<Users, String> address;
    public static volatile ListAttribute<Users, Payments> paymentsList;
    public static volatile SingularAttribute<Users, String> city;
    public static volatile SingularAttribute<Users, String> roles;
    public static volatile SingularAttribute<Users, String> ward;
    public static volatile ListAttribute<Users, Discounts> discountsList;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile ListAttribute<Users, ProductChangeHistorys> productChangeHistorysList;
    public static volatile SingularAttribute<Users, String> phoneNumber;
    public static volatile SingularAttribute<Users, Double> balance;
    public static volatile SingularAttribute<Users, String> district;
    public static volatile ListAttribute<Users, Categories> categoriesList;
    public static volatile SingularAttribute<Users, Integer> id;
    public static volatile SingularAttribute<Users, String> fullname;
    public static volatile SingularAttribute<Users, String> email;
    public static volatile ListAttribute<Users, Orders> ordersList;
    public static volatile SingularAttribute<Users, String> username;
    public static volatile SingularAttribute<Users, String> status;
    public static volatile SingularAttribute<Users, Date> createDate;

}