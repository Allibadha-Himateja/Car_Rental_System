package com.iss.services;
import com.iss.models.*;
import java.util.*;
import javax.persistence.*;

public class LoginService 
{
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
    
    public List<Customers> getCustomer(String username) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Customers> query = em.createQuery("select e from Customers e where e.Username=:id", Customers.class);
            query.setParameter("id",username);
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<Employees> getEmployee(String username) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Employees> query = em.createQuery("select e from Employees e where e.Username=:id", Employees.class);
            query.setParameter("id",username);
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
}
