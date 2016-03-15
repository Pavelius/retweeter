package ua.prog.pavel;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Users")
public class User {

    @Id
    @GeneratedValue
    private long id;

    private String username;
    private String password;
    private String email;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "UserSubject",
            joinColumns = {@JoinColumn(name = "user_id", nullable = false, updatable = false) },
            inverseJoinColumns = {@JoinColumn(name = "subject_id", nullable = false, updatable = false)})
    private List<Subject> subjects = new ArrayList<Subject>();

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "UserSuplier",
            joinColumns = {@JoinColumn(name = "user_id", nullable = false, updatable = false) },
            inverseJoinColumns = {@JoinColumn(name = "supplier_id", nullable = false, updatable = false)})
    private List<User> suppliers = new ArrayList<User>();

    public User() {
    }

    public User(String name, String email, String password) {
        this.username = name;
        this.email = email;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String value) {
        this.password = value;
    }

    public String getUsername() {
        return username;
    }

    public String getName() {
        return username;
    }

    public void setUsername(String name) {
        this.username = name;
    }

    public void setSubjects(List<Subject> value) {
        this.subjects = value;
    }

    public List<Subject> getSubjects() {
        return this.subjects;
    }

    public List<Long> getSubjectsIds() {
        List<Long> result = new ArrayList<>();
        for(Subject e : subjects) {
            result.add(e.getId());
        }
        return result;
    }

    public List<User> getSupliers() {
        return this.suppliers;
    }

    public List<Long> getSupliersIds() {
        List<Long> result = new ArrayList<>();
        for(User e : suppliers) {
            result.add(e.id);
        }
        return result;
    }

    public void setSuppliers(List<User> value) {
        this.suppliers = value;
    }

}