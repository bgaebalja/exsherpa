package bgaebalja.exsherpa.examination.controller;

import bgaebalja.exsherpa.examination.domain.ExamInformationResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/exam")
public class ExaminationController {
    @GetMapping("/user-exam-cbt")
    public ModelAndView getPracticeInformationPage(@RequestParam("school_level") String schoolLevel) {
        return new ModelAndView("user/exam/user-exam-cbt", "schoolLevel", schoolLevel);
    }

    @GetMapping("/user-exam-subject")
    public ModelAndView getExamInformationPage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("exam_round") String examRound,
            @RequestParam("year") String year
    ) {
        // TODO: 데이터베이스에서 시험지 ID를 가져 오는 로직 추가
        ExamInformationResponse examInformationResponse = ExamInformationResponse.of(schoolLevel, examRound, year);
        if (examRound.equals("1")) {
            return new ModelAndView(
                    "user/exam/user-exam-notice1", "examInformationResponse", examInformationResponse
            );
        }

        return new ModelAndView("user/exam/user-exam-notice2", "examInformationResponse", examInformationResponse);
    }

    @GetMapping("/report")
    public ModelAndView getReportInformationPage(
            @RequestParam("school_level") String schoolLevel,
            @RequestParam("year") String year
    ) {
        ModelAndView modelAndView = new ModelAndView("user/exam/report");
        modelAndView.addObject("examInformationResponse", ExamInformationResponse.of(schoolLevel, "1", year));

        return modelAndView;
    }

    @GetMapping("/user/viewer1")
    public String getMiddleHighPracticePage() {
        return "exam/middle-high-practice-view";
    }

    @GetMapping("/user/viewer2")
    public String getElementaryPracticePage() {
        return "exam/elementary-practice-view";
    }
}
