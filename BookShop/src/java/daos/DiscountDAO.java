/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Discounts;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import views.DiscountsViewModel;

/**
 *
 * @author haudq
 */
public class DiscountDAO extends BaseDAO {

    public void create(Discounts discount) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(discount);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
    }
    public List<Discounts> getDiscounts() throws Exception{
        List<Discounts> list = null;
//        try {
//            em = getEntityManager();
//            list = em.createNamedQuery("Categories.findAll")
//                    .setParameter("status", "Actived")
//                    .getResultList();
//        } finally{
//            closeEntityManager();
//        }
        return list;
    }
//    public Categories getCategoryByCateName(String catename) throws Exception{
//        Categories cate = null;
//        try {
//            em = getEntityManager();
//            cate = em.createNamedQuery("Categories.findByCategoryName", Categories.class)
//                    .setParameter("categoryName", catename)
//                    .setParameter("status", "Actived")
//                    .getSingleResult();
//        }catch(NoResultException ex){
//            cate = null;
//        } finally{
//            closeEntityManager();
//        }
//        return cate;
//    }
    public List<Discounts> findByDiscountAdmin(int maxResult, int pageIndex) throws Exception {
        List<Discounts> listDiscounts = null;
        try {
            em = getEntityManager();
            Query query = null;
            query = em.createNamedQuery("Discounts.findAll", Discounts.class);
            listDiscounts = query.setMaxResults(maxResult)
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listDiscounts;
    }
    public Integer countByDiscountAdmin() throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Discounts.countAll")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }
    public DiscountsViewModel findByCode(String code) throws Exception {
        DiscountsViewModel discount = new DiscountsViewModel();
        Discounts discountModel = null;
        try {
            em = getEntityManager();
            discountModel = em.createNamedQuery("Discounts.findByCode", Discounts.class)
                    .setParameter("code", code)
                    .getSingleResult();
            discount.setId(discountModel.getId());
            discount.setName(discountModel.getName());
            discount.setCode(discountModel.getCode());
            discount.setPercent(discountModel.getDiscountPercent());
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            String date = format.format(discountModel.getCreatedDate());
            discount.setCreatedDate(date);
        } catch (NoResultException ex) {
            discount = null;
        } finally {
            closeEntityManager();
        }
        return discount;
    }
    public Discounts findDiscountByCode(String code) throws Exception {
        Discounts discountModel = null;
        try {
            em = getEntityManager();
            discountModel = em.createNamedQuery("Discounts.findByCode", Discounts.class)
                    .setParameter("code", code)
                    .getSingleResult();
        } catch (NoResultException ex) {
            discountModel = null;
        } finally {
            closeEntityManager();
        }
        return discountModel;
    }
}
