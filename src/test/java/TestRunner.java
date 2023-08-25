import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class TestRunner {
    @Test
    void runTest() {
        Results results = Runner.path(
            "classpath:individuals/test.feature")
            .outputCucumberJson(true)
            .outputJunitXml(true)
            .tags("~@skipme")
            .parallel(5);
        
        generateReport(results.getReportDir(), "karate-demo");
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    private void generateReport(String karateOutputPath, String projectName) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), projectName);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
