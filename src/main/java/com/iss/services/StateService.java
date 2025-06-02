package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;

import java.util.*;

public class StateService {

    private static EntityManagerFactory emf;
    private static ThreadLocal<EntityManager> threadLocal = new ThreadLocal<>();

    static {
        try {
            emf = Persistence.createEntityManagerFactory("JPA");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private EntityManager getEntityManager() {
        EntityManager em = threadLocal.get();
        if (em == null || !em.isOpen()) {
            em = emf.createEntityManager();
            threadLocal.set(em);
        }
        return em;
    }

    public void Add(States s) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(s);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    public void Delete(int StateNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            States c = em.find(States.class, StateNo);
            if (c != null) {
                em.remove(c);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public void Edit(int stateno,String statename,Countries country)
    {
    	EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            States c=em.find(States.class, stateno);
            c.setStateName(statename);
            c.setCountryNo(country);
            em.persist(c);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<States> getStates() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<States> query = em.createQuery("select e from States e", States.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<States> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<States> query = em.createQuery("select e from States e where e.StateName LIKE:id", States.class);
            query.setParameter("id","%"+data+"%");
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public States getState(int stateno)
    {
    	EntityManager em = getEntityManager();
        try {
            States c=em.find(States.class, stateno);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
