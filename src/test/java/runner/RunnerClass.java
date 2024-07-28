package runner;

import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerClass {

    @BeforeEach
    public void beforeEach() {
        System.out.print("Test is started" );
    }

    @AfterEach
    public void afterEach() {
        System.out.print("Test is complated");
    }

    @Test
    public void testParallel() {Karate
            .run("src/test/java/magentoDummyFeatures",
                    "src/test/java/regresDummyFeatures")
            .parallel(1);
    }

    @Karate.Test
    Karate run() {
        return Karate.run("classpath:magentoDummyFeatures").relativeTo(getClass());
    }

    @Test
    void RunTag() {
        Results results = RunnerClass.path("classpath:src/test/java/magentoDummyFeatures").tags("~@Magento").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}

