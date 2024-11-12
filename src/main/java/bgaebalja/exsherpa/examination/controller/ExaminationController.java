package bgaebalja.exsherpa.examination.controller;

import bgaebalja.exsherpa.exam.domain.Exam;
import bgaebalja.exsherpa.exam.domain.GetExamResponse;
import bgaebalja.exsherpa.exam.domain.GetExamsResponse;
import bgaebalja.exsherpa.exam.service.ExamService;
import bgaebalja.exsherpa.examination.domain.*;
import bgaebalja.exsherpa.examination.service.ExaminationService;
import bgaebalja.exsherpa.exception.UserNotFoundException;
import bgaebalja.exsherpa.question.domain.GetQuestionResponse;
import bgaebalja.exsherpa.question.domain.Question;
import bgaebalja.exsherpa.question.service.QuestionService;
import bgaebalja.exsherpa.solvedquestion.service.SolvedQuestionService;
import bgaebalja.exsherpa.util.FormatConverter;
import bgaebalja.exsherpa.util.MathComputer;
import bgaebalja.exsherpa.util.PageableGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static bgaebalja.exsherpa.util.PaginationConstant.*;
import static org.springframework.http.HttpStatus.CREATED;

@Controller
@RequestMapping("/user/exam")
@RequiredArgsConstructor
public class ExaminationController {
    private final ExaminationService examinationService;
    private final ExamService examService;
    private final QuestionService questionService;
    private final SolvedQuestionService solvedQuestionService;

    @GetMapping("/user-exam-cbt")
    public ModelAndView getPracticeInformationPage(@RequestParam("school_level") String schoolLevel, HttpSession httpSession) {
        return new ModelAndView("user/exam/user-exam-cbt", "schoolLevel", schoolLevel);
    }

    @GetMapping("/user/viewer1")
    public String getMiddleHighPracticePage() {
        return "exam/middle-high-practice-view";
    }

    @GetMapping("/user/viewer2")
    public String getElementaryPracticePage() {
        return "exam/elementary-practice-view";
    }

    @PreAuthorize("hasRole('ROLE_STUDENT')")
    @GetMapping("/user-exam-subject")
    public ModelAndView getExamSubjectPage(
            @RequestParam(defaultValue = TRUE) String paged,
            @RequestParam(defaultValue = ZERO) String pageNumber,
            @RequestParam(defaultValue = TEN) String size,
            @RequestParam(defaultValue = ORDER_BY_CREATED_AT_DESCENDING) String sort,
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("exam_round") String examRound,
            @RequestParam("year") String year,
            @RequestParam(value = "subject_name", defaultValue = "국어") String subjectName,
            @RequestParam(value = "is_mine", defaultValue = "false") String isMine,
            HttpSession session
    ) {
        ModelAndView modelAndView = new ModelAndView("user/exam/user-exam-subject");
        String email = session.getAttribute("email").toString();
        modelAndView.addObject(
                "examInformationResponse", ExamInformationResponse.of(schoolLevel, examRound, year)
        );

        List<GetExamResponse> getExamResponses = new ArrayList<>();
        Pageable pageable = PageableGenerator.createPageable(paged, pageNumber, size, sort);

        if (examRound.equals("1")) {
            Page<Exam> pagedExams = examService.getPastExams(pageable, subjectName);
            List<Exam> exams = pagedExams.getContent();
            for (Exam exam : exams) {
                ExaminationHistory examinationHistory
                        = examinationService.getCachedExaminationHistory(email, exam.getId());
                getExamResponses.add(GetExamResponse.from(exam, examinationHistory));
            }
            modelAndView.addObject("getExamsResponse", GetExamsResponse.of(getExamResponses));
            modelAndView.addObject("page_information", PageInformation.from(pagedExams));

            return modelAndView;
        }

        Page<Exam> pagedExams = examService.getBsherpaExams(pageable, email, FormatConverter.parseToBoolean(isMine));
        List<Exam> exams = pagedExams.getContent();
        for (Exam exam : exams) {
            ExaminationHistory examinationHistory
                    = examinationService.getCachedExaminationHistory(email, exam.getId());
            getExamResponses.add(GetExamResponse.from(exam, examinationHistory));
        }

        modelAndView.addObject("getExamsResponse", GetExamsResponse.of(getExamResponses));
        modelAndView.addObject("page_information", PageInformation.from(pagedExams));

        return modelAndView;
    }

    @GetMapping("/user-exam-sound")
    public ModelAndView getExamSoundPage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("exam_round") String examRound,
            @RequestParam("year") String year,
            @RequestParam(value = "exam_id", defaultValue = "1") String examId
    ) {
        ExamInformationResponse examInformationResponse
                = ExamInformationResponse.of(schoolLevel, examRound, year, examId);
        if (examRound.equals("1")) {
            return new ModelAndView(
                    "user/exam/user-exam-sound1", "examInformationResponse", examInformationResponse
            );
        }

        return new ModelAndView("user/exam/user-exam-sound2", "examInformationResponse", examInformationResponse);
    }

    @GetMapping("/user-exam-notice")
    public ModelAndView getExamNoticePage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("exam_round") String examRound,
            @RequestParam("year") String year,
            @RequestParam(value = "exam_id", defaultValue = "1") String examId
    ) {
        ExamInformationResponse examInformationResponse
                = ExamInformationResponse.of(schoolLevel, examRound, year, examId);
        if (examRound.equals("1")) {
            return new ModelAndView(
                    "user/exam/user-exam-notice1", "examInformationResponse", examInformationResponse
            );
        }

        return new ModelAndView("user/exam/user-exam-notice2", "examInformationResponse", examInformationResponse);
    }

    @GetMapping("/exam-view")
    public ModelAndView getActualTestPage(
            @RequestParam(value = "exam_id") String examId,
            @RequestParam(value = "is_cached", defaultValue = "false") String isCached,
            HttpSession session
    ) {
        Long parsedExamId = FormatConverter.parseToLong(examId);

        if (FormatConverter.parseToBoolean(isCached)) {
            ExaminationHistory cachedExaminationHistory = examinationService.getCachedExaminationHistory(
                    session.getAttribute("email").toString(), parsedExamId
            );
            GetExamResponse getExamResponse = GetExamResponse.from(
                    examService.getExam(parsedExamId), GetExaminationHistoryResponse.from(cachedExaminationHistory)
            );

            return new ModelAndView("exam/exam-view", "getExamResponse", getExamResponse);
        }

        GetExamResponse getExamResponse = GetExamResponse.from(examService.getExam(parsedExamId));

        return new ModelAndView("exam/exam-view", "getExamResponse", getExamResponse);
    }

    @PostMapping("/submit")
    public ResponseEntity<Integer> submitResult(@RequestBody SubmitResultRequest submitResultRequest) {
        if (FormatConverter.parseToBoolean(submitResultRequest.getIsCache())) {
            examinationService.registerCacheData(submitResultRequest);

            return ResponseEntity.status(CREATED).body(-1);
        }

        int examinationHistoriesSize = examinationService.registerResult(submitResultRequest);

        return ResponseEntity.status(CREATED).body(examinationHistoriesSize);
    }

    @GetMapping("/report-answer")
    public ModelAndView getReportAnswer(@RequestParam String questionId) {
        Question question = questionService.getQuestion(FormatConverter.parseToLong(questionId));

        return new ModelAndView("item/report-answer", "getQuestionResponse", GetQuestionResponse.from(question));
    }

    @GetMapping("/report")
    public ModelAndView getReportPage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam(value = "exam_round", defaultValue = "1") String examRound,
            @RequestParam("year") String year,
            @RequestParam(value = "examination_sequence", defaultValue = "0") String examinationSequence,
            HttpSession session
    ) {
        ModelAndView modelAndView = new ModelAndView("user/exam/report");
        modelAndView.addObject(
                "examInformationResponse", ExamInformationResponse.of(schoolLevel, examRound, year)
        );

        String email = session.getAttribute("email").toString();
        GetExaminationHistoriesResponse getMyExaminationHistoriesResponse = null;
        try {
            getMyExaminationHistoriesResponse
                    = GetExaminationHistoriesResponse.from(examinationService.getSolvedExaminationHistories(email));
        } catch (UserNotFoundException unfe) {
            return new ModelAndView("user/login/login");
        }

        modelAndView.addObject("getExaminationHistoriesResponse", getMyExaminationHistoriesResponse);
        Long examId = getMyExaminationHistoriesResponse.get(FormatConverter.parseToInt(examinationSequence)).getExamId();
        GetExaminationHistoriesResponse getAllExaminationHistoriesFromExamResponse
                = GetExaminationHistoriesResponse.from(examinationService.getSolvedExaminationHistoriesFromExam(examId)
        );
        GetExaminationHistoriesResponse getMyExaminationHistoriesFromExamResponse
                = GetExaminationHistoriesResponse.from(
                examinationService.getSolvedExaminationHistoriesFromExam(examId, email)
        );

        Map<String, Long> difficultyAnswerRate
                = MathComputer.computeDifficultyAnswerRate(getAllExaminationHistoriesFromExamResponse);
        Map<String, Long> questionAnswerRate
                = MathComputer.computeQuestionAnswerRate(getAllExaminationHistoriesFromExamResponse);
        Map<String, Long> allQuestionTypeAnswerRate
                = MathComputer.computeQuestionTypeAnswerRate(getAllExaminationHistoriesFromExamResponse);
        Map<String, Long> myQuestionTypeAnswerRate
                = MathComputer.computeQuestionTypeAnswerRate(getMyExaminationHistoriesFromExamResponse);
        Map<String, Long> allObSubAnswerRate
                = MathComputer.computeObSubAnswerRate(getAllExaminationHistoriesFromExamResponse);
        Map<String, Long> myObSubAnswerRate
                = MathComputer.computeObSubAnswerRate(getMyExaminationHistoriesFromExamResponse);

        modelAndView.addObject("examination_sequence", FormatConverter.parseToInt(examinationSequence));
        modelAndView.addObject("difficulty_answer_rate", difficultyAnswerRate);
        modelAndView.addObject("question_answer_rate", questionAnswerRate);
        modelAndView.addObject("all_sub_ob_answer_rate", allObSubAnswerRate);
        modelAndView.addObject("my_sub_ob_answer_rate", myObSubAnswerRate);
        modelAndView.addObject("all_question_type_answer_rate", allQuestionTypeAnswerRate);
        modelAndView.addObject("my_question_type_answer_rate", myQuestionTypeAnswerRate);

        return modelAndView;
    }

    @GetMapping("/report-student-answer")
    public ModelAndView getReportStudentAnswer(@RequestParam String solvedQuestionId) {
        SolvedQuestion solvedQuestion
                = solvedQuestionService.getSolvedQuestion(FormatConverter.parseToLong(solvedQuestionId));
        ModelAndView modelAndView = new ModelAndView("item/report-student-answer");
        modelAndView.addObject("getSolvedQuestionResponse", GetSolvedQuestionResponse.from(solvedQuestion));
        modelAndView.addObject("getQuestionResponse", GetQuestionResponse.from(solvedQuestion.getQuestion()));

        return modelAndView;
    }
}
