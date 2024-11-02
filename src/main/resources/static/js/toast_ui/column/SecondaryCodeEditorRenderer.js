class SecondaryCodeEditorRenderer {
    constructor(props) {

        const {grid, rowKey, value} = props;
        const el = document.createElement('input');
        el.type = 'text';
        el.value = String(value);

        el.disabled = true;

        if (grid.getRow(rowKey).activeYn === null) {
            el.disabled = false;
        }

        this.el = el;
    }

    getElement() {
        return this.el;
    }

    getValue() {
        return this.el.value;
    }

    mounted() {
        this.el.select();
    }

}