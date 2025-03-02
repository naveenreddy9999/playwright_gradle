package stepDef;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class StepDefinition {

    @Given("User navigating to the login page")
    public void user_navigating_to_the_login_page() {
          System.out.println("hello");
    }

    @When("log in {string}")
    public void logIn(String arg0) {
        System.out.println("hello +"+arg0);
    }
}
