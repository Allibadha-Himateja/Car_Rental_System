package com.iss.services;

import javax.persistence.*;
import com.iss.models.Countries;
import java.util.*;

public class CountriesService {

    private static EntityManagerFactory emf;
    private static ThreadLocal<EntityManager> threadLocal = new ThreadLocal<>();

    static {
        try {
        	//Emf Creation
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

    public void Add(Countries c) {
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
    public void Delete(int countryNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Countries c = em.find(Countries.class, countryNo);
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
    
    public void Edit(int Countryno,String Countryname)
    {
    	EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Countries c=em.find(Countries.class, Countryno);
            c.setCountry(Countryname);
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

    public List<Countries> getCountries() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Countries> query = em.createQuery("select e from Countries e", Countries.class);
            System.out.print("countries Send!!");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<Countries> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Countries> query = em.createQuery("select e from Countries e where e.Country LIKE:id", Countries.class);
            query.setParameter("id","%"+data+"%");
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public Countries getCountry(int countryno)
    {
    	EntityManager em = getEntityManager();
        try {
            Countries c=em.find(Countries.class, countryno);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
