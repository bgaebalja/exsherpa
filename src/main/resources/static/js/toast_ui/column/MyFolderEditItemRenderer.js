class MyFolderEditItemRenderer {
    constructor(props) {
        const {grid, rowKey} = props;

        const button = document.createElement('a');
        button.className = 'btn btn_lgreen small w80';
        button.innerText = '편집'

        this.el = button;

        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {

    }
}