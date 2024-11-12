function inputStudentAnswer(props) {
    const {slide, index} = props;
    const itemType = slide.querySelector('input[name=item_type]').value;
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;

    if (studentAnswer === '') {
        $("#swiper" + index).css("background-color", "#3b434a");
    } else {
        if (studentAnswer !== "{}" && studentAnswer !== "{\"answer\":[\"\"]}" && studentAnswer !== "선택") {
            $("#swiper" + index).css("background-color", "#255897");
        } else {
            $("#swiper" + index).css("background-color", "#3b434a");
        }
    }

    if (itemType === 'IT01') {
        inputRadio(slide);
    } else if (itemType === 'IT02') {
        inputCheckbox(slide);
    } else if (itemType === 'IT05') {
        inputMatching(slide);
    } else if (itemType === 'IT09') {
        inputShortSentence(slide);
    } else if (itemType === 'IT10') {
        inputLongSentence(slide);
    } else if (itemType === 'TT03') {
        inputHotSpot(slide);
    } else if (itemType === 'TT04') {
        inputSelect(slide);
    } else if (itemType === 'TT07') {
        inputDragDrop(slide);
    } else if (itemType === 'TT11') {
        inputEditError(slide);
    } else if (itemType === 'IT11') {
        inputExpandChoice(slide);
    } else if (itemType === 'IT12') {
        inputDuplicateShortSentence(slide);
    } else if (itemType === 'IT13') {
        inputShortAndLongText(slide);
    } else if (itemType === 'IT14') {
        inputHotSpotAndLongText(slide);
    } else if (itemType === 'IT15') {
        inputHotSpotAndLongAndShortText(slide);
    } else if (itemType === 'IT16') {
        inputDuplicatePullAndDropAnswer(slide);
    } else if (itemType === 'IT17') {
        inputSocialInputAnswer(slide);
    } else if (itemType === 'IT18') {
        inputDuplicateMultiSentence(slide);
    }
}

function inputDuplicateMultiSentence(slide) {
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    const radioButtons = slide.querySelectorAll('input[type=text]');
    const answerList = JSON.parse(studentAnswer).answer;
    radioButtons.forEach((item, index) => {
        item.value = answerList[index] === undefined ? "" : answerList[index];
    });
}

function inputRadio(slide) {

    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    const radioButtons = slide.querySelectorAll('input[type=radio]');
    const jsonAnswer = JSON.parse(studentAnswer);
    radioButtons.forEach((item, index) => {
        if (item.value === jsonAnswer.answer) {
            item.checked = true;
        }
    });
}

function inputCheckbox(slide) {
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    const radioButtons = slide.querySelectorAll('input[type=checkbox]');
    const answerList = JSON.parse(studentAnswer).answer;
    radioButtons.forEach((item, index) => {
        if (answerList.includes(item.value) === true) {
            item.checked = true;
        }
    });
    const buttonList = slide.querySelectorAll('button');
    buttonList.forEach((item, index) => {
        if (answerList.includes(index) === true) {
            item.classList.add('active');
        }
    });
}

function inputShortSentence(slide) {
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    const radioButtons = slide.querySelectorAll('input[type=text]');
    const answerList = JSON.parse(studentAnswer).answer;
    radioButtons.forEach((item, index) => {
        item.value = answerList[index] === undefined ? "" : answerList[index];
    });
    const textAreaList = slide.querySelectorAll('textarea');
    textAreaList.forEach((item, index) => {
        item.value = answerList[index];
    });
}

function inputLongSentence(slide) {
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    const textAreaList = slide.querySelectorAll('textarea');
    const answerList = JSON.parse(studentAnswer).answer;

    textAreaList.forEach((item, index) => {
        item.value = answerList[index] === undefined ? "" : answerList[index];
    })
}

function inputMatching(slide) {
    const studentAnswer = slide.querySelector('input[name=student_answer]').value;
    console.log(studentAnswer);
    //slide.querySelector('.form-joining').innerHTML = slide.querySelector('input[name=student_answer]').value;
}

function inputDragDrop(slide) {
    const studentAnswerList = JSON.parse(slide.querySelector('input[name=student_answer]').value.replaceAll("\\\\", "\\"))["answer"];
    slide.querySelectorAll('.drop').forEach((item, index) => {
        if (studentAnswerList[index] !== undefined) {
            if ($(studentAnswerList[index]).prop("tagName") === 'IMG') {
                const imageSRC = $(studentAnswerList[index]).attr("src");
                slide.querySelectorAll('.drag').forEach((item, index) => {
                    if ($(item.querySelector('img')).attr("src") === imageSRC) {
                        item.innerHTML = '';
                    }
                });
            }
            item.innerHTML = studentAnswerList[index];
            item.classList.add('on');
            item.addEventListener('click', (ev) => {
                const spanTag = item.querySelector('span');
                const imgTag = item.querySelector('img');
                if (imgTag !== null) {
                    const dataNum = $(imgTag).attr('data-num');
                    slide.querySelectorAll('.drag').forEach((item, index) => {
                        if (dataNum === index.toString()) {
                            item.innerHTML = imgTag.outerHTML;
                        }
                    });
                }
                if (spanTag !== null) {
                    const dragList = slide.querySelectorAll('.drag');
                    dragList.forEach((item, index) => {
                        if (spanTag.innerText === $(item).attr('data-name')) {
                            $(item).css('opacity', '1');
                            $(item).attr('draggable', 'true');
                        }
                    });
                }
                item.innerHTML = '';
            });
        }
    });
}

function inputEditError(slide) {
    const studentAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value);
    const textInput = slide.querySelectorAll('input[type=text]');
    textInput.forEach((item, index) => {
        item.value = studentAnswer.answer[index];
    });
}

function inputSelect(slide) {
    let currentIndex = 0;
    const answer = slide.querySelector('input[name=student_answer]').value.replaceAll("  ", "").replaceAll("\\\\n", "").replaceAll("\\\\", "\\");
    const studentAnswer = JSON.parse(answer);
    const divSelectValue = slide.querySelectorAll('span.selected');
    const textInput = slide.querySelectorAll('select');
    textInput.forEach((item, index) => {
        item.value = studentAnswer.answer[index];
        currentIndex = index + 1;
    });
    divSelectValue.forEach((item, index) => {
        item.innerHTML = studentAnswer.answer[index + currentIndex];
    });
}

function inputHotSpot(slide) {
    const gList = slide.querySelectorAll('g');
    const list = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;
    gList.forEach((item, index) => {
        if (list.includes(index + 1) === true) {
            item.classList.add('on');
        }
    });
}

//IT11 - 중학과학 1회
function inputExpandChoice(slide) {
    // const gList = slide.querySelectorAll('g');
    // const list = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;
    // gList.forEach((item,index) => {
    //     if(list.includes(index + 1) === true){
    //         item.classList.add('on');
    //     }
    // });


}


//IT12
function inputDuplicateShortSentence(slide) {
    const correctAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;
    const inputList = slide.querySelectorAll('input[type=text]');
    let inputTag = null;
    for (let i = 0; i < inputList.length; i++) {
        const temp = inputList[i];
        if (!temp.classList.contains('not-answer')) {
            inputTag = temp;
        }
    }
    if (slide.querySelector('input[type=text]') == null) {
        slide.querySelector('textarea').value = correctAnswer === undefined ? "" : correctAnswer;
    } else {
        inputTag.value = correctAnswer === undefined ? "" : correctAnswer;
    }
}


//IT13
function inputShortAndLongText(slide) {

    const inputAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;
    const textAreaAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).textarea;

    const textInput = slide.querySelectorAll('input[type=text]');

    slide.querySelector('textarea').value = textAreaAnswer === undefined ? "" : textAreaAnswer;

    textInput.forEach((item, index) => {
        item.value = inputAnswer[index] === undefined ? "" : inputAnswer[index];
    });

}


//IT14
function inputHotSpotAndLongText(slide) {
    const gList = slide.querySelectorAll('g');
    const list = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;
    gList.forEach((item, index) => {
        if (list.includes(index + 1) === true) {
            item.classList.add('on');
        }
    });

    const textAreaAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).textarea;

    slide.querySelector('textarea').value = textAreaAnswer === undefined ? "" : textAreaAnswer;

}


//IT15
function inputHotSpotAndLongAndShortText(slide) {
    const gList = slide.querySelectorAll('g');
    const list = JSON.parse(slide.querySelector('input[name=student_answer]').value).answer;

    gList.forEach((item, index) => {
        if (list.includes(index + 1) === true) {
            item.classList.add('on');
        }
    });

    const inputAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).shortText;
    const textAreaAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value).textarea;

    slide.querySelector('input[type=text]').value = inputAnswer === undefined ? "" : inputAnswer;
    slide.querySelector('textarea').value = textAreaAnswer === undefined ? "" : textAreaAnswer;

}

function inputDuplicatePullAndDropAnswer(slide) {
    const jsonAnswer = JSON.parse(slide.querySelector('input[name=student_answer]').value);
    const correctAnswerList = jsonAnswer["answer"];
    const itemType = jsonAnswer["type"];
    if (itemType === 'img') {
        const dragList = slide.querySelectorAll('.drag img');
        let size = correctAnswerList.length;
        let flag = 0;
        dragList.forEach((item, index) => {
            if (correctAnswerList.includes($(item).attr("data-num"))) {
                const dropList = slide.querySelectorAll('.drop');
                dropList[correctAnswerList.indexOf($(item).attr("data-num"))].appendChild(item);
                dropList[correctAnswerList.indexOf($(item).attr("data-num"))].classList.add('on');
                item.innerHTML = '';
                flag++;
                item.addEventListener('click', (ev) => {
                    const dataNum = $(item).attr('data-num');
                    const itemTag = item;
                    slide.querySelectorAll('.drag').forEach((item, index) => {
                        if (dataNum === index.toString()) {
                            item.innerHTML = itemTag.outerHTML;
                        }
                    });
                    $(item).parent().empty();
                });
            }
            if (flag === size) {
                return;
            }
        });
    } else {
        const dropList = slide.querySelectorAll('span.drop');

        dropList.forEach((item, index) => {
            console.log(correctAnswerList[index])
            item.classList.add('on');
            const spanTag = document.createElement('span');
            spanTag.classList.add('txt');
            if (correctAnswerList[index] === undefined) {
                spanTag.innerText = ""
            } else {
                spanTag.innerText = correctAnswerList[index];
            }
            item.appendChild(spanTag);
            item.addEventListener('click', (ev) => {
                const dataName = $(item).attr('data-name');
                const itemTag = item;
                slide.querySelectorAll('.drag').forEach((item, index) => {
                    if (dataName === $(item).attr('data-name')) {
                        $(item).css('opacity', '1');
                        $(item).attr('draggable', 'true');
                    }
                });
                $(item).empty();
            });
        });
    }
}

function inputSocialInputAnswer(slide) {
    const correctAnswerList = JSON.parse(slide.querySelector('input[name=student_answer]').value);
    const inputAnswer = correctAnswerList.answer;
    const socialRuleAnswer = correctAnswerList.social_rule;

    const textInput = slide.querySelectorAll('input[type=text]');
    const socialInput = slide.querySelectorAll('input[name=social_rule]')

    textInput.forEach((item, index) => {
        if (item.name !== 'social_rule') {
            item.value = inputAnswer[index] === undefined ? "" : inputAnswer[index];
        }
    });

    socialInput.forEach((item, index) => {
        item.value = socialRuleAnswer[index] === undefined ? "" : socialRuleAnswer[index];
    })

}