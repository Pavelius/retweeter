package ua.prog.pavel;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Messages")
public class Message {

    @Id
    @GeneratedValue
    private long id;

    private Date date;
    private String content;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "MessageSubjects",
            joinColumns = {@JoinColumn(name = "message_id", nullable = false, updatable = false) },
            inverseJoinColumns = {@JoinColumn(name = "subject_id", nullable = false, updatable = false)})
    private List<Subject> subjects = new ArrayList<Subject>();

    public Message() {
    }

    public Message(String content, User user) {
        this.content = content;
        this.user = user;
        this.date = new Date();
    }

    public Message(String content, User user, List<Subject> subjects) {
        this.content = content;
        this.user = user;
        this.date = new Date();
        this.subjects = subjects;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String email) {
        this.date = date;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String value) {
        this.content = value;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> value) {
        this.subjects = value;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User value){
        this.user = value;
    }

}