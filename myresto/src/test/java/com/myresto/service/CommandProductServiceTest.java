package com.myresto.service;

import com.myresto.dao.ICommandProductDao;

import com.myresto.domaine.CommandProduct;

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

@ContextConfiguration(classes = CommandProductService.class)
@SpringBootTest
public class CommandProductServiceTest {
	
	@Autowired
    private CommandProductService commandProductService;

    @MockBean
    private ICommandProductDao commandProductDao;

   
    @Test
    public void testGetAllCommandeProduit() {
        // Création de données de test
        CommandProduct cp1 = new CommandProduct(1, 1, 2,true);
        CommandProduct cp2 = new CommandProduct(2, 2, 5,false);
        List<CommandProduct> expectedCommandProducts = new ArrayList<>();
        expectedCommandProducts.add(cp1);
        expectedCommandProducts.add(cp2);

        // Définition du comportement du mock
        when(commandProductDao.getAllCommandeProduit()).thenReturn(expectedCommandProducts);

        // Appel de la méthode à tester
        List<CommandProduct> result = commandProductService.getAllCommandeProduit();

        // Vérification du résultat
        assertEquals(expectedCommandProducts, result);

        // Vérification que la méthode du mock a été appelée
        verify(commandProductDao).getAllCommandeProduit();
    }

    @Test
    public void testCreateCommandeProduit() {
        // Création de données de test
        CommandProduct cp = new CommandProduct(1, 1 , 2,true);

        // Appel de la méthode à tester
        commandProductService.createCommandeProduit(cp);

        // Vérification que la méthode du mock a été appelée
        verify(commandProductDao).createCommandeProduit(cp);
    }
    
    @Test
    public void testUpdateProduct() {
        // Création de données de test
    	CommandProduct cp = new CommandProduct(1, 1 , 2,true);

        // Appel de la méthode à tester
    	commandProductService.updateCommandeProduit(cp);

        // Vérification que la méthode du mock a été appelée
        verify(commandProductDao).updateCommandeProduit(cp);
    }
    @Test
    public void testDeleteProduct() {
        // Création de données de test
        int cpId = 1;

        // Appel de la méthode à tester
        commandProductService.deleteCommandeProduit(cpId);;

        // Vérification que la méthode du mock a été appelée
        verify(commandProductDao).deleteCommandeProduit(cpId);
    }

	

}

