import org.testng.TestNG;

public class MainClass {

    public static void main(String[] args) {
        // Create TestNG instance
        TestNG testNG = new TestNG();

        // Set the TestNG test classes, including the Cucumber TestRunner class
        testNG.setTestClasses(new Class[]{TestRunner.class});
        testNG.setVerbose(3);

        // Run the TestNG tests programmatically
        testNG.run();
    }
}

