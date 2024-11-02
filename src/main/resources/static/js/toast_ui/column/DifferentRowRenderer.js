class DifferentRowRenderer {
    constructor(props) {
        this.el = document.createElement('span');
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {value, rowKey, grid} = props;
        const {asOf, basicRow, specifiedRow} = props.columnInfo.renderer.options;
        const {columnName, useFunction} = asOf;
        if (!useFunction(grid.getValue(rowKey, columnName))) {
            this.el.appendChild(renderRow(grid, rowKey, value, basicRow));
        } else {
            this.el.appendChild(renderRow(grid, rowKey, value, specifiedRow));
        }
    }
}

function renderRow(grid, rowKey, value, rowOptions) {
    const {type, className, innerTag, hyperLink} = rowOptions;
    const elTag = document.createElement(type);
    if (className !== undefined) {
        className.split(' ').forEach((classNameUnit) => {
            elTag.classList.add(classNameUnit);
        });
    }
    if (innerTag !== undefined) {
        elTag.innerHTML = innerTag;
    } else {
        elTag.innerHTML = value;
    }
    if (hyperLink !== undefined) {
        const queryParams = new URLSearchParams();
        const {url, params} = hyperLink;
        if (params !== undefined) {
            for (const key in params) {
                queryParams.set(key, grid.getRow(rowKey)[params[key]]);
            }
        }
        elTag.href = `${url}${queryParams.toString() === "" ? "" : "?" + queryParams.toString()}`;
    }
    return elTag;
}