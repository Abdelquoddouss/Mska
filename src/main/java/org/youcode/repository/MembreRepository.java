package org.youcode.repository;

import org.springframework.stereotype.Repository;
import org.youcode.domain.Membre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

@Repository
public interface MembreRepository extends JpaRepository<Membre , UUID> {

}
