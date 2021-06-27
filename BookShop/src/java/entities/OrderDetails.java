/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author haudq
 */
@Entity
@Table(name = "OrderDetails")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetails.findAll", query = "SELECT o FROM OrderDetails o"),
    @NamedQuery(name = "OrderDetails.getRelatedOrderId", query = "SELECT DISTINCT o.orderId.id FROM OrderDetails o WHERE o.productId.id = :id and o.productId.quantity > 0"),
    @NamedQuery(name = "OrderDetails.getRelatedProduct", query = "SELECT DISTINCT o.productId.id FROM OrderDetails o where o.orderId.id IN :orderId and o.productId.quantity > 0 group by o.productId.id order by count(o) desc"),
    @NamedQuery(name = "OrderDetails.getPreferenceProducts", query = "SELECT DISTINCT o.productId.id FROM OrderDetails o where o.orderId.userId.id = :userId and o.productId.quantity > 0 group by o.productId.id order by count(o.quantity) desc"),
    @NamedQuery(name = "OrderDetails.findById", query = "SELECT o FROM OrderDetails o WHERE o.id = :id"),
    @NamedQuery(name = "OrderDetails.getHistoryAsc", query = "SELECT o FROM OrderDetails o WHERE o.orderId.userId.username = :username and o.productName like :productName and o.createdDate >= :fromDate and o.createdDate < :toDate order by o.createdDate asc"),
    @NamedQuery(name = "OrderDetails.getHistoryDesc", query = "SELECT o FROM OrderDetails o WHERE o.orderId.userId.username = :username and o.productName like :productName and o.createdDate >= :fromDate and o.createdDate < :toDate order by o.createdDate desc"),
    @NamedQuery(name = "OrderDetails.countHistoryDesc", query = "SELECT count(o) FROM OrderDetails o WHERE o.orderId.userId.username = :username and o.productName like :productName and o.createdDate >= :fromDate and o.createdDate < :toDate "),
    @NamedQuery(name = "OrderDetails.findByProductName", query = "SELECT o FROM OrderDetails o WHERE o.productName = :productName"),
    @NamedQuery(name = "OrderDetails.findByQuantity", query = "SELECT o FROM OrderDetails o WHERE o.quantity = :quantity"),
    @NamedQuery(name = "OrderDetails.findByUnitPrice", query = "SELECT o FROM OrderDetails o WHERE o.unitPrice = :unitPrice"),
    @NamedQuery(name = "OrderDetails.findByTotalPrice", query = "SELECT o FROM OrderDetails o WHERE o.totalPrice = :totalPrice"),
    @NamedQuery(name = "OrderDetails.findByCreatedDate", query = "SELECT o FROM OrderDetails o WHERE o.createdDate = :createdDate"),
    @NamedQuery(name = "OrderDetails.findByStatus", query = "SELECT o FROM OrderDetails o WHERE o.status = :status")})
public class OrderDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "ProductName")
    private String productName;
    @Column(name = "Quantity")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "UnitPrice")
    private Double unitPrice;
    @Column(name = "TotalPrice")
    private Double totalPrice;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "Status")
    private String status;
    @JoinColumn(name = "OrderId", referencedColumnName = "Id")
    @ManyToOne
    private Orders orderId;
    @JoinColumn(name = "ProductId", referencedColumnName = "Id")
    @ManyToOne
    private Products productId;

    public OrderDetails() {
        this.createdDate = Calendar.getInstance().getTime();
        this.status = "New";
    }

    public OrderDetails(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
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
        if (!(object instanceof OrderDetails)) {
            return false;
        }
        OrderDetails other = (OrderDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.OrderDetails[ id=" + id + " ]";
    }

}
