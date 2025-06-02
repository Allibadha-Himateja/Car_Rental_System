package com.iss.services;
import javax.persistence.*;
import com.iss.models.*;
import java.util.*;


public class VehicleService {

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

    public void Add(Vehicles v) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            System.out.println("called from the service");
            tx.begin();
            em.persist(v); // Use persist instead of merge for new entities
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

    public void Delete(int vehicleNo) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Vehicles v = em.find(Vehicles.class, vehicleNo);
            if (v != null) {
                em.remove(v);
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

    public void Edit(int vehicleNumber, String type, int modelNo, int ownerNo, int year, String registrationNumber, String color, String fuel, int capacity, int mileage, String chassisNumber, int dailyRate, int additionalDailyRate, int hourlyRate, int additionalHourlyRate, byte[] image) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Vehicles v = em.find(Vehicles.class, vehicleNumber);
            if (v != null) {
            	
                v.setType(type);
                v.setYear(year);
                v.setRegistrationNumber(registrationNumber);
                v.setColor(color);
                v.setFuel(fuel);
                v.setCapacity(capacity);
                v.setMileage(mileage);
                v.setChaisisNumber(chassisNumber);
                v.setDailyRate(dailyRate);
                v.setAdditionalDailyRate(additionalDailyRate);
                v.setHourlyRate(hourlyRate);
                v.setAdditionalHourlyRate(additionalHourlyRate);

                if (image != null) {
                    v.setPicture(image);
                }

                VehicleModelsService vs = new VehicleModelsService();
                VehicleModels model = vs.getVehicleModel(modelNo);
                v.setModelNo(model);

                OwnerService os = new OwnerService();
                Owners owner = os.getOwner(ownerNo);
                v.setOwnerNo(owner);

                em.persist(v);
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


    public List<Vehicles> getVehicles() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Vehicles> query = em.createQuery("select v from Vehicles v", Vehicles.class);
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public List<Vehicles> Search(String data) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Vehicles> query = em.createQuery("select v from Vehicles v where v.RegistrationNumber LIKE :data", Vehicles.class);
            query.setParameter("data", "%" + data + "%");
            return query.getResultList();
        } finally {
            em.close();
            threadLocal.remove();
        }
    }

    public Vehicles getVehicle(int vehicleNo) {
        EntityManager em = getEntityManager();
        try {
            Vehicles v = em.find(Vehicles.class, vehicleNo);
            return v;
        } finally {
            em.close();
            threadLocal.remove();
        }
    }
}
