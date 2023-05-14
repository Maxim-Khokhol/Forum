package com.example.forum.controllers;
import com.example.forum.models.Problem;
import com.example.forum.models.User;
import com.example.forum.services.AnswerService;
import com.example.forum.services.ProblemService;
import com.example.forum.services.UserService;
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
public class ProblemController {
    private final UserService userService;
    private final ProblemService problemService;
    private final AnswerService answerService;

    @GetMapping("/mainpage")
    public String problems(@RequestParam(name = "headline", required = false) String description,
                            Model model, Principal principal) {
        model.addAttribute("problems", problemService.listProblem(description));
        model.addAttribute("user", problemService.getProblemByPrincipal(principal));
        return "problems";
    }

    @PostMapping("/mainpage/problem/create")
    public String createProblem(Problem problem, Principal principal) {
        problemService.saveProblem(problem, principal);
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
    public String deleteProblem(@PathVariable("id") Long id) {
        problemService.deleteProblem(id);
        return "redirect:/mainpage";
    }

    @PostMapping("/mainpage/problem/{id}/edit")
    public String problemUpdate(@PathVariable(value = "id") Long id,
                                 Principal principal, String headline, String description, int activity) {
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

    @PostMapping( "/mainpage/settings")
    public String settingsTable(@RequestParam("theme") int theme,
                                @RequestParam("animation") int animation,
                                int id){
        User user = userService.getUserById(id);
        System.out.println(user.getId());
        user.setTheme(theme);
        user.setAnimation(animation);
        userService.saveUser(user);
        return "redirect:/mainpage";
    }


}
