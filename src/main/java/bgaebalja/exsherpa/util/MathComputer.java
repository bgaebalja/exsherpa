package bgaebalja.exsherpa.util;

import bgaebalja.exsherpa.examination.domain.AnswerRequest;
import bgaebalja.exsherpa.examination.domain.GetExaminationHistoriesResponse;
import bgaebalja.exsherpa.examination.domain.GetSolvedQuestionResponse;
import bgaebalja.exsherpa.examination.domain.GetSolvedQuestionsResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MathComputer {
    public static short computeAnswerCount(List<AnswerRequest> answerRequests) {
        short count = 0;
        for (AnswerRequest answerRequest : answerRequests) {
            if (answerRequest.getSubmittedAnswer().equals(answerRequest.getOriginalAnswer())) {
                ++count;
            }
        }

        return count;
    }

    public static Map<String, Long> computeDifficultyAnswerRate(
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        Map<String, int[]> difficultyMap = new HashMap<>();
        Map<String, Long> answerRate = new HashMap<>();

        for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
            GetSolvedQuestionsResponse getSolvedQuestionsResponse
                    = getExaminationHistoriesResponse.get(i).getGetSolvedQuestionsResponse();

            for (int j = 0; j < getSolvedQuestionsResponse.size(); j++) {
                GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(j);
                String key = getSolvedQuestionResponse.getDifficulty();
                computeAnswerRate(difficultyMap, key, answerRate, getSolvedQuestionResponse);
            }
        }

        return answerRate;
    }

    public static void computeAnswerRate(
            Map<String, int[]> map, String key, Map<String, Long> answerRate,
            GetSolvedQuestionResponse getSolvedQuestionResponse
    ) {
        boolean isCorrect = getSolvedQuestionResponse.isCorrect();

        map.putIfAbsent(key, new int[]{0, 0});
        int[] answerData = map.get(key);

        if (isCorrect) {
            ++answerData[0];
        }
        ++answerData[1];

        answerRate.put(key, Math.round((double) answerData[0] * 100 / answerData[1]));
    }

    public static Map<String, Long> computeQuestionAnswerRate(
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        Map<String, int[]> questionMap = new HashMap<>();
        Map<String, Long> answerRate = new HashMap<>();

        for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
            GetSolvedQuestionsResponse getSolvedQuestionsResponse
                    = getExaminationHistoriesResponse.get(i).getGetSolvedQuestionsResponse();

            for (int j = 0; j < getSolvedQuestionsResponse.size(); j++) {
                GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(j);
                String key = getSolvedQuestionResponse.getQuestionId().toString();
                computeAnswerRate(questionMap, key, answerRate, getSolvedQuestionResponse);
            }
        }

        return answerRate;
    }

    public static Map<String, Long> computeQuestionTypeAnswerRate(
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        Map<String, int[]> questionTypeMap = new HashMap<>();
        Map<String, Long> answerRate = new HashMap<>();

        for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
            GetSolvedQuestionsResponse getSolvedQuestionsResponse
                    = getExaminationHistoriesResponse.get(i).getGetSolvedQuestionsResponse();

            for (int j = 0; j < getSolvedQuestionsResponse.size(); j++) {
                GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(j);
                String key = getSolvedQuestionResponse.getQuestionType();
                computeAnswerRate(questionTypeMap, key, answerRate, getSolvedQuestionResponse);
            }
        }

        return answerRate;
    }

    public static Map<String, Long> computeObSubAnswerRate(
            GetExaminationHistoriesResponse getExaminationHistoriesResponse
    ) {
        Map<String, int[]> questionTypeMap = new HashMap<>();
        Map<String, Long> answerRate = new HashMap<>();

        for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
            GetSolvedQuestionsResponse getSolvedQuestionsResponse
                    = getExaminationHistoriesResponse.get(i).getGetSolvedQuestionsResponse();

            for (int j = 0; j < getSolvedQuestionsResponse.size(); j++) {
                GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(j);
                String key = getSolvedQuestionResponse.isSubjective() ? "주관식" : "객관식";
                computeAnswerRate(questionTypeMap, key, answerRate, getSolvedQuestionResponse);
            }
        }

        return answerRate;
    }
}
