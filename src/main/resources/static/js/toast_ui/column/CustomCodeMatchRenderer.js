class CustomCodeMatchRenderer {
    constructor(props) {
        const spanTag = document.createElement('span');
        this.el = spanTag;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {value} = props;
        const {code} = props.columnInfo.renderer.options;


        if (value !== null) {
            this.el.innerText = code[value];
        } else {
            this.el.innerText = ""
        }

    }
}