package stepDef;

import com.microsoft.playwright.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

import java.io.File;
import java.nio.file.Paths;

public class StepDefinition {

    @Given("User navigating to the login page")
    public void user_navigating_to_the_login_page() throws InterruptedException {
        Playwright playwright = Playwright.create();
        Browser browser = playwright.chromium().launch(new BrowserType.LaunchOptions().setChannel("chrome").setHeadless(false));
        BrowserContext browserContext = browser.newContext();
        Page page = browserContext.newPage();
        page.navigate("https://mvnrepository.com/artifact/com.microsoft.playwright/playwright/1.51.0",new Page.NavigateOptions().setTimeout(50000));
        Thread.sleep(50000);
        File folder = new File("screenshots");
        if (!folder.exists()) {
            folder.mkdirs();  // Create the directory if it doesn't exist
        }

        // Take the screenshot and save it in the folder
        String screenshotPath = folder.getAbsolutePath() + "/screenshot.png";
        page.screenshot(new Page.ScreenshotOptions().setPath(Paths.get(screenshotPath)).setFullPage(true));

        System.out.println("Screenshot saved at: " + screenshotPath);
        page.screenshot(new Page.ScreenshotOptions().setFullPage(true));
        System.out.println("title :: "+page.title());
        playwright.close();
    }

    @When("log in {string}")
    public void logIn(String arg0) {
        System.out.println("hello +"+arg0);
    }
}
