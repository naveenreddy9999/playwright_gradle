import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.Test;

@CucumberOptions(
        features = {"classpath:feature"},
        glue = {"classpath:stepDef"},
        dryRun = false,
        monochrome = true,
        tags = "@login"
)

public class TestRunner extends AbstractTestNGCucumberTests {
}
