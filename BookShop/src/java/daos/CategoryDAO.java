/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Categories;
import java.util.List;
import javax.persistence.NoResultException;

/**
 *
 * @author haudq
 */
public class CategoryDAO extends BaseDAO {

    public void create(Categories cate) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(cate);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
    }
    public List<Categories> getCategories() throws Exception{
        List<Categories> list = null;
        try {
            em = getEntityManager();
            list = em.createNamedQuery("Categories.findAll")
                    .setParameter("status", "Actived")
                    .getResultList();
        } finally{
            closeEntityManager();
        }
        return list;
    }
    public Categories getCategoryByCateName(String catename) throws Exception{
        Categories cate = null;
        try {
            em = getEntityManager();
            cate = em.createNamedQuery("Categories.findByCategoryName", Categories.class)
                    .setParameter("categoryName", catename)
                    .setParameter("status", "Actived")
                    .getSingleResult();
        }catch(NoResultException ex){
            cate = null;
        } finally{
            closeEntityManager();
        }
        return cate;
    }
}
