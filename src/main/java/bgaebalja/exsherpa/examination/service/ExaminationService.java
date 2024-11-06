package bgaebalja.exsherpa.examination.service;

import bgaebalja.exsherpa.examination.domain.SubmitResultRequest;

public interface ExaminationService {
    Long registerResult(SubmitResultRequest submitResultRequest);
}
