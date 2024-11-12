class HyperLinkRenderer {
    constructor(props) {
        const hyperLinkTag = document.createElement('a');
        this.el = hyperLinkTag;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {value, rowKey, grid} = props;
        const {url, params, className, text, popUp} = props.columnInfo.renderer.options;
        const queryParams = new URLSearchParams();
        for (const key in params) {
            queryParams.set(key, grid.getRow(rowKey)[params[key]]);
        }
        if (popUp !== undefined) {
            this.el.addEventListener('click', function () {
                createPopUp(`${url}?${queryParams.toString()}`, popUp);
            });
        } else {
            this.el.setAttribute('href', `${url}?${queryParams.toString()}`);

            if (url.includes('javascript')) {
                this.el.setAttribute('href', `${url}`);
            }

        }
        if (className !== undefined) {
            className.forEach(item => {
                this.el.classList.add(item);
            });
        }

        this.el.innerHTML = text === undefined ? value : text;
    }
}

function createPopUp(url, popUp) {
    const {title, size, beforeClose} = popUp;
    const popup = window.open(url, title, size);
    popup.addEventListener('beforeunload', function () {
        beforeClose();
    });
}