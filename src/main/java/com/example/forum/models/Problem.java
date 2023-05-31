package com.example.forum.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "problems")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "my_seq")
    @SequenceGenerator(name = "my_seq", sequenceName = "MY_SEQ", allocationSize = 1)
    @Column(name = "id")
    private Long id;

    @Size(max = 150)
    @Column(name = "headline", columnDefinition = "text")
    private String headline;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "activity")
    private int activity;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User user;

    @Column(name = "dateOfCreationProblem")
    private String dateOfCreationProblem;

}