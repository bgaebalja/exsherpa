class ImageRenderer {
    constructor(props) {
        const el = document.createElement('img');
        el.src = '';

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {

        // you can change the image link as changes the `value`

        const {value} = props;
        const {src} = props.columnInfo.renderer.options;
        this.el.src = src[value];

        /*
            renderer 에서 다음과 같이 사용

          options: {
            src: {'02': '../../images/ic_mp3.png', '04': '../../images/ic_mp4.png'}
          }
        */

    }


}