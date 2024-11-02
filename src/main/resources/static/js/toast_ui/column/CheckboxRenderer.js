class CheckboxRenderer {
    constructor(props) {
        const divTag = document.createElement('div');
        divTag.classList.add('check_box');
        const checkbox = document.createElement('input');
        checkbox.name = 'check_user';
        checkbox.type = 'checkbox';
        const label = document.createElement('label');
        label.classList.add('p116');
        divTag.appendChild(checkbox);
        divTag.appendChild(label);
        this.el = divTag;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {grid, rowKey} = props;
        const input = this.el.querySelector('input');
        const label = this.el.querySelector('label');
        input.id = `row${rowKey + 1}`;
        label.htmlFor = input.id;
        label.addEventListener('click', (ev) => clickLabel(ev, props, input));
    }
}

function clickLabel(element, props, input) {
    const {grid, rowKey} = props;
    element.preventDefault();
    if (grid.getRow(rowKey)._attributes.checked === true) {
        grid.uncheck(rowKey);
        input.checked = false;
    } else {
        grid.check(rowKey);
        input.checked = true;
    }
}