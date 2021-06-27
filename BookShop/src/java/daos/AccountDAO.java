/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Users;
import java.io.Serializable;
import javax.persistence.NoResultException;

/**
 *
 * @author haudq
 */
public class AccountDAO extends BaseDAO{
    public Users login(String username, String password) throws Exception {
        Users user = null;
        try {
            em = getEntityManager();
            user = (Users) em.createNamedQuery("Users.login")
                    .setParameter("username", username)
                    .setParameter("password", password).
                    setParameter("status", "Actived")
                    .getSingleResult();
        } catch (NoResultException ex) {
            user = null;
        } finally {
            closeEntityManager();
        }
        return user;
    }
    public void registry(Users user) throws Exception{
        try{
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        }finally{
            closeEntityManager();
        }
    }
    public Users findByUsername(String username) throws Exception{
        Users user = null;
        try{
            em = getEntityManager();
            user = em.createNamedQuery("Users.findByUsername", Users.class)
                    .setParameter("username", username)
                    .setParameter("status", "Actived")
                    .getSingleResult();
        }catch(NoResultException ex){
            user = null;
        }finally{
            closeEntityManager();
        }
        return user;
    }
}
