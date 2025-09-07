// src/main/java/.../WebConfig.java
package com.mathieu.backoffice.common;

import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

  @Value("${app.upload.dir:/app/uploads}")
  private String uploadDir;

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    String location = "file:" + Paths.get(uploadDir).toAbsolutePath().normalize().toString() + "/";
    registry.addResourceHandler("/uploads/**")
            .addResourceLocations(location);
  }
}
