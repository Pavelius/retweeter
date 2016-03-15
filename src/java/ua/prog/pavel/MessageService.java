package ua.prog.pavel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageService {

    @Autowired private MessageDAO dao;
    @Autowired private UserDAO userDAO;
    @Autowired private SubjectDAO subjectDAO;

    @Transactional
    public void addMessage(Message o) {
        dao.add(o);
    }

    @Transactional
    public void addUser(User contact) {
        userDAO.add(contact);
    }

    public long getUserCount() {
        return userDAO.count();
    }

    public User findUser(String name) {
        return userDAO.find(name);
    }

    public User getCurrentUser() {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth==null)
            return null;

        Object obj = auth.getPrincipal();
        String username = "";

        if (obj instanceof UserDetails) {
            username = ((UserDetails) obj).getUsername();
        } else {
            username = obj.toString();
        }

        return userDAO.find(username);
    }

    @Transactional
    public void deleteMessage(long[] ids) {
        dao.delete(ids);
    }

    public long getMessageCount() {
        return dao.count();
    }

    public long getSubjectCount() {
        return subjectDAO.count();
    }

    public List<Subject> getSubjects() { return subjectDAO.list(); }

    public List<Subject> getSubjects(long[] id) { return subjectDAO.list(id); }

    public List<User> getUsers() { return userDAO.list(); }

    public List<User> getUsers(long[] id) {
        return userDAO.list(id);
    }

    public List<Message> getMessages(User user) {
        return dao.list(user);
    }

    public List<Message> getMessagesByUser(User user) {
        return dao.list(user);
    }

    @Transactional
    public List<Subject> parseSubjects(String string) {
        List<Subject> result = new ArrayList<Subject>();
        for(String retval : string.split(",")) {
            retval = retval.trim();
            retval = retval.substring(0,1).toUpperCase() + retval.substring(1).toLowerCase();
            try {
                Subject s = subjectDAO.find(retval);
                result.add(s);
            } catch (NoResultException ex){
                Subject s = subjectDAO.add(new Subject(retval));
                result.add(s);
            }
        }
        return result;
    }

}