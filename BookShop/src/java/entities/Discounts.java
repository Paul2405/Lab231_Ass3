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
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author haudq
 */
@Entity
@Table(catalog = "BookShop", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"Code"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Discounts.findAll", query = "SELECT d FROM Discounts d")
    , @NamedQuery(name = "Discounts.countAll", query = "SELECT count(d) FROM Discounts d")
    , @NamedQuery(name = "Discounts.findById", query = "SELECT d FROM Discounts d WHERE d.id = :id")
    , @NamedQuery(name = "Discounts.findByName", query = "SELECT d FROM Discounts d WHERE d.name = :name")
    , @NamedQuery(name = "Discounts.findByDiscountPercent", query = "SELECT d FROM Discounts d WHERE d.discountPercent = :discountPercent")
    , @NamedQuery(name = "Discounts.findByCreatedDate", query = "SELECT d FROM Discounts d WHERE d.createdDate = :createdDate")
    , @NamedQuery(name = "Discounts.findByModifyDate", query = "SELECT d FROM Discounts d WHERE d.modifyDate = :modifyDate")
    , @NamedQuery(name = "Discounts.findByCode", query = "SELECT d FROM Discounts d WHERE d.code = :code")})
public class Discounts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Column(length = 2147483647)
    private String name;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 53)
    private Double discountPercent;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifyDate;
    @Column(length = 255)
    private String code;
    @JoinColumn(name = "Creator", referencedColumnName = "Id")
    @ManyToOne
    private Users creator;
    @OneToMany(mappedBy = "discountId")
    private List<Orders> orderList;

    public Discounts() {
                this.createdDate = Calendar.getInstance().getTime();
    }

    public List<Orders> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Orders> orderList) {
        this.orderList = orderList;
    }
    
    
    public Discounts(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(Double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Users getCreator() {
        return creator;
    }

    public void setCreator(Users creator) {
        this.creator = creator;
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
        if (!(object instanceof Discounts)) {
            return false;
        }
        Discounts other = (Discounts) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Discounts[ id=" + id + " ]";
    }
    
}
