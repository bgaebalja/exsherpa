package bgaebalja.exsherpa.examination.controller;

import bgaebalja.exsherpa.exam.domain.GetExamResponse;
import bgaebalja.exsherpa.exam.domain.GetExamsResponse;
import bgaebalja.exsherpa.exam.service.ExamService;
import bgaebalja.exsherpa.examination.domain.ExamInformationResponse;
import bgaebalja.exsherpa.util.FormatConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/exam")
@RequiredArgsConstructor
public class ExaminationController {
    private final ExamService examService;

    @GetMapping("/user-exam-cbt")
    public ModelAndView getPracticeInformationPage(@RequestParam("school_level") String schoolLevel) {
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
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("exam_round") String examRound,
            @RequestParam("year") String year
    ) {
        ModelAndView modelAndView = new ModelAndView("user/exam/user-exam-subject");
        modelAndView.addObject("examInformationResponse", ExamInformationResponse.of(schoolLevel, examRound, year));

        if (examRound.equals("1")) {
            modelAndView.addObject("getExamsResponse", GetExamsResponse.from(examService.getPastExams()));
            return modelAndView;
        }

        modelAndView.addObject("getExamsResponse", GetExamsResponse.from(examService.getBsherpaExams()));
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

    @GetMapping("/report")
    public ModelAndView getReportPage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("year") String year
    ) {
        ModelAndView modelAndView = new ModelAndView("user/exam/report");
        modelAndView.addObject("examInformationResponse", ExamInformationResponse.of(schoolLevel, "1", year));

        return modelAndView;
    }

    @GetMapping("/exam-view")
    public ModelAndView getActualTestPage(@RequestParam(value = "exam_id") String examId) {
        // TODO: 멀티스레드 시간 측정
        GetExamResponse getExamResponse
                = GetExamResponse.from(examService.getExam(FormatConverter.parseToLong(examId)));

        return new ModelAndView("exam/exam-view", "getExamResponse", getExamResponse);
    }
}
