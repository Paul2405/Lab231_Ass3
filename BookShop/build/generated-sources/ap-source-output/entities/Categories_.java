package entities;

import entities.Products;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(Categories.class)
public class Categories_ { 

    public static volatile ListAttribute<Categories, Products> productsList;
    public static volatile SingularAttribute<Categories, Users> creator;
    public static volatile SingularAttribute<Categories, Date> createdDate;
    public static volatile SingularAttribute<Categories, Date> revisionDate;
    public static volatile SingularAttribute<Categories, String> description;
    public static volatile SingularAttribute<Categories, Integer> id;
    public static volatile SingularAttribute<Categories, String> categoryCode;
    public static volatile SingularAttribute<Categories, Integer> type;
    public static volatile SingularAttribute<Categories, String> categoryName;
    public static volatile SingularAttribute<Categories, String> status;

}