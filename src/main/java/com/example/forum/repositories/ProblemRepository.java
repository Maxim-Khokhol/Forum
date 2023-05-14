package com.example.forum.repositories;


import com.example.forum.models.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProblemRepository extends JpaRepository<Problem, Long> {
   @Query("select p from Problem p WHERE p.headline like %?1%"
           + "or p.description like %?1%"+ "or p.user.username like %?1%")
   List<Problem> findByHeadline(String headline);
}
