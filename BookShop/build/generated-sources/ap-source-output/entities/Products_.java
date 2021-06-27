package entities;

import entities.Categories;
import entities.OrderDetails;
import entities.ProductChangeHistorys;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, String> images;
    public static volatile SingularAttribute<Products, Users> creator;
    public static volatile SingularAttribute<Products, Integer> quantity;
    public static volatile SingularAttribute<Products, String> author;
    public static volatile SingularAttribute<Products, Date> revisionDate;
    public static volatile SingularAttribute<Products, String> description;
    public static volatile SingularAttribute<Products, String> productName;
    public static volatile ListAttribute<Products, ProductChangeHistorys> productChangeHistorysList;
    public static volatile SingularAttribute<Products, String> productCode;
    public static volatile SingularAttribute<Products, Date> createdDate;
    public static volatile ListAttribute<Products, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Products, Double> uniPrice;
    public static volatile SingularAttribute<Products, Integer> id;
    public static volatile SingularAttribute<Products, Categories> categoryId;
    public static volatile SingularAttribute<Products, String> status;

}