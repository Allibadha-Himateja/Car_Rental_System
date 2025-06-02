package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;
import java.util.*;

public class OwnerService {

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

    public void Add(Owners d) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
        	System.out.println("called from the service");
            tx.begin();
            em.merge(d);
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

    public void Delete(int ownerno) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Owners d = em.find(Owners.class, ownerno);
            if (d != null) {
                em.remove(d);
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

    public void Edit(int driverId, String driverName,String address1,String address2,int cno,int sno,int cino,String pin,String pno,String mno, String bankName, String accountNumber, String panNumber) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Owners d = em.find(Owners.class, driverId);
            if (d != null) {
            	d.setOwnerNo(driverId);
                d.setName(driverName);
                d.setPhoneNumber(pno);
                d.setMobileNumber(mno);
                d.setAddress2(address2);
                d.setAddress1(address1);
                d.setBankName(bankName);
                d.setBankAccount(accountNumber);
                d.setPincode(pno);
                d.setPAN(panNumber);
                
                CityService cs = new CityService();
                Cities city = cs.getCity(cino);
                d.setCityNo(city);
                
                StateService ss = new StateService();
                States state = ss.getState(sno);
                d.setStateNo(state);
                
                CountriesService cc = new CountriesService();
                Countries country = cc.getCountry(cno);
                d.setCountryNo(country);
                
                em.persist(d);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Owners> getOwners() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Owners> query = em.createQuery("select d from Owners d", Owners.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<Owners> Search(String data) 
    {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Owners> query = em.createQuery("select d from Owners d where d.OwnerName LIKE :data", Owners.class);
            query.setParameter("data", "%" + data + "%");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public Owners getOwner(int ownerNo)
    {
    	EntityManager em = getEntityManager();
        try {
        	Owners c=em.find(Owners.class, ownerNo);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
