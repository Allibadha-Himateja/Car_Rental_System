package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;
import java.util.*;

public class EmployeeService {

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

    public void Add(Employees e) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            System.out.println("called from the service");
            tx.begin();
            em.merge(e);
            tx.commit();
        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            ex.printStackTrace();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public void Delete(int employeeNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Employees e = em.find(Employees.class, employeeNo);
            if (e != null) {
                em.remove(e);
            }
            tx.commit();
        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            ex.printStackTrace();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public void Edit(int employeeId, String employeeName, String employeeType, String address1, String address2, int cityNo, int stateNo, int countryNo, String pincode, String phoneNumber, String mobileNumber, String emailAddress, String bankName, String bankAccount, String pan, String username, String password, Date lastLogin, String status, String deleteStatus) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Employees e = em.find(Employees.class, employeeId);
            if (e != null) {
                e.setName(employeeName);
                e.setEmployeeType(employeeType);
                e.setAddressLine1(address1);
                e.setAddressLine2(address2);
                
                CityService cs = new CityService();
                Cities city = cs.getCity(cityNo);
                e.setCityNo(city);
                
                StateService ss = new StateService();
                States state = ss.getState(stateNo);
                e.setStateNo(state);
                
                CountriesService cc = new CountriesService();
                Countries country = cc.getCountry(countryNo);
                e.setCountryNo(country);
                
                e.setPincode(pincode);
                e.setPhoneNumber(phoneNumber);
                e.setMobileNumber(mobileNumber);
                e.setEmailAddress(emailAddress);
                e.setBankName(bankName);
                e.setBankAccount(bankAccount);
                e.setPAN(pan);
                e.setUsername(username);
                e.setPassword(password);
                e.setLastLogin(lastLogin);
                e.setStatus(status);
                e.setDeleteStatus(deleteStatus);
                
                em.persist(e);
            }
            tx.commit();
        } catch (Exception ex) {
            if (tx.isActive()) {
                tx.rollback();
            }
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Employees> getEmployees() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Employees> query = em.createQuery("select e from Employees e", Employees.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<Employees> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Employees> query = em.createQuery("select e from Employees e where e.Username LIKE :data", Employees.class);
            query.setParameter("data", "%" + data + "%");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public Employees getEmployee(int employeeNo) {
        EntityManager em = getEntityManager();
        try {
            Employees e = em.find(Employees.class, employeeNo);
            return e;
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
}
