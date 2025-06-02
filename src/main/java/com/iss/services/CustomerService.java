package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;
import java.util.*;

public class CustomerService {

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

    public void Add(Customers c) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            System.out.println("called from the service");
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

    public void Delete(int customerNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Customers c = em.find(Customers.class, customerNo);
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

    public void Edit(int customerId, String customerName, String emailAddress, String address1, String address2, int cityNo, int stateNo, int countryNo, String pincode, String phoneNumber, String mobileNumber, String userName, String password) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Customers c = em.find(Customers.class, customerId);
            if (c != null) {
                c.setName(customerName);
                c.setEmailAddress(emailAddress);
                c.setAddressLine1(address1);
                c.setAddressLine2(address2);
                
                CityService cs = new CityService();
                Cities city = cs.getCity(cityNo);
                c.setCityNo(city);
                
                StateService ss = new StateService();
                States state = ss.getState(stateNo);
                c.setStateNo(state);
                
                CountriesService cc = new CountriesService();
                Countries country = cc.getCountry(countryNo);
                c.setCountryNo(country);
                
                c.setPincode(pincode);
                c.setPhoneNumber(phoneNumber);
                c.setMobileNumber(mobileNumber);
                c.setUsername(userName);
                c.setPassword(password);
                
                em.persist(c);
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

    public List<Customers> getCustomers() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Customers> query = em.createQuery("select c from Customers c", Customers.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<Customers> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Customers> query = em.createQuery("select c from Customers c where c.CustomerName LIKE :data", Customers.class);
            query.setParameter("data", "%" + data + "%");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public Customers getCustomer(int customerNo) {
        EntityManager em = getEntityManager();
        try {
            Customers c = em.find(Customers.class, customerNo);
            return c;
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
}
