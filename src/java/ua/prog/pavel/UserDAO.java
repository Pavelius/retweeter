package ua.prog.pavel;

import java.util.List;

public interface UserDAO {
    void add(User contact);
    long count();
    void delete(User contact);
    void delete(long[] ids);
    List<User> list();
    List<User> list(long[] id);
    User find(String name);
}
