/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.OrderDetails;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;

/**
 *
 * @author haudq
 */
public class OrderDetailDAO extends BaseDAO {

    public OrderDetails create(OrderDetails orders) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(orders);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
        return orders;
    }

    public void createList(List<OrderDetails> orders) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            for (OrderDetails item : orders) {
                em.persist(item);
            }
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
    }

    public List<Integer> getRelatedOrderDetail(List<Integer> orderId) throws Exception {
        List<Integer> list = null;
        try {
            em = getEntityManager();
            list = em.createNamedQuery("OrderDetails.getRelatedProduct")
                    .setParameter("orderId", orderId)
                    .setMaxResults(6)
                    .getResultList();
        } finally {
            closeEntityManager();
        }
        return list;
    }

    public List<Integer> getRelatedOrderId(Integer id) throws Exception {
        List<Integer> list = null;
        try {
            em = getEntityManager();
            list = em.createNamedQuery("OrderDetails.getRelatedOrderId")
                    .setParameter("id", id)
                    .getResultList();
        } finally {
            closeEntityManager();
        }
        return list;
    }

    public List<Integer> getPreferenceProductsByUser(Integer userId) throws Exception {
        List<Integer> list = null;
        try {
            em = getEntityManager();
            list = em.createNamedQuery("OrderDetails.getPreferenceProducts")
                    .setParameter("userId", userId)
                    .getResultList();
        } finally {
            closeEntityManager();
        }
        return list;
    }

    public List<OrderDetails> getHistory(int maxResult, int pageIndex, String username, String sort, String productName, Date toDate, Date fromDate) throws Exception {
        List<OrderDetails> listOrderDetail = null;
        try {
            em = getEntityManager();
            Query query = null;
            if (sort.equals("asc")) {
                query = em.createNamedQuery("OrderDetails.getHistoryAsc", OrderDetails.class);
            } else {
                query = em.createNamedQuery("OrderDetails.getHistoryDesc", OrderDetails.class);
            }
            listOrderDetail = query.setMaxResults(maxResult)
                    .setParameter("username", username)
                    .setParameter("toDate", toDate)
                    .setParameter("fromDate", fromDate)
                    .setParameter("productName", "%" + productName + "%")
                    .setMaxResults(maxResult)
                    .setFirstResult(maxResult * (pageIndex - 1)).getResultList();
        } finally {
            closeEntityManager();
        }
        return listOrderDetail;
    }

    public Integer countHistory(String username, String sort, String productName, Date toDate, Date fromDate) throws Exception {
        Integer count = null;
        try {
            em = getEntityManager();
            Object temp = em.createNamedQuery("OrderDetails.countHistoryDesc")
                     .setParameter("username", username)
                    .setParameter("toDate", toDate)
                    .setParameter("fromDate", fromDate)
                    .setParameter("productName", "%" + productName + "%")
                    .getSingleResult();
            count = Integer.parseInt(temp.toString());
        } finally {
            closeEntityManager();
        }
        return count;
    }
}
