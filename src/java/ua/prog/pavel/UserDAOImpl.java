package ua.prog.pavel;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void add(User m) {
        entityManager.merge(m);
    }

    @Override
    public void delete(User m) {
        entityManager.remove(m);
    }

    @Override
    public void delete(long[] ids) {
        User c;
        for (long id : ids) {
            c = entityManager.getReference(User.class, id);
            entityManager.remove(c);
        }
    }

    @Override
    public long count() {
        Query query = entityManager.createQuery("SELECT count(c) FROM User c");
        return (long)query.getSingleResult();
    }

    @Override
    public List<User> list() {
        Query query = entityManager.createQuery("SELECT c FROM User c ORDER BY c.username", User.class);
        return (List<User>) query.getResultList();
    }

    @Override
    public List<User> list(long[] ids) {
        List<User> result = new ArrayList<>();
        User c;
        for (long id : ids) {
            c = entityManager.getReference(User.class, id);
            result.add(c);
        }
        return result;
    }

    @Override
    public User find(String name) {
        Query query = entityManager.createQuery("SELECT m FROM User m WHERE m.username = :name", User.class);
        query.setParameter("name", name);
        try {
            return (User)query.getSingleResult();
        }
        catch (NoResultException ex){
            return null;
        }
    }

}