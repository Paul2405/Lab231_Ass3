/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author haudq
 */
@Entity
@Table(name = "Products")
@XmlRootElement
@NamedQueries({
    // select all by product name using admin
    @NamedQuery(name = "Products.findByProductNameAdminAsc", query = "SELECT p FROM Products p where p.productName like :productName order by p.createdDate asc"),
    @NamedQuery(name = "Products.findByProductNameAdminDesc", query = "SELECT p FROM Products p where p.productName like :productName order by p.createdDate desc"),
    @NamedQuery(name = "Products.countByProductNameAdmin", query = "SELECT count(p) FROM Products p where p.productName like :productName "),
    // select by status product name using admin
    @NamedQuery(name = "Products.findByStatusProductNameAdminAsc", query = "SELECT p FROM Products p WHERE p.status = :status and p.productName like :productName order by p.createdDate asc"),
    @NamedQuery(name = "Products.findByStatusProductNameAdminDesc", query = "SELECT p FROM Products p WHERE p.status = :status and p.productName like :productName order by p.createdDate desc"),
    @NamedQuery(name = "Products.countByStatusProductNameAdmin", query = "SELECT count(p) FROM Products p WHERE p.status = :status and p.productName like :productName"),
    // select by category using admin
    @NamedQuery(name = "Products.findByCategoryProductNameAdminAsc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.productName like :productName order by p.createdDate asc"),
    @NamedQuery(name = "Products.findByCategoryProductNameAdminDesc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.productName like :productName order by p.createdDate desc"),
    @NamedQuery(name = "Products.countByCategoryProductNameAdmin", query = "SELECT count(p) FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.productName like :productName"),
    // select by cate and status using admin
    @NamedQuery(name = "Products.findByCateStaProductNameAdminAsc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.status = :status and p.productName like :productName order by p.createdDate asc"),
    @NamedQuery(name = "Products.findByCateStaProductNameAdminDesc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.status = :status and p.productName like :productName order by p.createdDate desc"),
    @NamedQuery(name = "Products.countByCateStaProductNameAdmin", query = "SELECT count(p) FROM Products p WHERE p.categoryId.categoryName = :categoryName and p.status = :status and p.productName like :productName"),
//
    @NamedQuery(name = "Products.findById", query = "SELECT p FROM Products p WHERE p.id = :id"),
        @NamedQuery(name = "Products.findByIdUser", query = "SELECT p FROM Products p WHERE p.id = :id and p.quantity > 0"),

    //
    @NamedQuery(name = "Products.getProductsActivedAsc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName IN :cateName and p.uniPrice >= :min and p.uniPrice <= :max and p.productName Like :productName and p.quantity > 0 and p.status = :status order by p.createdDate asc"),
    @NamedQuery(name = "Products.getProductsActivedDesc", query = "SELECT p FROM Products p WHERE p.categoryId.categoryName IN :cateName and p.uniPrice >= :min and p.uniPrice <= :max and p.productName Like :productName and p.quantity > 0 and p.status = :status order by p.createdDate desc"),
    @NamedQuery(name = "Products.countProductsActived", query = "SELECT count(p) FROM Products p WHERE p.categoryId.categoryName IN :cateName and p.uniPrice >= :min and p.uniPrice <= :max and p.productName Like :productName and p.quantity > 0 and p.status = :status"),
//
    @NamedQuery(name = "Products.findByProductCode", query = "SELECT p FROM Products p WHERE p.productCode = :productCode"),
    @NamedQuery(name = "Products.findByDescription", query = "SELECT p FROM Products p WHERE p.description = :description"),
    @NamedQuery(name = "Products.findByCreatedDate", query = "SELECT p FROM Products p WHERE p.createdDate = :createdDate"),
    @NamedQuery(name = "Products.findByRevisionDate", query = "SELECT p FROM Products p WHERE p.revisionDate = :revisionDate"),
    @NamedQuery(name = "Products.findByUniPrice", query = "SELECT p FROM Products p WHERE p.uniPrice = :uniPrice"),
    @NamedQuery(name = "Products.findByImages", query = "SELECT p FROM Products p WHERE p.images = :images"),
    @NamedQuery(name = "Products.findByQuantity", query = "SELECT p FROM Products p WHERE p.quantity = :quantity"),
    @NamedQuery(name = "Products.findByStatus", query = "SELECT p FROM Products p WHERE p.status = :status")})
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "ProductCode")
    private String productCode;
    @Column(name = "ProductName")
    private String productName;
    @Column(name = "Description")
    private String description;
       @Column(name = "Author")
    private String author;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "RevisionDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date revisionDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "UniPrice")
    private Double uniPrice;
    @Column(name = "Images")
    private String images;
    @Column(name = "Quantity")
    private Integer quantity;
    @Column(name = "Status")
    private String status;
    @JoinColumn(name = "CategoryId", referencedColumnName = "Id")
    @ManyToOne
    private Categories categoryId;
    @JoinColumn(name = "Creator", referencedColumnName = "Id")
    @ManyToOne
    private Users creator;
    @OneToMany(mappedBy = "productId")
    private List<OrderDetails> orderDetailsList;
    @OneToMany(mappedBy = "productId")
    private List<ProductChangeHistorys> productChangeHistorysList;

    public Products() {
        this.createdDate = this.revisionDate = Calendar.getInstance().getTime();
        this.status = "Actived";
        this.images = "";
        this.uniPrice = 0d;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Products(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getRevisionDate() {
        return revisionDate;
    }

    public void setRevisionDate(Date revisionDate) {
        this.revisionDate = revisionDate;
    }

    public Double getUniPrice() {
        return uniPrice;
    }

    public void setUniPrice(Double uniPrice) {
        this.uniPrice = uniPrice;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Categories getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Categories categoryId) {
        this.categoryId = categoryId;
    }

    public Users getCreator() {
        return creator;
    }

    public void setCreator(Users creator) {
        this.creator = creator;
    }

    @XmlTransient
    public List<OrderDetails> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    @XmlTransient
    public List<ProductChangeHistorys> getProductChangeHistorysList() {
        return productChangeHistorysList;
    }

    public void setProductChangeHistorysList(List<ProductChangeHistorys> productChangeHistorysList) {
        this.productChangeHistorysList = productChangeHistorysList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Products[ id=" + id + " ]";
    }

}
