class ActiveYnRenderer {
    constructor(props) {

        const {rowKey, value} = props;

        const el = document.createElement('span');

        let tag = "";

        if (value == 'Y') {
            el.classList.add('btn_use_toggle');
            tag += `<input type="checkbox" class="cb_value" />
                    <span class="btn_round"></span>                                                
                    <span class="text_use">사용</span>`;
            el.addEventListener("click", (ev) => {
                props.columnInfo.renderer.options.updateFunction(rowKey);
            });
        } else if (value == 'N') {
            el.classList.add("btn_use_toggle", "inactive");
            tag += `<input type="checkbox" class="cb_value" />
                    <span class="btn_round"></span>
                    <span class="text_use off">미사용</span>`;
            el.addEventListener("click", (ev) => {
                props.columnInfo.renderer.options.updateFunction(rowKey);
            });
        } else {
            tag = `<a class="btn btn_gray ml08">저장</a>`;
            el.addEventListener("click", (ev) => {
                props.columnInfo.renderer.options.createFunction(rowKey);
            });
        }

        el.innerHTML += tag;

        this.el = el;
        this.render(props)
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {rowKey, value} = props;
        const textUse = this.el.getElementsByClassName('text_use')[0];
        if (value === 'N') {
            this.el.classList.add("inactive");
            textUse.innerText = '미사용';
            textUse.classList.add("off");
        } else if (value === 'Y') {
            this.el.classList.remove("inactive");
            textUse.innerText = '사용';
            textUse.classList.remove("off");
        } else {
            this.el.innerHTML = `<a class="btn btn_gray ml08">저장</a>`;
        }

    }
}