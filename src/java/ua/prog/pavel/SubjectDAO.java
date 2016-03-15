package ua.prog.pavel;

import java.util.List;

public interface SubjectDAO {
    Subject add(Subject contact);
    long count();
    Subject find(String value);
    List<Subject> list();
    List<Subject> list(long[] id);
}
