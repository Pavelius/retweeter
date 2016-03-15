package ua.prog.pavel;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SubjectDAOImpl implements SubjectDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Subject add(Subject m) {
        return entityManager.merge(m);
    }

    @Override
    public Subject find(String value) {
        Query query = entityManager.createQuery("SELECT c FROM Subject c WHERE c.name=:name", Subject.class);
        query.setParameter("name", value);
        return (Subject)query.getSingleResult();
    }

    @Override
    public long count() {
        Query query = entityManager.createQuery("SELECT count(c) FROM Subject c");
        return (long)query.getSingleResult();
    }

    @Override
    public List<Subject> list() {
        Query query = entityManager.createQuery("SELECT c FROM Subject c", Subject.class);
        return (List<Subject>) query.getResultList();
    }

    @Override
    public List<Subject> list(long[] ids) {
        List<Subject> result = new ArrayList<>();
        Subject c;
        for (long id : ids) {
            c = entityManager.getReference(Subject.class, id);
            result.add(c);
        }
        return result;
    }

}