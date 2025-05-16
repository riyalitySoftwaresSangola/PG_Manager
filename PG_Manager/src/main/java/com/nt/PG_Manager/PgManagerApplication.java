package com.nt.PG_Manager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class PgManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(PgManagerApplication.class, args);
	}
	@Configuration
	public class WebConfig implements WebMvcConfigurer {

	    @Override
	    public void configureViewResolvers(ViewResolverRegistry registry) {
	        registry.jsp("/WEB-INF/jsp/", ".jsp");
	    }
	}
	
	
}



