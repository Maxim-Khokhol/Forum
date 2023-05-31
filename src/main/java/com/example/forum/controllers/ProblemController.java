package com.example.forum.controllers;
import com.example.forum.models.Problem;
import com.example.forum.models.User;
import com.example.forum.services.AnswerService;
import com.example.forum.services.ProblemService;
import com.example.forum.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProblemController {
    private final UserService userService;
    private final ProblemService problemService;
    private final AnswerService answerService;

    @GetMapping("/mainpage")
    public String problems(@RequestParam(name = "headline", required = false) String description,
                            Model model, Principal principal) {
        List<Problem> list = problemService.listProblem(description);
        list.sort((p1, p2) -> Long.compare(p2.getId(), p1.getId()));
        model.addAttribute("problems", list);
        model.addAttribute("user", problemService.getProblemByPrincipal(principal));
        return "problems";
    }

    @PostMapping("/mainpage/problem/create")
    public String createProblem(@ModelAttribute("problem") Problem problem,
                                Principal principal, BindingResult bindingResult, Model model, Long id){
        User user = userService.getUserByPrincipal(principal);
        user.incrementCountOfQuestions();
        problemService.saveProblem(problem, principal);
        if(bindingResult.hasErrors()) {
            model.addAttribute("user", userService.getUserById(id));
            return "createQuestion";
        }
        return "redirect:/mainpage";
    }

    @GetMapping("/mainpage/problem/{id}")
    public String problemInfo(@PathVariable Long id, Model model, Principal principal, Long idAnswer) {
        model.addAttribute("problem", problemService.getProblemById(id));
        model.addAttribute("user", problemService.getProblemByPrincipal(principal));
        model.addAttribute("answers", answerService.listAnswers(idAnswer));
        return "problem-info";
    }
    @PostMapping("/mainpage/problem/{id}/delete")
    public String deleteProblem(@PathVariable("id") Long id, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        user.reduceCountOfQuestions();
        problemService.deleteProblem(id);
        return "redirect:/mainpage";
    }

    @PostMapping("/mainpage/problem/{id}/edit")
    public String problemUpdate(@PathVariable(value = "id") Long id, String headline, String description, int activity,
                                Principal principal){
        Problem problem = problemService.getProblemById(id);
        problem.setHeadline(headline);
        problem.setDescription(description);
        problem.setActivity(activity);
        problemService.saveProblem(problem, principal);
        return "redirect:/mainpage";
    }

    @GetMapping("/mainpage/problem/{id}/edit")
    public String questionEdit(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("problem", problemService.getProblemById(id));
        model.addAttribute("user", problemService.getUserByPrincipal(principal));
        return "problem-edit";
    }

    @GetMapping("/userpage/{id}/user-questions")
    public String userQuestions(Principal principal, @PathVariable Long id, Model model, String description){
        List<Problem> list = problemService.listProblem(description);
        list.sort((p1, p2) -> Long.compare(p2.getId(), p1.getId()));
        User currentUser = userService.getUserByPrincipal(principal);
        User userProfile = userService.getUserById(id);
        model.addAttribute("problems", list);
        model.addAttribute("user", currentUser);
        model.addAttribute("userProfile", userProfile);
        return "user-questions";
    }





}
