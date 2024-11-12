class OrderRenderer {
    constructor(props) {
        const span = document.createElement('span');
        this.el = span;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {grid, rowKey, value} = props;
        // const currentOrder = grid.getIndexOfRow(rowKey) + 1;
        // this.el.innerText = currentOrder;
        this.el.innerText = value;
    }
}