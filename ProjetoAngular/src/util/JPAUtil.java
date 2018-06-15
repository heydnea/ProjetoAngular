package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactor;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class JPAUtil {
	
	private static final String PERSISTENCE_UNIT = "bdcarro";
	private static ThreadLocal<EntityManager> threadEntityManager = new
			ThreadLocal<Entity>();
	private static EntityManagerFactory entityManagerFactory;
	
	private JPAUtil() {
	}
	
	public static EntityManager getEntityManager() {
		if (entityManagerFactory == null) {
			  entityManagerFactor = Persistence
					  .createEntityManagerFactory(PERSISTENCE_UNIT);
		}
		EntityManager entityManager = threadEntityManager.get();
	
	if (entityManager == null || !entityManager.isOpen()) {
		   entityManager = entityManagerFactory.createEntityManager();
		   JPAUtil.threadEntityManager.set(entityManager);
	}
	
	return entityManager;
}

public static void closeEntityManager()
{
	EntityManager em = threadEntityManager.get();
	if (em != null) {
		EntityTransaction transaction = em.getTransaction();
		if (transaction.isActive()) {
			transaction.commit();
		}
		e.close();
		threadEntityManager.set(null);
	}
}	

public static void closeEntityManagerFactory() {
	closeentityManager();
	entityManagerFactory.close();
  }
}


