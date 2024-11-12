function stringNull(str) {
    let result = '';
    if (str == null || str == undefined) {
        result = ''
    } else {
        result = str;
    }
    return result;
}

const convertSnakeToCamel = (s) => {
    return s.replace(/([-_][a-z])/ig, ($1) => {
        return $1.toUpperCase()
            .replace('-', '')
            .replace('_', '');
    });
};

function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}