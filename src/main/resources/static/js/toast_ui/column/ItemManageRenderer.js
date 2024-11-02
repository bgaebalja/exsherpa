class ItemManageRenderer {
    constructor(props) {
        this.el = document.createElement('span');

        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
        const {grid, rowKey} = props;
        this.el.innerHTML = '';
        const manageButton = document.createElement('a');
        manageButton.className = 'btn btn_gray ml05 w120';
        manageButton.innerText = '편집하기'
        manageButton.addEventListener('click', function () {
            openPopupEditItem(grid, rowKey)
        });
        this.el.appendChild(manageButton);
        // const resetButton = document.createElement('a');
        // resetButton.className = 'btn btn_gray ml05 w80';
        // resetButton.innerText = '초기화'
        // resetButton.addEventListener('click',function (){
        //    initItem(grid,rowKey);
        // });
        // this.el.appendChild(resetButton);
    }
}

function openPopupEditItem(grid, rowKey) {
    const itemId = grid.getValue(rowKey, 'itemId');
    window.location.href = '/naea-service/item/item-update?item_id=' + itemId;
}

function initItem(grid, rowKey) {
    fetch('/naea-service/item/item-init', {
        method: 'PUT',
        cache: "no-cache",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(grid.getRow(rowKey))
    }).then(response => {
        return response.json();
    }).then(data => {
        if (data.result === true) {
            grid.readData(1);
        } else {
            console.log(data.message);
        }
    });
}