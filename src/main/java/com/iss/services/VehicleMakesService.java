package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;
import java.util.*;

public class VehicleMakesService {

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

    public void Add(VehicleMakes v) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.merge(v);
            System.out.print("Storing");
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
    
    public List<VehicleMakes> getVehicleMakes() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleMakes> query = em.createQuery("select e from VehicleMakes e", VehicleMakes.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public void Delete(int MakeNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            VehicleMakes c = em.find(VehicleMakes.class, MakeNo);
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
    
    public void Edit(int MakeNo,String Vehiclename)
    {
    	EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            VehicleMakes c=em.find(VehicleMakes.class, MakeNo);
            c.setName(Vehiclename);
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

    public List<VehicleMakes> getVehicles() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleMakes> query = em.createQuery("select e from VehicleMakes e", VehicleMakes.class);
            System.out.print("Vehicles Send!!");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<VehicleMakes> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleMakes> query = em.createQuery("select e from VehicleMakes e where e.Name LIKE:id", VehicleMakes.class);
            query.setParameter("id","%"+data+"%");
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public VehicleMakes getVehicleMake(int makeno)
    {
    	EntityManager em = getEntityManager();
        try {
        	VehicleMakes c=em.find(VehicleMakes.class, makeno);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
