package org.youcode;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.youcode.domain.Membre;
import org.youcode.services.MembreService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

public class Main {

    public static void main(String[] args) {
        // Load the application context
     ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//
//        // Get the MembreService bean
        MembreService membreService = context.getBean(MembreService.class);
//
//        // Create a new Membre instance
//        Membre membre = Membre.builder()
//                .id(UUID.randomUUID())
//                .membershipNumber("M12345")
//                .firstName("John")
//                .lastName("Doe")
//                .idDocument("ID123456")
//                .nationality("American")
//                .membershipDate(LocalDate.now())
//                .created_at(LocalDateTime.now())
//                .licenseExpiryDate(LocalDate.now().plusYears(1))
//                .build();
//
//        // Save the Membre instance
//        membreService.save(membre);
//        System.out.println("Membre saved: " + membre);

        //***************************************** delete *****************************


        // Replace with the actual ID you want to delete
        UUID idToDelete = UUID.fromString("2a6ffba5-efc5-4e2a-ac1f-95d609f2fb42");

        try {
            // Call the delete method
            membreService.deleteById(idToDelete);
            System.out.println("Member with ID " + idToDelete + " deleted successfully.");
        } catch (EntityNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
