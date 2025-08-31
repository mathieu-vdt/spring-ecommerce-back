package com.mathieu.backoffice;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@Disabled("temporary")

@SpringBootTest
@ActiveProfiles("test")   // <-- active la config H2 et coupe le seed
class BackofficeApplicationTests {

    @Test
    void contextLoads() {
        // démarrage du contexte seulement
    }
}
