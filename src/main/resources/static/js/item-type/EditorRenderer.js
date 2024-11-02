class EditorRendererManager {
    constructor(props) {
        const {passageTextArea, contentTextArea, dataTextArea, answerDiv, correctAnswerTextArea, viewer} = props;
        this.passageTextArea = passageTextArea;
        this.contentTextArea = contentTextArea;
        this.dataTextArea = dataTextArea;
        this.answerEditorDiv = answerDiv;
        this.answerEditor = null;
        this.correctAnswerTextArea = correctAnswerTextArea;
        this.viewer = viewer;
        this.itemType = null;
        $(this.viewer).removeClass();
    }

    displayItem() {
        const item = new Item({
            el: this.viewer,
            requestYn: 'N',
            passageHTML: this.passageTextArea.value,
            itemOrder: 0,
            itemContent: this.contentTextArea.value,
            itemDataHTML: this.dataTextArea.value,
            itemAnswerHTML: this.answerEditor.getHTML()
        });
    }

    setPassage(itemId) {
        if (itemId !== '') {
            fetch('/naea-service/item/item-view?item_id=' + itemId, {
                method: 'GET',
            }).then(response => {
                return response.json();
            }).then(data => {
                if (data.result === true) {
                    this.passageTextArea.value = data.data.passageHTML;
                    this.passageTextArea.disabled = true;
                } else {
                    console.log(data.message);
                }
            });
        } else {
            this.passageTextArea.disabled = false;
        }
    }

    readTemplate(data) {
        if (this.passageTextArea.disabled === false) {
            this.passageTextArea.value = data.passageHTML;
        }
        this.contentTextArea.value = data.contentHTML;
        this.dataTextArea.value = data.dataHTML;
        this.answerEditor = new TemplateRenderer({containerDiv: this.answerEditorDiv});
        this.answerEditor.setHTML(data.answerHTML);
    }

    getPassageHTML() {
        return this.passageTextArea.value;
    }

    getContentHTML() {
        if (this.itemType === 'IT01') {
            const contentsDiv = document.createElement('div');
            const itemId = document.getElementById('item_id_text').innerText;
            contentsDiv.innerHTML = this.contentTextArea.value;
            const radioList = contentsDiv.querySelectorAll('input[type=radio]');
            radioList.forEach((item, index) => {
                item.name = `answer_${itemId}`;
                item.value = index + 1;
            });
            return contentsDiv.innerHTML;
        } else if (this.itemType === 'TT04') {
            const contentsDiv = document.createElement('div');
            contentsDiv.innerHTML = this.contentTextArea.value;
            const optionList = contentsDiv.querySelectorAll('option');
            optionList.forEach((item, index) => {
                //item.value = item.innerHTML;
            });
            return contentsDiv.innerHTML;
        } else if (this.itemType === 'IT02') {
            const contentsDiv = document.createElement('div');
            const itemId = document.getElementById('item_id_text').innerText;
            contentsDiv.innerHTML = this.contentTextArea.value;
            const checkList = contentsDiv.querySelectorAll('input[type=checkbox]');
            const checkLabelList = contentsDiv.querySelectorAll('label');

            for (let i = 0; i < checkList.length; i++) {
                const check = $(checkList).eq(i);
                const label = $(checkLabelList).eq(i);

                check.attr("name", `answer_${itemId}`);
                check.attr("value", i + 1);
                label.text("✔")
            }
            return contentsDiv.innerHTML;
        }
        return this.contentTextArea.value;
    }

    getDataHTML() {
        return this.dataTextArea.value;
    }

    getAnswerHTML() {
        return this.answerEditor === null ? null : this.answerEditor.getHTML();
    }

    getAnswerText() {
        return this.answerEditor === null ? null : this.answerEditor.getAnswerData();
    }

    setAnswerText(jsonText) {
        if (jsonText !== null && jsonText !== '') {
            this.answerEditor.setAnswerData(jsonText);
        }
    }

    setClassHTMLViewer(itemType, itemId) {
        this.itemType = itemType;
        $(this.viewer).removeClass();
        switch (itemType) {
            case 'IT01' :
                this.answerEditor = new RadioChoiceRenderer({
                    containerDiv: this.answerEditorDiv,
                    correctAnswerTextArea: this.correctAnswerTextArea,
                    itemId: itemId
                });
                $(this.viewer).addClass('type-radio');
                break; //선다형(단일선택)
            case 'IT02' :
                this.answerEditor = new CheckBoxChoiceRenderer({
                    containerDiv: this.answerEditorDiv,
                    correctAnswerTextArea: this.correctAnswerTextArea,
                    itemId: itemId
                });
                $(this.viewer).addClass('type-checkbox');
                break; //선다형(다중선택)
            case 'IT05' :
                this.answerEditor = new MatchingRenderer({
                    containerDiv: this.answerEditorDiv,
                    correctAnswerTextArea: this.correctAnswerTextArea
                });
                $(this.viewer).addClass('type-matching');
                break; //짝 연결하기
            case 'IT09' :
                this.answerEditor = new ShortAnswerRenderer({
                    containerDiv: this.answerEditorDiv,
                    correctAnswerTextArea: this.correctAnswerTextArea
                });
                $(this.viewer).addClass('type-short');
                break; //단답형
            case 'IT10' :
                this.answerEditor = new WritingResponseRenderer({
                    containerDiv: this.answerEditorDiv,
                    correctAnswerTextArea: this.correctAnswerTextArea
                });
                $(this.viewer).addClass('type-write');
                break; //서술형
            default :
                this.answerEditor = new TemplateRenderer({containerDiv: this.answerEditorDiv});
                break;
        }
    }

}