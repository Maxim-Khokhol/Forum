package com.example.forum.services;
import com.example.forum.models.Problem;
import com.example.forum.models.User;
import com.example.forum.repositories.ProblemRepository;
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
public class ProblemService {
    private final ProblemRepository problemRepository;
    private final UserRepository userRepository;


    public void saveProblem(Problem problem, Principal principal){

        problem.setUser(getProblemByPrincipal(principal));
        log.info("Saving new {}; Author: {}", problem, problem.getUser().getUsername());
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        String formattedDateTime = currentDateTime.format(formatter);
        problem.setDateOfCreationProblem(formattedDateTime);
        problemRepository.save(problem);
    }

    public User getProblemByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByUsername(principal.getName());
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByUsername(principal.getName());
    }
    public void deleteProblem(Long id){
        problemRepository.deleteById(id);
    }

    public List<Problem> listProblem(String headline){
        if(headline != null) {
            return problemRepository.findByHeadline(headline);
        }
        return problemRepository.findAll();
    }
    public Problem getProblemById(Long id){
        return problemRepository.findById(id).orElse(null);
    }
}
