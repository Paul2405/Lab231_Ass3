/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author haudq
 */
public class BaseDAO implements Serializable {

    protected static EntityManager em = null;
    protected static EntityManagerFactory emf = null;

    public static EntityManager getEntityManager() throws Exception {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("BookShopPU");
        }
        return emf.createEntityManager();
    }

    public void closeEntityManager() throws Exception {
        if (em != null) {
            em.close();
        }
    }
}
