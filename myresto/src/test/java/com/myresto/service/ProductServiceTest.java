package com.myresto.service;

import com.myresto.dao.IProductDao;
import com.myresto.domaine.Product;

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

@ContextConfiguration(classes = ProductService.class)
@SpringBootTest
public class ProductServiceTest {
	
	@Autowired
    private ProductService productService;

    @MockBean
    private IProductDao productDao;

    

    @Test
    public void testGetAllProducts() {
        // Création de données de test
        Product product1 = new Product(1, 1, "Product1", 10.0);
        Product product2 = new Product(2, 2, "Product2", 15.0);
        List<Product> expectedProducts = new ArrayList<>();
        expectedProducts.add(product1);
        expectedProducts.add(product2);

        // Définition du comportement du mock
        when(productDao.getAllProducts()).thenReturn(expectedProducts);

        // Appel de la méthode à tester
        List<Product> result = productService.getAllProducts();

        // Vérification du résultat
        assertEquals(expectedProducts, result);

        // Vérification que la méthode du mock a été appelée
        verify(productDao).getAllProducts();
    }

    @Test
    public void testGetProductById() {
        // Création de données de test
        int productId = 1;
        Product expectedProduct = new Product(1, 1, "Product1", 10.0);

        // Définition du comportement du mock
        when(productDao.getProductById(productId)).thenReturn(expectedProduct);

        // Appel de la méthode à tester
        Product result = productService.getProductById(productId);

        // Vérification du résultat
        assertEquals(expectedProduct, result);

        // Vérification que la méthode du mock a été appelée
        verify(productDao).getProductById(productId);
    }

    @Test
    public void testCreateProduct() {
        // Création de données de test
        Product product = new Product(1, 1, "Product1", 10.0);

        // Appel de la méthode à tester
        productService.createProduct(product);

        // Vérification que la méthode du mock a été appelée
        verify(productDao).createProduct(product);
    }

    @Test
    public void testUpdateProduct() {
        // Création de données de test
        Product product = new Product(1, 1, "Product1", 10.0);

        // Appel de la méthode à tester
        productService.updateProduct(product);

        // Vérification que la méthode du mock a été appelée
        verify(productDao).updateProduct(product);
    }

    @Test
    public void testDeleteProduct() {
        // Création de données de test
        int productId = 1;

        // Appel de la méthode à tester
        productService.deleteProduct(productId);

        // Vérification que la méthode du mock a été appelée
        verify(productDao).deleteProduct(productId);
    }
}
