package com.example.forum.services;

import com.example.forum.models.Answer;
import com.example.forum.models.User;
import com.example.forum.repositories.AnswerRepository;
import com.example.forum.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AnswerService {
    private final AnswerRepository answerRepository;
    private final UserRepository userRepository;

    public void saveAnswer(Answer answer, Principal principal){
        answer.setUser(getAnswerByPrinciple(principal));
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        String formattedDateTime = currentDateTime.format(formatter);
        answer.setDateOfCreationProblem(formattedDateTime);
        answerRepository.save(answer);
    }

    public User getAnswerByPrinciple(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByUsername(principal.getName());
    }

    public List<Answer> listAnswers(Long idProblem){
        if(idProblem != null) {
            return answerRepository.findByIdProblem(idProblem);
        }
        return answerRepository.findAll();
    }


    public Answer getAnswerById(Long id){
        return answerRepository.findById(id).orElse(null);
    }

}