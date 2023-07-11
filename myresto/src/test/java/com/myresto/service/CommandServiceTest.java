package com.myresto.service;

import com.myresto.dao.ICommandDao;
import com.myresto.dao.ICommandProductDao;
import com.myresto.domaine.Command;
import com.myresto.domaine.CommandProduct;
import com.myresto.domaine.Product;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ContextConfiguration;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ContextConfiguration(classes = CommandService.class)
@SpringBootTest
public class CommandServiceTest {
	
	@Autowired
	private CommandService commandService;
	
	@MockBean
	private ICommandDao iCommandDao;
	
	@Test
    public void testGetAllCommands() {
        // Création de données de test
        Command c1 = new Command(1, 1, new Date() );
        Command c2 = new Command(2, 2, new Date() );
        List<Command> expectedCommand = new ArrayList<>();
        expectedCommand.add(c1);
        expectedCommand.add(c2);
        
        // Définition du comportement du mock
        when(iCommandDao.getAllCommands()).thenReturn(expectedCommand);
        
        // Appel de la méthode à tester
        List <Command> result = commandService.getAllCommands();
        
        //Vérification du résultat
        assertEquals(expectedCommand,result);
        
        // Vérification que la méthode du mock a été appelée
        verify(iCommandDao).getAllCommands();
        
    }
	
	@Test
	public void testGetCommandById() {
		// Création de données de test
        int cId = 1;
        Command expectedCommand = new Command(1, 1, new Date() );

        // Définition du comportement du mock
        when(iCommandDao.getCommandById(cId)).thenReturn(expectedCommand);

        // Appel de la méthode à tester
        Command result = commandService.getCommandById(cId);

        // Vérification du résultat
        assertEquals(expectedCommand, result);

        // Vérification que la méthode du mock a été appelée
        verify(iCommandDao).getCommandById(cId);
		
	}
	
	@Test
    public void testCreateCommand() {
        // Création de données de test
		Command command = new Command(1, 1, new Date() );

        // Appel de la méthode à tester
        commandService.createCommand(command);

        // Vérification que la méthode du mock a été appelée
        verify(iCommandDao).createCommand(command);
    }
	
	@Test
    public void testUpdateCommand() {
        // Création de données de test
		Command command = new Command(1, 1, new Date() );
		
        // Appel de la méthode à tester
        commandService.updateCommand(command);

        // Vérification que la méthode du mock a été appelée
        verify(iCommandDao).updateCommand(command);
    }
	
	@Test
    public void testDeleteCommand() {
        // Création de données de test
        int cId = 1;

        // Appel de la méthode à tester
        commandService.deleteCommand(cId);

        // Vérification que la méthode du mock a été appelée
        verify(iCommandDao).deleteCommand(cId);
    }
	

}





