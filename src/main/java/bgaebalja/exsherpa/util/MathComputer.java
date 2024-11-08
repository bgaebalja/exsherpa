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

        for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
            GetSolvedQuestionsResponse getSolvedQuestionsResponse
                    = getExaminationHistoriesResponse.get(i).getGetSolvedQuestionsResponse();

            for (int j = 0; j < getSolvedQuestionsResponse.size(); j++) {
                GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(j);
                String difficulty = getSolvedQuestionResponse.getDifficulty();
                boolean isCorrect = getSolvedQuestionResponse.isCorrect();

                difficultyMap.putIfAbsent(difficulty, new int[]{0, 0});
                int[] answerData = difficultyMap.get(difficulty);

                if (isCorrect) {
                    ++answerData[0];
                }
                ++answerData[1];
            }
        }

        Map<String, Long> answerRate = new HashMap<>();
        for (String key : difficultyMap.keySet()) {
            int[] answerData = difficultyMap.get(key);
            answerRate.put(key, Math.round((double) answerData[0] * 100 / answerData[1]));
        }

        return answerRate;
    }
}
