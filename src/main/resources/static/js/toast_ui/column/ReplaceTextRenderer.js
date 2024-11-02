class ReplaceTextRenderer {
    constructor(props) {
        const spanTag = document.createElement('span');
        this.el = spanTag;
        this.render(props);

        //문자열 잘라주기
        // ex) 010-1111-XXXX
    }

    getElement() {
        return this.el;
    }


    render(props) {
        const {value} = props;
        const {text, num} = props.columnInfo.renderer.options;

        let params1 = value.toString().substring(0, num);
        let params2 = params1 + text;

        this.el.innerHTML = params2 === undefined ? value : params2;

    }

}