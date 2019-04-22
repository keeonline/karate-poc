package provider.people;

import com.intuit.karate.FileUtils;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;
import com.intuit.karate.netty.FeatureServer;
import java.io.File;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.assertTrue;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:consumer/people/people.feature")
public class PeopleMockRunner {

    private static FeatureServer server;

    @BeforeClass
    public static void beforeClass() {
        File file = FileUtils.getFileRelativeTo(PeopleMockRunner.class, "people-mock.feature");
        server = FeatureServer.start(file, 0, false, null);
        String mockBaseUrl = "http://localhost:" + server.getPort() + "/";
        System.setProperty("mock.base.url", mockBaseUrl);
    }

    @AfterClass
    public static void afterClass() {
        server.stop();
    }

    @Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 5);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

}