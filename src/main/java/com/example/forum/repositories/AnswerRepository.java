package com.example.forum.repositories;

import com.example.forum.models.Answer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AnswerRepository extends JpaRepository<Answer, Long> {
    List<Answer> findByIdProblem(Long idProblem);


}
