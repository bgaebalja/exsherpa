function initPagination(grid, perPage = null) {
    const pagination = grid.getPagination();
    if (perPage !== null) {
        pagination.setItemsPerPage(parseInt(perPage));
    } else {
        pagination.setItemsPerPage(grid.getPerPage());
    }
    pagination.reset();
}

function convertFormToCamel(element) {
    const formData = new FormData(element);
    let params = {};
    formData.forEach(function (value, key) {
        params[convertSnakeToCamel(key)] = value;
    });
    return params;
}

const convertSnakeToCamel = (s) => {
    return s.replace(/([-_][a-z])/ig, ($1) => {
        return $1.toUpperCase()
            .replace('-', '')
            .replace('_', '');
    });
};

function getSecondaryCodeList(primaryCode) {
    let result = {};

}