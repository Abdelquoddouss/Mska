package org.youcode.services;


import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.youcode.domain.Membre;
import org.youcode.repository.MembreRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MembreServiceImp implements MembreService {

    @Autowired
    private MembreRepository membreRepository;

    @Override
    public List<Membre> findAll() {
        return membreRepository.findAll();
    }

    @Override
    public Optional<Membre> findById(UUID id) {
        Optional<Membre> membre = membreRepository.findById(id);
        // Supprimer l'exception personnalisée MembreNotFoundException
        if (membre.isEmpty()) {
            throw new EntityNotFoundException("Membre not found with ID: " + id);
        }
        return membre;
    }

    @Transactional
    @Override
    public Membre save(Membre membre) {
        // Suppression de la méthode validateMembre et des validations associées
        return membreRepository.save(membre);
    }

    @Override
    @Transactional
    public void deleteById(UUID id) {
        if (!membreRepository.existsById(id)) {
            throw new EntityNotFoundException("Membre not found with ID: " + id);
        }
        membreRepository.deleteById(id);
    }


}

