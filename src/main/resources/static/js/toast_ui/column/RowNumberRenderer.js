class RowNumberRenderer {
    constructor(props) {
        const {rowKey, grid} = props;
        const pagination = grid.getPagination();
        const spanTag = document.createElement('span');
        const rowNumber = (pagination.getCurrentPage() - 1) * pagination.getPerPage() + rowKey + 1;
        spanTag.innerText = rowNumber;
        this.el = spanTag;
        this.render(rowNumber);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        this.el.innerText = props;
    }
}