class NoticeTitleRenderer {
    constructor(props) {
        const {value, rowKey, grid} = props;
        const {url, params} = props.columnInfo.renderer.options;
        const row = grid.getRow(rowKey);
        const queryParams = new URLSearchParams();
        for (const key in params) {
            queryParams.set(key, row[params[key]]);
        }
        const hyperLinkTag = document.createElement('a');
        hyperLinkTag.setAttribute('href', url + '?' + queryParams.toString());
        hyperLinkTag.innerHTML = `&nbsp;&nbsp;${value}`;
        if (row['attachmentYn'] === 'Y') {
            hyperLinkTag.innerHTML += `<img src="/webapp/resources/images/resources/images/ic_attachments.png" alt="attachment"></img>`;
        }
        this.el = hyperLinkTag;
        this.render(value);
    }

    getElement() {
        return this.el;
    }

    render(props) {

    }

}