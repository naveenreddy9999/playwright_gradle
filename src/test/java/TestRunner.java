import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        features = {"classpath:feature"},
        glue = {"classpath:stepDef"},
        dryRun = false,
        monochrome = true,
        plugin = {"pretty"},tags = "@login"
)

public class TestRunner extends AbstractTestNGCucumberTests {
}
