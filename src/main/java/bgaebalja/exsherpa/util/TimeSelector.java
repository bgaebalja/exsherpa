package bgaebalja.exsherpa.util;

import bgaebalja.exsherpa.collection.domain.Collection;
import bgaebalja.exsherpa.exam.domain.Exam;

import java.util.List;

public class TimeSelector {
    public static String selectTimeLimit(Exam exam) {
        int count = computeCount(exam);

        if (count <= 10) {
            return "20";
        }
        if (count <= 15) {
            return "30";
        }
        if (count <= 20) {
            return "40";
        }
        if (count <= 25) {
            return "50";
        }

        return "60";
    }

    private static int computeCount(Exam exam) {
        int count = 0;

        List<Collection> collections = exam.getCollections();
        for (Collection collection : collections) {
            count += collection.getQuestions().size();
        }

        return count;
    }
}
