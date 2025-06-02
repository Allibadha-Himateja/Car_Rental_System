package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;

import java.util.*;

public class CityService {

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

    public void Add(Cities c) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(c);
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
    public void Delete(int CityNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Cities c = em.find(Cities.class, CityNo);
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
    
    public void Edit(int cno,String cname,States s)
    {
    	EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Cities c=em.find(Cities.class, cno);
            c.setCityName(cname);
            c.setStateNo(s);
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

    public List<Cities> getCities() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Cities> query = em.createQuery("select e from Cities e", Cities.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<Cities> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Cities> query = em.createQuery("select e from Cities e where e.CityName LIKE:id", Cities.class);
            query.setParameter("id","%"+data+"%");
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public Cities getCity(int cno)
    {
    	EntityManager em = getEntityManager();
        try {
            Cities c=em.find(Cities.class, cno);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
