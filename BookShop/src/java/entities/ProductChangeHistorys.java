/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
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
@Table(name = "ProductChangeHistorys")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductChangeHistorys.findAll", query = "SELECT p FROM ProductChangeHistorys p"),
    @NamedQuery(name = "ProductChangeHistorys.findById", query = "SELECT p FROM ProductChangeHistorys p WHERE p.id = :id"),
    @NamedQuery(name = "ProductChangeHistorys.findByColumnName", query = "SELECT p FROM ProductChangeHistorys p WHERE p.columnName = :columnName"),
    @NamedQuery(name = "ProductChangeHistorys.findByOldValue", query = "SELECT p FROM ProductChangeHistorys p WHERE p.oldValue = :oldValue"),
    @NamedQuery(name = "ProductChangeHistorys.findByNewValue", query = "SELECT p FROM ProductChangeHistorys p WHERE p.newValue = :newValue"),
    @NamedQuery(name = "ProductChangeHistorys.findByCreatedDate", query = "SELECT p FROM ProductChangeHistorys p WHERE p.createdDate = :createdDate")})
public class ProductChangeHistorys implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "ColumnName")
    private String columnName;
    @Column(name = "OldValue")
    private String oldValue;
    @Column(name = "NewValue")
    private String newValue;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @JoinColumn(name = "ProductId", referencedColumnName = "Id")
    @ManyToOne
    private Products productId;
    @JoinColumn(name = "UserChangeId", referencedColumnName = "Id")
    @ManyToOne
    private Users userChangeId;

    public ProductChangeHistorys() {
    }

    public ProductChangeHistorys(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
    }

    public Users getUserChangeId() {
        return userChangeId;
    }

    public void setUserChangeId(Users userChangeId) {
        this.userChangeId = userChangeId;
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
        if (!(object instanceof ProductChangeHistorys)) {
            return false;
        }
        ProductChangeHistorys other = (ProductChangeHistorys) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ProductChangeHistorys[ id=" + id + " ]";
    }
    
}
