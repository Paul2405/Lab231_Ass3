/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Products;
import java.util.Calendar;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author haudq
 */
public class ProductDAO extends BaseDAO {

    public Products create(Products product) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(product);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
        return product;
    }

    public Products findById(int id) throws Exception {
        Products products = null;
        try {
            em = getEntityManager();
            products = em.createNamedQuery("Products.findById", Products.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            products = null;
        } finally {
            closeEntityManager();
        }
        return products;
    }
    public Products findByIdUser(int id) throws Exception {
        Products products = null;
        try {
            em = getEntityManager();
            products = em.createNamedQuery("Products.findByIdUser", Products.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            products = null;
        } finally {
            closeEntityManager();
        }
        return products;
    }

    public Products update(Products product) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.merge(product);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
        return product;
    }

    public List<Products> findByProductNameAdmin(int maxResult, int pageIndex, String sort, String productName) throws Exception {
        List<Products> listProducts = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("Products.findByProductNameAdminAsc", Products.class);
            } else {
                query = em.createNamedQuery("Products.findByProductNameAdminDesc", Products.class);
            }
            listProducts = query.setMaxResults(maxResult)
                    .setParameter("productName", "%" + productName + "%")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listProducts;
    }

    public Integer countByProductNameAdmin(String productName) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Products.countByProductNameAdmin")
                    .setParameter("productName", "%" + productName + "%")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }

    public List<Products> findByStatusProductNameAdmin(int maxResult, int pageIndex, String sort, String productName, String status) throws Exception {
        List<Products> listProducts = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("Products.findByStatusProductNameAdminAsc", Products.class);
            } else {
                query = em.createNamedQuery("Products.findByStatusProductNameAdminDesc", Products.class);
            }
            listProducts = query.setMaxResults(maxResult)
                    .setParameter("status", status)
                    .setParameter("productName", "%" + productName + "%")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listProducts;
    }// do this

    public Integer countByStatusProductNameAdmin(String productName, String status) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Products.countByStatusProductNameAdmin")
                    .setParameter("status", status)
                    .setParameter("productName", "%" + productName + "%")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }

    //
    public List<Products> findByCategoryProductNameAdmin(int maxResult, int pageIndex, String sort, String productName, String categoryName) throws Exception {
        List<Products> listProducts = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("Products.findByCategoryProductNameAdminAsc", Products.class);
            } else {
                query = em.createNamedQuery("Products.findByCategoryProductNameAdminDesc", Products.class);
            }
            listProducts = query.setMaxResults(maxResult)
                    .setParameter("categoryName", categoryName)
                    .setParameter("productName", "%" + productName + "%")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listProducts;
    }

    public Integer countByCategoryProductNameAdmin(String productName, String categoryName) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Products.countByCategoryProductNameAdmin")
                    .setParameter("categoryName", categoryName)
                    .setParameter("productName", "%" + productName + "%")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }

    //
    public List<Products> findByCateStaProductNameAdmin(int maxResult, int pageIndex, String sort, String productName, String categoryName, String status) throws Exception {
        List<Products> listProducts = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("Products.findByCateStaProductNameAdminAsc", Products.class);
            } else {
                query = em.createNamedQuery("Products.findByCateStaProductNameAdminDesc", Products.class);
            }
            listProducts = query.setMaxResults(maxResult)
                    .setParameter("status", status)
                    .setParameter("categoryName", categoryName)
                    .setParameter("productName", "%" + productName + "%")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listProducts;
    }

    public Integer countByCateStaProductNameAdmin(String productName, String categoryName, String status) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Products.countByCateStaProductNameAdmin")
                    .setParameter("status", status)
                    .setParameter("categoryName", categoryName)
                    .setParameter("productName", "%" + productName + "%")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }

    public void changeStatus(List<String> list, String status) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            for (String item : list) {
                int id = Integer.parseInt(item.trim());
                Products products = em.createNamedQuery("Products.findById", Products.class)
                        .setParameter("id", id)
                        .getSingleResult();
                if (products != null) {
                    products.setStatus(status);
                    products.setRevisionDate(Calendar.getInstance().getTime());
                    em.merge(products);
                }
            }

            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }

    }

    public List<Products> getProducts(int maxResult, int pageIndex, String productName, List<String> categoryName, String sort, int min, int max) throws Exception {
        List<Products> listProducts = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("Products.getProductsActivedAsc", Products.class);
            } else {
                query = em.createNamedQuery("Products.getProductsActivedDesc", Products.class);
            }
            listProducts = query.setMaxResults(maxResult)
                    .setParameter("cateName", categoryName)
                    .setParameter("min", min)
                    .setParameter("max", max)
                    .setParameter("productName", "%" + productName + "%")
                    .setParameter("status", "Actived")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listProducts;
    }
public Integer countProductActived(String productName, List<String> categoryName, String sort, int min, int max) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("Products.countProductsActived")
                    .setParameter("cateName", categoryName)
                    .setParameter("min", min)
                    .setParameter("max", max)
                    .setParameter("productName", "%" + productName + "%")
                    .setParameter("status", "Actived")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }
}
