package ua.prog.pavel;

import java.util.List;

public interface MessageDAO {
    void add(Message o);
    long count();
    void delete(Message o);
    void delete(long[] ids);
    List<Message> list(User user);
}
