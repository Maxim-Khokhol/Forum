package com.example.forum.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "answers")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "answer")
    private String answer;
    @Column(name = "idProblem")
    private Long idProblem;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User user;

    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public Long getIdProblem() {
        return idProblem;
    }
    public void setIdProblem(Long idProblem) {
        this.idProblem = idProblem;
    }

}
