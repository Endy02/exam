package com.myresto.service;

import com.myresto.dao.IUserDao;
import com.myresto.domaine.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ContextConfiguration;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ContextConfiguration(classes = UserService.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private IUserDao userDao;

    @BeforeEach
    public void setUp() {
        // Définir le comportement attendu des mocks
    	User user1 = new User(1,"john@mail.com","John","1 rue de john","0630124789",true);
        User user2 = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);

        List<User> users = new ArrayList<>();
        users.add(user1);
        users.add(user2);
        when(userDao.getAllUsers()).thenReturn(users);
    }

    @Test
    public void testGetAllUsers() {
        // Appel de la méthode à tester
        List<User> result = userService.getAllUsers();

        // Vérifier le résultat attendu
        User user1 = new User(1,"john@mail.com","John","1 rue de john","0630124789",true);
        User user2 = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);
        List<User> expectedUsers = new ArrayList<>();
        expectedUsers.add(user1);
        expectedUsers.add(user2);
        assertEquals(expectedUsers, result);
    }
    
    @Test
    public void testGetUserById() {
        // Création de données de test
        int userId = 1;
        User user = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);

        // Définition du comportement du mock
        when(userDao.getUserById(userId)).thenReturn(user);

        // Appel de la méthode à tester
        User result = userService.getUserById(userId);

        // Vérification du résultat
        assertEquals(user, result);

        // Vérification que la méthode du mock a été appelée
        verify(userDao).getUserById(userId);
    }

    @Test
    public void testCreateUser() {
        // Création de données de test
    	User user = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);

        // Appel de la méthode à tester
        userService.createUser(user);

        // Vérification que la méthode du mock a été appelée
        verify(userDao).createUser(user);
    }

    @Test
    public void testUpdateUser() {
        // Création de données de test
    	User user = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);

        // Appel de la méthode à tester
        userService.updateUser(user);

        // Vérification que la méthode du mock a été appelée
        verify(userDao).updateUser(user);
    }

    @Test
    public void testDeleteUser() {
        // Création de données de test
        int userId = 1;

        // Appel de la méthode à tester
        userService.deleteUser(userId);

        // Vérification que la méthode du mock a été appelée
        verify(userDao).deleteUser(userId);
    }

    @Test
    public void testLogin() {
        // Création de données de test
        String login = "john123";
        String password = "password";
        User user = new User(2,"jane@mail.com","Jane","1 rue de jane","0630124789",false);

        // Définition du comportement du mock
        when(userDao.login(login, password)).thenReturn(user);

        // Appel de la méthode à tester
        User result = userService.login(login, password);

        // Vérification du résultat
        assertEquals(user, result);

        // Vérification que la méthode du mock a été appelée
        verify(userDao).login(login, password);
    }

    

}
