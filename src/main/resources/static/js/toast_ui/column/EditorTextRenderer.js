class EditorTextRenderer {
    constructor(props) {
        const {grid, rowKey, value} = props;
        const {keyData} = props.columnInfo.editor.options;
        const el = document.createElement('input');
        const gridData = grid.getRow(rowKey);

        el.type = 'text';
        el.disabled = true;
        if (props.value !== null) {
            el.value = String(props.value);
        }

        if (gridData[keyData] === null || gridData[keyData] === '') {
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