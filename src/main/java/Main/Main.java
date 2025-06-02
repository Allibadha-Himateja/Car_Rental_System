package Main;
import javax.persistence.*;
import com.iss.models.*;

public class Main {

	public static void main(String args[])
	{
		try {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPA");
		 	EntityManager  em=emf.createEntityManager();
		 	em.getTransaction().begin();
		 	
		 	VehicleTypes types=new VehicleTypes();
		 	types.setTypeNo(1);
		 	types.setType("Top Premium");
		 	em.persist(types);
		 	em.getTransaction().commit();
		 	
	        em.close();
	        emf.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}