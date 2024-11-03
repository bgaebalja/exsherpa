package bgaebalja.exsherpa.examination.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/exam")
public class ExaminationController {
    @GetMapping("/user-exam-cbt")
    public ModelAndView getExamInformationPage(@RequestParam("school_level") String schoolLevel) {
        return new ModelAndView("user/exam/user-exam-cbt", "school_level", schoolLevel);
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
