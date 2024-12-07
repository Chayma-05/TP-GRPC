package ma.projet.grpc.config;

import ma.projet.grpc.entities.Compte;
import ma.projet.grpc.entities.TypeCompte;
import ma.projet.grpc.repositories.CompteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class DataLoader implements CommandLineRunner {

    @Autowired
    private CompteRepository compteRepository;

    @Override
    public void run(String... args) {
        // Vérifier si la base de données est vide
        if (compteRepository.count() == 0) {
            // Ajouter quelques comptes de test
            Compte compte1 = new Compte();
            compte1.setSolde(1000.0);
            compte1.setType(TypeCompte.COURANT);
            compte1.setDateCreation(LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
            compteRepository.save(compte1);

            Compte compte2 = new Compte();
            compte2.setSolde(5000.0);
            compte2.setType(TypeCompte.EPARGNE);
            compte2.setDateCreation(LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
            compteRepository.save(compte2);

            System.out.println("Données de test ajoutées avec succès");
        }
    }
} 