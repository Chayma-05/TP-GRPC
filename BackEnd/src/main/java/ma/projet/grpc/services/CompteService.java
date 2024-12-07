package ma.projet.grpc.services;

import ma.projet.grpc.entities.Compte;
import ma.projet.grpc.entities.TypeCompte;
import ma.projet.grpc.repositories.CompteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompteService {
    
    @Autowired
    private CompteRepository compteRepository;

    public List<Compte> getAllComptes() {
        return compteRepository.findAll();
    }

    public Compte getCompteById(String id) {
        return compteRepository.findById(id).orElse(null);
    }

    public Compte saveCompte(Compte compte) {
        return compteRepository.save(compte);
    }

    public double getTotalSolde() {
        return compteRepository.findAll()
                .stream()
                .mapToDouble(Compte::getSolde)
                .sum();
    }

    public List<Compte> getComptesByType(TypeCompte type) {
        return compteRepository.findByType(type);
    }

    public boolean deleteCompte(String id) {
        if (compteRepository.existsById(id)) {
            compteRepository.deleteById(id);
            return true;
        }
        return false;
    }
} 