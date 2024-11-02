class Line {
    constructor(props) {
        this.isComplete = false;
        this.el = document.createElement('div');
        const {x, y} = props;
        const ratio = window.devicePixelRatio;
        this.startX = (x + window.pageXOffset) * ratio;
        this.startY = (y + window.pageYOffset) * ratio;
        document.body.appendChild(this.el);
        this.render(props);
    }

    render(props) {
        if (this.isComplete === false) {
            const {x, y} = props;
            const ratio = window.devicePixelRatio;
            const currentX = (x + window.pageXOffset) * ratio;
            const currentY = (y + window.pageYOffset) * ratio;
            this.updateLine(this.startX, this.startY, currentX, currentY);
        }
    }

    finish(props) {
        this.render(props);
        this.isComplete = true;
    }

    updateLineElement(x, y, length, angle) {
        const styles = 'border: 2px solid green; '
            + 'width: ' + length + 'px; '
            + 'height: 0px; '
            + '-moz-transform: rotate(' + angle + 'rad); '
            + '-webkit-transform: rotate(' + angle + 'rad); '
            + '-o-transform: rotate(' + angle + 'rad); '
            + '-ms-transform: rotate(' + angle + 'rad); '
            + 'position: absolute; '
            + 'top: ' + y + 'px; '
            + 'left: ' + x + 'px; '
            + 'z-index: 1;';
        this.el.setAttribute('style', styles);
    }

    updateLine(x1, y1, x2, y2) {
        const a = x1 - x2,
            b = y1 - y2,
            c = Math.sqrt(a * a + b * b);
        const sx = (x1 + x2) / 2,
            sy = (y1 + y2) / 2;
        const x = sx - c / 2,
            y = sy;
        const alpha = Math.PI - Math.atan2(-b, a);
        this.updateLineElement(x, y, c, alpha);
    }
}