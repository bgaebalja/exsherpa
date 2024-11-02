class RadioChoiceRenderer {
    constructor(props) {
        const {containerDiv, correctAnswerTextArea, itemId} = props;
        this.el = containerDiv;
        this.correctAnswerTextArea = correctAnswerTextArea;
        this.itemId = itemId
        this.render(props);
    }

    empty() {
        this.el.innerHTML = '';
    }

    render(props) {
        this.empty();
        const ul = document.createElement('ul');
        for (let i = 0; i < 5; i++) {
            const li = document.createElement('li');
            const radioButton = document.createElement('input');
            radioButton.type = 'radio';
            radioButton.name = 'radio_answer';
            radioButton.value = (i + 1).toString();
            radioButton.addEventListener('change', (ev) => {
                if (ev.target.checked === true) {
                    this.correctAnswerTextArea.value = JSON.stringify({"answer": ev.target.value});
                }
            });
            const input = document.createElement('input');
            input.type = 'text';
            input.name = 'answer_text';
            li.appendChild(radioButton);
            li.appendChild(input);
            ul.appendChild(li);
        }
        this.el.appendChild(ul);
    }

    getHTML() {
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        const answerTag = document.createElement('ul');
        answerTag.classList.add("answer-input-type", "radio", document.getElementById('is_image').checked === true ? 'image' : 'dummy_style');
        inputArray.forEach((item, index) => {
            if (item.value === '') {
                answerTag.classList.add('horizontal-type');
                item.value = ' &nbsp; ';
            }
            const liTag = document.createElement('li');
            liTag.innerHTML = `<input type ="radio" name="answer_${this.itemId}" id="answer_${this.itemId}_radio0${index + 1}" value="${index + 1}"/>
                <label for="answer_${this.itemId}_radio0${index + 1}">${index + 1}</label>
                <span class="txt">${item.value}</span>`;
            answerTag.appendChild(liTag);
        });
        return answerTag.outerHTML;
    }

    setHTML(html) {
        this.el.innerHTML = html;
    }

    getAnswerData() {
        const answerData = [];
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        inputArray.forEach((item, index) => {
            answerData.push(item.value);
        });
        return JSON.stringify({"answer": answerData});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        const dataJson = JSON.parse(data);
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        inputArray.forEach((item, index) => {
            item.value = dataJson["answer"][index];
        });
    }

}

class CheckBoxChoiceRenderer {
    constructor(props) {
        const {containerDiv, correctAnswerTextArea, itemId} = props;
        this.el = containerDiv;
        this.correctAnswerTextArea = correctAnswerTextArea;
        this.itemId = itemId;
        this.render(props);
    }

    render(props) {
        this.empty();
        const ul = document.createElement('ul');
        for (let i = 0; i < 5; i++) {
            const li = document.createElement('li');
            const checkButton = document.createElement('input');
            checkButton.type = 'checkbox';
            checkButton.name = 'checkbox_answer';
            checkButton.value = (i + 1).toString();
            checkButton.addEventListener('change', (ev) => {
                this.correctAnswerTextArea.value = this.getCorrectAnswer();
            });
            const input = document.createElement('input');
            input.type = 'text';
            input.name = 'answer_text';
            li.appendChild(checkButton);
            li.appendChild(input);
            ul.appendChild(li);
        }
        this.el.appendChild(ul);
    }

    empty() {
        this.el.innerHTML = '';
    }

    getHTML() {
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        const answerTag = document.createElement('ul');
        answerTag.classList.add("answer-input-type", "checkbox", document.getElementById('is_image').checked === true ? 'image' : 'dummy_style');
        inputArray.forEach((item, index) => {
            const liTag = document.createElement('li');
            liTag.innerHTML = `<input type ="checkbox" name="answer_${this.itemId}" id="answer_${this.itemId}_checkbox0${index + 1}" value="${index + 1}"/>
                <label for="answer_${this.itemId}_checkbox0${index + 1}">✔</label>
                <span class="txt">${item.value}</span>`;
            answerTag.appendChild(liTag);
        });
        return answerTag.outerHTML;
    }

    setHTML(html) {
        this.el.innerHTML = html;
    }

    getAnswerData() {
        const answerData = [];
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        inputArray.forEach((item, index) => {
            answerData.push(item.value);
        });
        return JSON.stringify({"answer": answerData});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        const dataJson = JSON.parse(data);
        const inputArray = this.el.querySelectorAll('input[name=answer_text]');
        inputArray.forEach((item, index) => {
            item.value = dataJson["answer"][index];
        });
    }

    getCorrectAnswer() {
        const checkBoxArray = this.el.querySelectorAll('input[name=checkbox_answer]');
        const answerArray = [];
        checkBoxArray.forEach((item, index) => {
            if (item.checked === true) {
                answerArray.push(item.value);
            }
        });
        return JSON.stringify({'answer': answerArray});
    }
}

class MatchingRenderer {
    constructor(props) {
        this.rowCount = 0;
        const {containerDiv, correctAnswerTextArea} = props;
        this.el = containerDiv;
        this.render(props);
    }

    render(props) {
        this.empty();
        const textAreaTag = document.createElement('textarea');
        this.el.appendChild(textAreaTag);
    }

    empty() {
        this.el.innerHTML = '';
    }

    getHTML() {
        return this.el.querySelector('textarea').value;
    }

    getAnswerData() {
        const list = [];
        return JSON.stringify({'answer': this.el.querySelector('textarea').value});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        const dataJson = JSON.parse(data);
        this.el.querySelector('textarea').value = dataJson["answer"];
    }
}

class HotSpotRenderer {
    constructor(divTag, viewer) {
        $(viewer).removeClass();
        viewer.classList.add('type-hotspot');
        this.el = divTag;
        this.empty();
        const input = document.createElement('input');
        const button = document.createElement('button');
        button.innerText = '미리보기 적용';
        input.type = 'textarea';
        input.name = 'answer_text';
        this.el.appendChild(input);
    }

    empty() {
        this.el.innerHTML = '';
    }

    getHTML() {
        return this.el.querySelectorAll('input')[0].value;
    }

    getAnswerData() {
        return JSON.stringify({});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
    }

}

class PullDownRenderer {
    constructor(divTag, viewer) {
        $(viewer).removeClass();
        viewer.classList.add('type-pull-down');
        this.el = divTag;
        this.empty();
        const button = document.createElement('button');
        button.innerText = '추가';
        button.addEventListener('click', (ev) => {
            ev.preventDefault();
        });
        this.el.appendChild(button);
    }

    empty() {
        this.el.innerHTML = '';
    }

    createRow(ulTag) {
        const liTag = document.createElement('li');

    }

    getAnswerData() {
        return JSON.stringify({});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
    }

}

class DragAndDropRenderer {
    constructor(divTag, viewer) {
        $(viewer).removeClass();
        viewer.classList.add('type-drag');
        this.el = divTag;
        this.empty();
    }

    empty() {
        this.el.innerHTML = '';
    }

    getAnswerData() {
        return JSON.stringify({});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
    }


}

class LineDrawingRenderer {
    constructor(divTag, viewer) {
        $(viewer).removeClass();
        viewer.classList.add('type-line');
    }

    getAnswerData() {
        return JSON.stringify({});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
    }

}

class ShortAnswerRenderer {
    constructor(props) {
        const {containerDiv, correctAnswerTextArea} = props;
        this.el = containerDiv;
        this.correctAnswerTextArea = correctAnswerTextArea;
        this.render(props);
    }

    render(props) {
        this.empty();
        const textArea = document.createElement('textarea');
        textArea.cols = 10;
        textArea.rows = 5;
        textArea.placeholder = "{%=%}를 입력하면 주관식이 입력됩니다.";
        textArea.id = "introduction_area";
        const input = document.createElement('input');
        input.type = 'text';
        input.name = 'answer_text';
        input.placeholder = "정답을 입력하시오.";
        input.addEventListener('change', (ev => {
            this.correctAnswerTextArea.value = JSON.stringify({"answer": this.el.querySelectorAll('input[name=answer_text]')[0].value.split(',')})
        }));
        this.el.appendChild(textArea);
        this.el.appendChild(input);
    }

    empty() {
        this.el.innerHTML = '';
    }

    getHTML() {
        const answer = document.createElement('div');
        answer.classList.add("answer-input-type", "textline");
        const regex = '{%=%}'
        let answerText = document.getElementById('introduction_area').value;
        answer.innerHTML = `<div>${answerText.replaceAll(regex, `<input type="text" name="answer"/>`)}</div>`;
        return answer.outerHTML;
    }

    getAnswerData() {
        return JSON.stringify({
            "answer": {
                "answerHTML": document.getElementById('introduction_area').value,
                "answerText": this.el.querySelectorAll('input[name=answer_text]')[0].value.split(',')
            }
        });
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        const dataJson = JSON.parse(data);
        document.getElementById('introduction_area').value = dataJson['answer']["answerHTML"]
        this.el.querySelectorAll('input[name=answer_text]')[0].value = dataJson['answer']["answerText"];
    }

}

class WritingResponseRenderer {
    constructor(props) {
        const {containerDiv, correctAnswerTextArea} = props;
        this.el = containerDiv;
        this.render(props);
    }

    render(props) {
        this.empty();
        const textArea = document.createElement('textarea');
        textArea.cols = 10;
        textArea.rows = 5;
        textArea.placeholder = "주관식 앞부분에 입력하세요.";
        textArea.id = "introduction_area";
        const input = document.createElement('textarea');
        input.cols = 30;
        input.rows = 10;
        input.name = 'answer_text';
        this.el.appendChild(textArea);
        this.el.appendChild(input);
    }

    empty() {
        this.el.innerHTML = '';
    }

    getHTML() {
        const answer = document.createElement('div');
        answer.classList.add("answer-input-type");
        answer.innerHTML = `<div>${document.getElementById('introduction_area').value}
            <textarea name="answer" cols="30" rows="10"></textarea></div>`;
        return answer.outerHTML;
    }

    getAnswerData() {
        return JSON.stringify({"answer": document.getElementById("introduction_area").value});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        document.getElementById('introduction_area').value = data["answer"];
    }

}

class MathSymbolsRenderer {
    constructor(divTag, viewer) {
        $(viewer).removeClass();
        viewer.classList.add('type-math');
    }

    getAnswerData() {
        return JSON.stringify({});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
    }

}

class TemplateRenderer {
    constructor(props) {
        this.render(props);
    }

    empty() {
        this.el.innerHTML = '';
    }

    render(props) {
        const {containerDiv} = props;
        this.el = containerDiv;
        this.empty();
        const input = document.createElement('textarea');
        input.name = 'answer_text';
        input.cols = 30;
        input.rows = 10;
        this.el.appendChild(input);
    }

    getHTML() {
        return this.el.getElementsByTagName('textarea')[0].value;
    }

    setHTML(html) {
        this.el.getElementsByTagName('textarea')[0].value = html;
    }

    getAnswerData() {
        return JSON.stringify({"answer": document.getElementsByName('answer_text')[0].value});
    }

    setAnswerData(data) {
        if (data === '') {
            return;
        }
        const dataJson = JSON.parse(data);
        document.getElementsByName('answer_text')[0].value = dataJson["answer"];
    }

}