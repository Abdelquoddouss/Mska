package org.youcode.services;

import org.springframework.transaction.annotation.Transactional;
import org.youcode.domain.Membre;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface MembreService {

    List<Membre> findAll();

    Optional<Membre> findById(UUID id);

    @Transactional
    Membre save(Membre membre);



    void deleteById(UUID id);

}
