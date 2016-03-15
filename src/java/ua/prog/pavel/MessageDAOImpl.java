package ua.prog.pavel;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class MessageDAOImpl implements MessageDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void add(Message m) {
        entityManager.merge(m);
    }

    @Override
    public void delete(Message m) {
        entityManager.remove(m);
    }

    @Override
    public void delete(long[] ids) {
        Message c;
        for (long id : ids) {
            c = entityManager.getReference(Message.class, id);
            entityManager.remove(c);
        }
    }

    @Override
    public long count() {
        Query query = entityManager.createQuery("SELECT count(c) FROM Message c");
        return (long)query.getSingleResult();
    }

    @Override
    public List<Message> list(User user) {
        //Query query = entityManager.createQuery("SELECT c FROM Message c ORDER BY c.date DESC", Message.class);
        List<User> suppliers = user.getSupliers();
        if(!suppliers.contains(user))
            suppliers.add(user);
        List<Subject> subjects = user.getSubjects();
        StringBuilder queryText = new StringBuilder();
        queryText.append("select c from Message c, IN(c.subjects) sub WHERE c.user IN (:suppliers)");
        if(subjects.size()!=0)
            queryText.append("OR sub IN (:subjects)");
        queryText.append(" ORDER BY c.date DESC");
        Query query = entityManager.createQuery(queryText.toString(), Message.class);
        query.setParameter("suppliers", suppliers);
        if(subjects.size()!=0)
            query.setParameter("subjects", subjects);
        return (List<Message>) query.getResultList();
    }

}