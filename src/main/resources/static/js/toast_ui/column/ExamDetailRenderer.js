class ExamDetailRenderer {
    constructor(props) {
        this.el = document.createElement('span');

        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {grid, rowKey} = props;
        this.el.innerHTML = '';
        const propertyButton = document.createElement('a');
        propertyButton.className = 'pop-open';
        propertyButton.innerText = '속성'
        propertyButton.addEventListener('click', function () {
            openPopupProperty(grid, rowKey)
        });
        this.el.appendChild(propertyButton);

        const editButton = document.createElement('a');
        editButton.className = 'pop-open';
        editButton.innerText = '편집'
        editButton.addEventListener('click', function () {
            openPopupEditItem(grid, rowKey)
        });
        this.el.appendChild(editButton);
    }
}

function openPopupProperty(grid, rowKey) {
    const examId = grid.getValue(rowKey, 'examId');
    const popup2 = window.open('/naea-service/exam/pop-exam-property?exam_id=' + examId, '속성 편집', 'width=2000px,height=1200px');
    popup2.addEventListener('beforeunload', function () {
        grid.readData(1);
    });
}

function openPopupEditItem(grid, rowKey) {
    const examId = grid.getValue(rowKey, 'examId');
    const popup2 = location.replace('/naea-service/item/item-list?exam_id=' + examId, '문항 편집', 'width=2000px,height=1200px');
    popup2.addEventListener('beforeunload', function () {
        grid.readData(1);
    });
}