package org.ronak.generativetaskman;

import org.springframework.boot.SpringApplication;

public class TestGenerativeTaskManApplication {

    public static void main(String[] args) {
        SpringApplication.from(GenerativeTaskManApplication::main).with(TestcontainersConfiguration.class).run(args);
    }

}
