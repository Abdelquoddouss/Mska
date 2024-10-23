package org.youcode.domain;


import jakarta.persistence.*;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "membre")
@Data
@Builder
public class Membre {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "membership_number", nullable = false)
    private String membershipNumber;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "id_document", nullable = false)
    private String idDocument;

    @Column(name = "nationality", nullable = false)
    private String nationality;

    @Column(name = "membership_date", nullable = false)
    private LocalDate membershipDate;

    @Column(name = "license_expiry_date", nullable = false)
    private LocalDate licenseExpiryDate;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime created_at;



    public Membre() {
        this.id = UUID.randomUUID();
        this.created_at = LocalDateTime.now();
    }

    public Membre(UUID id, String membershipNumber, String firstName, String lastName, String idDocument, String nationality, LocalDate membershipDate, LocalDate licenseExpiryDate, LocalDateTime created_at) {
        this.id = id;
        this.membershipNumber = membershipNumber;
        this.firstName = firstName;
        this.lastName = lastName;
        this.idDocument = idDocument;
        this.nationality = nationality;
        this.membershipDate = membershipDate;
        this.licenseExpiryDate = licenseExpiryDate;
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Membre{" +
                "id=" + id +
                ", membershipNumber='" + membershipNumber + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", idDocument='" + idDocument + '\'' +
                ", nationality='" + nationality + '\'' +
                ", membershipDate=" + membershipDate +
                ", licenseExpiryDate=" + licenseExpiryDate +
                ", created_at=" + created_at +
                '}';
    }


}
