package stepDef;

import com.microsoft.playwright.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class StepDefinition {

    @Given("User navigating to the login page")
    public void user_navigating_to_the_login_page() {
        Playwright playwright = Playwright.create();
        Browser browser = playwright.chromium().launch(new BrowserType.LaunchOptions().setChannel("chrome").setHeadless(true));
        BrowserContext browserContext = browser.newContext();
        Page page = browserContext.newPage();
        page.navigate("https://mvnrepository.com/artifact/com.microsoft.playwright/playwright/1.51.0",new Page.NavigateOptions().setTimeout(50000));
        System.out.println("title :: "+page.title());
    }

    @When("log in {string}")
    public void logIn(String arg0) {
        System.out.println("hello +"+arg0);
    }
}
