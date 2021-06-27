package entities;

import entities.Products;
import entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-06-26T15:54:00")
@StaticMetamodel(ProductChangeHistorys.class)
public class ProductChangeHistorys_ { 

    public static volatile SingularAttribute<ProductChangeHistorys, String> newValue;
    public static volatile SingularAttribute<ProductChangeHistorys, Date> createdDate;
    public static volatile SingularAttribute<ProductChangeHistorys, Products> productId;
    public static volatile SingularAttribute<ProductChangeHistorys, Integer> id;
    public static volatile SingularAttribute<ProductChangeHistorys, String> oldValue;
    public static volatile SingularAttribute<ProductChangeHistorys, Users> userChangeId;
    public static volatile SingularAttribute<ProductChangeHistorys, String> columnName;

}