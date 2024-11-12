tui.Grid.setLanguage('ko', {
    display: {
        noData: '데이터가 존재하지 않습니다.',
        loadingData: '데이터를 불러오는 중입니다.',
        resizeHandleGuide: '마우스 드래그하여 컬럼 너비를 조정할 수 있고, 더블 클릭으로 컬럼 너비를 초기화할 수 있습니다.',
    },
    net: {
        confirmCreate: '{{count}}건의 데이터를 생성하겠습니까?',
        confirmUpdate: '{{count}}건의 데이터를 수정하겠습니까?',
        confirmDelete: '{{count}}건의 데이터를 삭제하겠습니까?',
        confirmModify: '{{count}}건의 데이터를 처리하겠습니까?',
        noDataToCreate: '생성할 데이터가 없습니다.',
        noDataToUpdate: '수정할 데이터가 없습니다.',
        noDataToDelete: '삭제할 데이터가 없습니다.',
        noDataToModify: '처리할 데이터가 없습니다.',
        failResponse: '데이터 요청 중에 에러가 발생하였습니다.\n다시 시도하여 주시기 바랍니다.',
    },
    filter: {
        contains: 'Contains',
        eq: 'Equals',
        ne: 'Not equals',
        start: 'Starts with',
        end: 'Ends with',
        after: 'After',
        afterEq: 'After or Equal',
        before: 'Before',
        beforeEq: 'Before or Equal',
        apply: 'Apply',
        clear: 'Clear',
        selectAll: 'Select All',
        emptyValue: 'Empty Value',
    },
    contextMenu: {
        copy: '복사',
        copyColumns: '열 복사',
        copyRows: '행 복사',
        export: '내보내기',
        csvExport: 'CSV로 내보내기',
        excelExport: '엑셀로 내보내기',
    },
});

class GridBuilder {
    constructor(el, dataSource, columns) {
        this.el = el;
        this.dataSource = dataSource;
        this.columns = columns;
        this.rowHeaders = [];
        this.pageOptins = {};
        this.draggable = false;
        this.heightResizable = false;
        this.minBodyHeight = 300;
        this.width = 'auto';
        this.columnOptions = {
            resizable: false
        }
        this.treeColumnOptions = {};
    }


    setPageOptions(perPage) {
        const pageOptions = {
            perPage: perPage
        }
        this.pageOptions = pageOptions;
        return this;
    }

    setRowHeaders(rowHeaders) {
        this.rowHeaders = rowHeaders;
        return this;
    }

    setDraggable(draggable) {
        this.draggable = draggable;
        return this;
    }

    setResizable(resizable) {
        this.columnOptions.resizable = resizable;
        return this;
    }

    setWidth(width) {
        this.width = width;
        return this;
    }

    setMinBodyHeight(minBodyHeight) {
        this.minBodyHeight = minBodyHeight;
        return this;
    }

    setTreeColumnOptions(treeColumnOptions) {
        this.treeColumnOptions = treeColumnOptions;
        return this;
    }

    setHeightResizable(heightResizable) {
        this.heightResizable = heightResizable;
        return this;
    }

    build() {
        return new tui.Grid({
            el: this.el,
            data: this.dataSource,
            scrollX: false,
            scrollY: false,
            minBodyHeight: this.minBodyHeight,
            rowHeaders: this.rowHeaders,
            pageOptions: this.pageOptions,
            columns: this.columns,
            draggable: this.draggable,
            columnOptions: this.columnOptions,
            treeColumnOptions: this.treeColumnOptions,
            heightResizable: this.heightResizable
        });
    }

    setTheme() {
        tui.Grid.applyTheme('default', {
            cell: {
                normal: {
                    background: '#fbfbfb',
                    border: '#ccc',
                    showVerticalBorder: true
                },
                header: {
                    background: '#eee',
                    border: '#ccc',
                    showVerticalBorder: true
                },
                rowHeader: {
                    border: '#ccc',
                    showVerticalBorder: true
                },
                editable: {
                    background: '#fbfbfb'
                }
            }
        });
        return this;
    }


}