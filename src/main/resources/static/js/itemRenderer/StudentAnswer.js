class StudentAnswer {
    constructor(props) {
        const {el, resultId} = props;
        this.el = el;
        this.resultId = resultId;
        this.render(props);
    }

    render(props) {
        this.request(props).then((data) => {
            if (data.result === true) {
                this.renderContents(data.data);
                if (this.resultId) {
                    this.renderStudentAnswer(data.data);
                }
                this.disableAnswer(data.data);
            } else {
                alert('에러가 발생했습니다.');
            }
        });

    }

    async request(props) {
        const {itemId, resultId} = props;
        const url = resultId ? `/user/item/item-result-view?item_result_id=${resultId}` : `/user/item/item-view?item_id=${itemId}`;
        const data = fetch(url, {
            method: 'GET',
        }).then((response) => {
            return response.json();
        });
        return data;
    }

    renderContents(data) {
        const {itemContents} = data;
        this.el.innerHTML = itemContents;
        const audioList = this.el.querySelectorAll('audio');
        audioList.forEach((item, index) => {
            item.controlsList.add('noplaybackrate');
            //item.style.pointerEvents = "none";
        });

        const videoList = this.el.querySelectorAll('video');
        videoList.forEach((item, index) => {
            item.controlsList.add('noplaybackrate');
            item.controlsList.add('nodownload');
            item.disablePictureInPicture = true;
        });

    }

    renderStudentAnswer(props) {
        const slide = this.el;
        const {itemType, studentAnswer} = props;
        if (itemType === 'IT01') {
            this.inputRadio(slide, studentAnswer);
        } else if (itemType === 'IT02') {
            this.inputCheckbox(slide, studentAnswer);
        } else if (itemType === 'IT05') {
            this.inputMatching(slide, studentAnswer);
        } else if (itemType === 'IT09') {
            this.inputShortSentence(slide, studentAnswer);
        } else if (itemType === 'IT10') {
            this.inputLongSentence(slide, studentAnswer);
        } else if (itemType === 'TT03') {
            this.inputHotSpot(slide, studentAnswer);
        } else if (itemType === 'TT04') {
            this.inputSelect(slide, studentAnswer);
        } else if (itemType === 'TT07') {
            this.inputDragDrop(slide, studentAnswer);
        } else if (itemType === 'TT11') {
            this.inputEditError(slide, studentAnswer);
        } else if (itemType === 'IT12') {
            this.inputDuplicateShortSentence(slide, studentAnswer);
        } else if (itemType === 'IT11') {
            this.inputExpandChoice(slide, studentAnswer);
        } else if (itemType === 'IT13') {
            this.inputShortAndLongText(slide, studentAnswer);
        } else if (itemType === 'IT14') {
            this.inputHotSpotAndLongText(slide, studentAnswer);
        } else if (itemType === 'IT15') {
            this.inputHotSpotAndLongAndShortText(slide, studentAnswer);
        } else if (itemType === 'IT16') {
            this.inputDuplicatePullAndDropAnswer(slide, studentAnswer);
        } else if (itemType === 'IT17') {
            this.inputSocialInputAnswer(slide, studentAnswer);
        }
    }

    disableAnswer(props) {
        const slide = this.el;
        const {itemType, studentAnswer} = props;
        if (itemType === 'IT01') {
            $("input[type=radio]").attr('disabled', true);
        } else if (itemType === 'IT02') {
            $("input[type=checkbox]").attr('disabled', true);
        } else if (itemType === 'IT05') {

        } else if (itemType === 'IT09') {
            $('input[type=text]').attr('readonly', true);
            $('textarea').attr('readonly', true);
        } else if (itemType === 'IT10') {
            $('textarea').attr('readonly', true);
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'TT03') {

        } else if (itemType === 'TT04') {
            $(".wrap select").attr('disabled', true);
        } else if (itemType === 'TT07') {

        } else if (itemType === 'TT11') {
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'IT12') {
            $('textarea').attr('readonly', true);
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'IT11') {
        } else if (itemType === 'IT13') {
            $('textarea').attr('readonly', true);
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'IT14') {
            $('textarea').attr('readonly', true);
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'IT15') {
            $('textarea').attr('readonly', true);
            $('input[type=text]').attr('readonly', true);
        } else if (itemType === 'IT17') {
            $('input[type=text]').attr('readonly', true);
        }
    }

    inputRadio(slide, correctAnswer) {
        const studentAnswer = correctAnswer;
        const radioButtons = slide.querySelectorAll('input[type=radio]');
        const jsonAnswer = JSON.parse(studentAnswer);
        radioButtons.forEach((item, index) => {
            if (item.value === jsonAnswer.answer) {
                item.checked = true;
            }
        });
    }

    inputCheckbox(slide, correctAnswer) {
        const studentAnswer = correctAnswer;
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

    inputShortSentence(slide, correctAnswer) {
        const studentAnswer = correctAnswer;
        const radioButtons = slide.querySelectorAll('input[type=text]');
        const answerList = JSON.parse(studentAnswer).answer;

        //단답식 여러 개: 답을 아예 입력하지 않았을 때
        if (answerList === undefined) {
            $('input[type=text]').attr('readonly', true);
            $('textarea').attr('readonly', true);
        }

        radioButtons.forEach((item, index) => {
            //단답식 여러 개: 답을 일부만 입력했을 때
            if (answerList[index] === undefined) {
                item.value = ""
            } else {
                item.value = answerList[index];
            }
        });
        const textAreaList = slide.querySelectorAll('textarea');
        textAreaList.forEach((item, index) => {
            item.value = answerList[index];
        });
    }

    inputLongSentence(slide, correctAnswer) {
        const studentAnswer = correctAnswer;
        const answerList = JSON.parse(studentAnswer).answer;
        const textAreaList = slide.querySelectorAll('textarea');
        textAreaList.forEach((item, index) => {
            item.value = answerList[index];
        });

        const textInput = slide.querySelectorAll('input[type=text]');
        textInput.forEach((item, index) => {
            item.value = answerList[index];
        });
    }

    inputMatching(slide, correctAnswer) {
        const formJoining = slide.querySelector('.form-joining');
        const column1 = formJoining.querySelector('#column1')
        const column2 = formJoining.querySelector('#column2')
        const leftArea = formJoining.querySelector('#leftarea')

        const imageColumn = column1.querySelectorAll('div');
        const textColumn = column2.querySelectorAll('div');

        const correctAnswerList = JSON.parse(correctAnswer).answer;

        const column1Left = $(column1).position().left;
        const column1Top = $(column1).position().top;
        const column2Left = $(column2).position().left;
        const column2Top = $(column2).position().top;

        let tag = '';

        imageColumn.forEach((item, index) => {
            const itemId = $(item).children().attr('id');
            tag += '<svg style="position: absolute; z-index: 999; overflow: visible">';
            tag += '    <line id="line_' + itemId + '" style="stroke-width: 2; stroke: rgb(0,0,0)">';
            tag += '</svg>';  //1_1 //1_2 //1_3
        })

        $(leftArea).append(tag);

        correctAnswerList.forEach((item, index) => {
            const correctAnswerListLeft = item.left;
            const correctAnswerListRight = item.right;

            $('#' + item.left).attr('line_num', item.right);
            $('#' + correctAnswerListLeft).addClass('finished');

            if (item.left.includes('1_')) {
                $('#line_' + correctAnswerListLeft).attr('x1', $('#' + correctAnswerListLeft).position().left - column1Left)
                $('#line_' + correctAnswerListLeft).attr('y1', $('#' + correctAnswerListLeft).position().top - column1Top)
            }
            if (item.left.includes('2_')) {

                const lineNum = $('#' + correctAnswerListRight).attr('line_num');

                $('#line_' + correctAnswerListRight).attr('x2', $('#' + lineNum).position().left - column1Left)  //1_2 //2_2
                $('#line_' + correctAnswerListRight).attr('y2', $('#' + lineNum).position().top - column2Top)
            }

        })
        $(leftArea).append(tag);
    }

    inputDragDrop(slide, correctAnswer) {
        const studentAnswerList = JSON.parse(correctAnswer)["answer"];
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
            }
        });
    }

    inputSelect(slide, correctAnswer) {
        let currentIndex = 0;
        const studentAnswer = JSON.parse(correctAnswer);
        const textInput = slide.querySelectorAll('select');

        if (correctAnswer === '{}') {
            $(".wrap select").attr('disabled', true);
        }
        textInput.forEach((item, index) => {
            if (studentAnswer.answer[index] === undefined) {
                item.value = "선택";
                $(".wrap select").attr('disabled', true);
            } else {
                item.value = studentAnswer.answer[index];
                currentIndex = index + 1;
            }
        });
        const spanList = slide.querySelectorAll('span.selected');
        spanList.forEach((item, index) => {
            item.innerHTML = studentAnswer.answer[currentIndex + index];
        });
        $(".wrap select").attr('disabled', true);
    }

    inputHotSpot(slide, correctAnswer) {
        const gList = slide.querySelectorAll('g');
        const list = JSON.parse(correctAnswer).answer;
        gList.forEach((item, index) => {
            if (list.includes(index + 1) === true) {
                item.classList.add('on');
            }
        });
    }

    inputEditError(slide, correctAnswer) {
        const textInput = slide.querySelectorAll('input[type=text]');
        const list = JSON.parse(correctAnswer).answer;
        textInput.forEach((item, index) => {
            item.value = list[index];
        });
    }

    inputDuplicateShortSentence(slide, correctAnswer) {
        const textInput = slide.querySelector('input[type=text]');
        const textArea = slide.querySelector('textarea');
        const answer = JSON.parse(correctAnswer).answer;

        if (textInput === null) {
            if (answer === undefined) {
                textArea.value = "";
            } else {
                textArea.value = answer;
            }
        } else {
            if (answer === undefined) {
                textInput.value = "";
            } else {
                textInput.value = answer;
            }
        }

    }

    inputExpandChoice(slide, correctAnswer) {
        const answerList = JSON.parse(correctAnswer).answer;
        const gList = slide.querySelectorAll('g');
        const textArea = slide.querySelectorAll('textarea');
        let currentIndex = 0;
        gList.forEach((item, index) => {
            if (answerList.includes(index + 1) === true) {
                item.classList.add('on');
                currentIndex = currentIndex + 1;
            }
        });
        textArea.forEach((item, index) => {
            item.value = answerList[currentIndex];
        });
    }

    inputShortAndLongText(slide, correctAnswer) {
        const answerList = JSON.parse(correctAnswer).answer;
        const areaAnswerList = JSON.parse(correctAnswer).textarea;
        const inputBox = slide.querySelectorAll('input[type=text]');

        if (answerList !== undefined) {
            inputBox.forEach((item, index) => {
                item.value = answerList[index].split(',')[0];
            });
        }

        const textAreaList = slide.querySelectorAll('textarea');

        if (areaAnswerList !== undefined) {
            textAreaList.forEach((item, index) => {
                item.value = areaAnswerList;
            });
        }
    }

    inputHotSpotAndLongText(slide, correctAnswer) {
        const gList = slide.querySelectorAll('g');
        const list = JSON.parse(correctAnswer).answer;
        gList.forEach((item, index) => {
            if (list.includes(index + 1) === true) {
                item.classList.add('on');
            }
        });
        const areaAnswerList = JSON.parse(correctAnswer).textarea;
        const textAreaList = slide.querySelectorAll('textarea');

        textAreaList.forEach((item, index) => {
            item.value = areaAnswerList;
        });

    }

    inputHotSpotAndLongAndShortText(slide, correctAnswer) {
        if (correctAnswer === '{}') {
            $('input[type=text]').attr('readonly', true);
            $('textarea').attr('readonly', true);
        }

        const gList = slide.querySelectorAll('g');
        const list = JSON.parse(correctAnswer).answer;
        gList.forEach((item, index) => {
            if (list.includes(index + 1) === true) {
                item.classList.add('on');
            }
        });

        const inputAnswer = JSON.parse(correctAnswer).shortText;
        const textAreaAnswer = JSON.parse(correctAnswer).textarea;

        slide.querySelector('input[type=text]').value = inputAnswer === undefined ? "" : inputAnswer;
        slide.querySelector('textarea').value = textAreaAnswer === undefined ? "" : textAreaAnswer;
    }

    inputDuplicatePullAndDropAnswer(slide, correctAnswer) {
        const jsonAnswer = JSON.parse(correctAnswer);
        const correctAnswerList = jsonAnswer["answer"];
        const answerType = jsonAnswer["type"];
        if (answerType === 'img') {
            const dragList = slide.querySelectorAll('.drag img');
            let size = correctAnswerList.length;
            let flag = 0;
            dragList.forEach((item, index) => {
                if (correctAnswerList.includes($(item).attr("data-num"))) {
                    const dropList = slide.querySelectorAll('.drop');
                    dropList[flag].appendChild(item);
                    dropList[flag].classList.add('on');
                    item.innerHTML = '';
                    flag++;
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
            });
        }
    }

    inputSocialInputAnswer(slide, correctAnswer) {
        const inputAnswer = JSON.parse(correctAnswer).answer;
        const socialRuleAnswer = JSON.parse(correctAnswer).social_rule;

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


}