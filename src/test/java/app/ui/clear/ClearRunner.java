package app.ui.clear;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ClearRunner {

    @Test
    void testApi() {
        Results results = Runner.path("classpath:app/ui/clear").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}