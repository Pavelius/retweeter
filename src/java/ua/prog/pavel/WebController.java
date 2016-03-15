package ua.prog.pavel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WebController {

    @Autowired private MessageService messageService;

    @RequestMapping("/contacts")
    public String contacts(Model model) {
        return "contacts";
    }

    @RequestMapping("/user/register")
    public String register(Model model) {
        return "register";
    }

    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    public String register(@RequestParam String name,
                           @RequestParam String password,
                           @RequestParam String password_confirm,
                           @RequestParam String email,
                           Model model) {
        boolean allOK = true;
        if(name==null || name.isEmpty()) {
            model.addAttribute("error_user", "User name required for input.");
            allOK = false;
        }
        else
        {
            name = name.substring(0,1).toUpperCase() + name.substring(1).toLowerCase();
            if(messageService.findUser(name)!=null) {
                model.addAttribute("error_user", "User already exist. Change another name.");
                allOK = false;
            }
        }
        if(email==null || email.isEmpty()) {
            model.addAttribute("error_email", "E-mail required for input.");
            allOK = false;
        }
        if(!password.equals(password_confirm)) {
            model.addAttribute("error_password", "Password and Password Confirmation is different.");
            allOK = false;
        }
        if(!allOK)
        {
            model.addAttribute("username", name);
            model.addAttribute("email", email);
            return "register";
        }
        User u = new User(name, email, password);
        messageService.addUser(u);
        return index(model);
    }

    @RequestMapping(value = "/user/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        Model model) {
        model.addAttribute("logout", logout);
        model.addAttribute("error", error);
        return "login";
    }

    @RequestMapping("/settings")
    public String settings(Model model) {
        User user = messageService.getCurrentUser();
        model.addAttribute("users", messageService.getUsers());
        model.addAttribute("subjects", messageService.getSubjects());
        model.addAttribute("user_supliers", user.getSupliersIds());
        model.addAttribute("user_subjects", user.getSubjectsIds());
        return "settings";
    }

    @RequestMapping(value = "/settings", method = RequestMethod.POST)
    public String settings(
            @RequestParam(value="users[]", required = false) long[] users,
            @RequestParam(value="subjects[]", required = false) long[] subjects,
            Model model) {
        User u = messageService.getCurrentUser();
        if(u==null)
            return "settings";
        boolean needSave = false;
        if(users!=null) {
            u.setSuppliers(messageService.getUsers(users));
            needSave = true;
        }
        if(subjects!=null) {
            u.setSubjects(messageService.getSubjects(subjects));
            needSave = true;
        }
        if(needSave)
            messageService.addUser(u);
        return "settings";
    }

    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("users", messageService.getUserCount());
        model.addAttribute("messages", messageService.getMessageCount());
        model.addAttribute("groups", messageService.getSubjectCount());
        model.addAttribute("user", messageService.getCurrentUser());
        return "index";
    }

    @RequestMapping("/messages")
    public String messages(Model model) {
        List<Message> list;
        try {
            list = messageService.getMessages(messageService.getCurrentUser());
        } catch (NoResultException ex){
            list = new ArrayList<Message>();
        }
        model.addAttribute("messages", list);
        return "messages";
    }

    @RequestMapping("/message/add")
    public String message(Model model) {
        return "message";
    }

    @RequestMapping(value = "/message/add", method = RequestMethod.POST)
    public String message_add(@RequestParam String content, @RequestParam String subject, Model model) {
        List<Subject> subjects = messageService.parseSubjects(subject);
        messageService.addMessage(new Message(content, messageService.getCurrentUser(), subjects));
        return messages(model);
    }

}