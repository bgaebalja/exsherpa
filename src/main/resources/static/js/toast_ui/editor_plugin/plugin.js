function latexPlugin() {
    const toHTMLRenderers = {
        latex(node) {
            const generator = new latexjs.HtmlGenerator({hyphenate: false});
            const {body} = latexjs.parse(node.literal, {generator}).htmlDocument();

            return [
                {type: 'openTag', tagName: 'div', outerNewLine: true},
                {type: 'html', content: body.innerHTML},
                {type: 'closeTag', tagName: 'div', outerNewLine: true}
            ];
        },
    }

    return {toHTMLRenderers}
}

function selectPlugin() {
    const toHTMLRenderers = {
        select(node) {
            const body = document.createElement('select');
            const optionArray =
                body.innerHTML = node.literal;
            console.log(node.literal);
            return [
                {type: 'openTag', tagName: 'select', outerNewLine: true},
                {type: 'html', content: body.innerHTML},
                {type: 'closeTag', tagName: 'div', outerNewLine: true}
            ];
        },
    }

    return {toHTMLRenderers}
}