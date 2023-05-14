package com.example.forum.controllers;

import com.example.forum.models.Answer;
import com.example.forum.models.User;
import com.example.forum.services.AnswerService;
import com.example.forum.services.ProblemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class AnswerController {
    private final AnswerService answerService;
    private final ProblemService problemService;
    @PostMapping("/mainpage/answer/create")
    public String createAnswer(@RequestParam("answer") String answer, @RequestParam("idProblem") Long idProblem,
                               Principal principal) {
        Answer newAnswer = new Answer();
        newAnswer.setAnswer(answer);
        newAnswer.setIdProblem(idProblem);
        answerService.saveAnswer(newAnswer, principal);
        return "redirect:/mainpage";
    }
    @GetMapping("/mainpage/answer/{idQuestion}")
    private String answersInfo(@PathVariable Long idQuestion, Model model,Principal principal){
        model.addAttribute("answer", answerService.getAnswerById(idQuestion));
        model.addAttribute("answers", answerService.listAnswers(idQuestion));
        model.addAttribute("user", answerService.getAnswerByPrinciple(principal));
        model.addAttribute("problem", problemService.getProblemById(idQuestion));
        return "answer-info";
    }
}
