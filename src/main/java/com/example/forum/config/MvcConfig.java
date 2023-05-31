package com.example.forum.config;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.context.annotation.Configuration;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
   @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        Path userUploadDir = Paths.get("./user-avatar");
        String userUploadFile = userUploadDir.toFile().getAbsolutePath();
        registry.addResourceHandler("/user-avatar/**").addResourceLocations("file:/"
                + userUploadFile + "/");
    }
}
