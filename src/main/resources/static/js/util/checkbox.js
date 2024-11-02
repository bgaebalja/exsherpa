function allCheck(allBox, checkBoxesName = '') {
    const checkBoxes = document.getElementsByName(checkBoxesName);
    checkBoxes.forEach((checkBox) => {
        checkBox.checked = allBox.checked;
    });
}