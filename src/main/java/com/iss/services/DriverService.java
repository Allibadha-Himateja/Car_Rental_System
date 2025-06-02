package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;
import java.util.*;

public class DriverService {

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

    public void Add(Drivers d) {
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

    public void Delete(int driverno) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Drivers d = em.find(Drivers.class, driverno);
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

    public void Edit(int driverId, String driverName, int licenseNumber,String address1,String address2,int cno,int sno,int cino,String pin,String pno,String mno, String bankName, String accountNumber, String panNumber) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Drivers d = em.find(Drivers.class, driverId);
            if (d != null) {
                d.setDriverName(driverName);
                d.setPhoneNumber(pno);
                d.setMobileNumber(mno);
                d.setAddressLine2(address2);
                d.setAddressLine1(address1);
                d.setLicenseNumber(licenseNumber);
                d.setBankName(bankName);
                d.setBankAccount(accountNumber);
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

    public List<Drivers> getDrivers() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Drivers> query = em.createQuery("select d from Drivers d", Drivers.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<Drivers> Search(String data) 
    {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Drivers> query = em.createQuery("select d from Drivers d where d.DriverName LIKE :data", Drivers.class);
            query.setParameter("data", "%" + data + "%");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public Drivers getDriver(int driverNo)
    {
    	EntityManager em = getEntityManager();
        try {
            Drivers c=em.find(Drivers.class, driverNo);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
