package com.iss.services;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.models.*;

public class VehicleCapacityService 
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
    
    public List<VehicleCapacity> getVehicleCapacities() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleCapacity> query = em.createQuery("select e from VehicleCapacity e", VehicleCapacity.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
}
