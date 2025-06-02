package com.iss.services;
import java.util.*;
import javax.persistence.*;
import com.iss.models.*;

public class VehicleFuelService 
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
    
    public List<VehicleFuel> getVehicleFuels() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<VehicleFuel> query = em.createQuery("select e from VehicleFuel e", VehicleFuel.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
    
    
}
