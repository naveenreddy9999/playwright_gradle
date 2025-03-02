import org.testng.TestNG;
import org.testng.annotations.Test;

public class MainClass {

   @Test
    public void testing()
    {
//        System.setProperty("cucumber.filter.tags","@login");
        // Create TestNG instance
        TestNG testNG = new TestNG();

        // Set the TestNG test classes, including the Cucumber TestRunner class
        testNG.setTestClasses(new Class[]{TestRunner.class});
        testNG.setVerbose(3);

        // Run the TestNG tests programmatically
        testNG.run();
    }
}

