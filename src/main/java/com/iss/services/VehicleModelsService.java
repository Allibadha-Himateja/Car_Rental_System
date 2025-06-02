package com.iss.services;

import javax.persistence.*;
import com.iss.models.*;

import java.util.*;

public class VehicleModelsService {

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

    public void Add(VehicleModels v) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(v);
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
    public void Delete(int modelNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            VehicleModels c = em.find(VehicleModels.class, modelNo);
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
    
    public void Edit(int modelno,String name,VehicleMakes vmake)
    {
    	EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            VehicleModels c=em.find(VehicleModels.class, modelno);
            c.setName(name);
            c.setMakeNo(vmake);
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

    public List<VehicleModels> getVehicleModels() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleModels> query = em.createQuery("select e from VehicleModels e", VehicleModels.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public List<VehicleModels> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleModels> query = em.createQuery("select e from VehicleModels e where e.Name LIKE:id", VehicleModels.class);
            query.setParameter("id","%"+data+"%");
            System.out.print("list sent");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    public VehicleModels getVehicleModel(int modelno)
    {
    	EntityManager em = getEntityManager();
        try {
        	VehicleModels c=em.find(VehicleModels.class, modelno);
            return c;
        }
        finally
        {
        	em.close();
        	threadLocal.remove();
        }
    }
}
