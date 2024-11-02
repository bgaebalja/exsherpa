class DateRenderer {
    constructor(props) {
        const {value} = props;

        const dateSpan = document.createElement('span');

        const date = new Date(value);

        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);

        dateSpan.innerText = year + '-' + month + '-' + day;

        if (value !== null) {
            this.el = dateSpan;
        } else {
            dateSpan.innerText = '';
            this.el = dateSpan
        }

        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {

    }
}