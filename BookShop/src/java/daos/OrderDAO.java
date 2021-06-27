/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import static daos.BaseDAO.em;
import entities.Categories;
import entities.Orders;
import java.util.List;

/**
 *
 * @author haudq
 */
public class OrderDAO extends BaseDAO {

    public Orders create(Orders orders) throws Exception {
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
    public Orders update(Orders orders) throws Exception {
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.merge(orders);
            em.getTransaction().commit();
        } finally {
            closeEntityManager();
        }
        return orders;
    }
    
}
