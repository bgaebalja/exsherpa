const fileList = new DataTransfer();

function renderAttachment() {
    const files = fileList.files;
    let attachmentDiv = document.getElementById('attachment_div');
    const fileArray = Array.from(files);
    attachmentDiv.innerHTML = '';
    $.each(fileArray, function (fileNo) {
        let strHTML = `<div id="file_div_${fileNo}"><p class="mb05">
            <a class="attached" href="#none">${this.name}</a>
            <span class="delete"><a href="javascript:deleteFile(${fileNo});"><img src="/webapp/resources/images/resources/images/ic_delete.png" alt="삭제"></a></span>
            </p></div>`;
        attachmentDiv.innerHTML += strHTML;
    });
    document.getElementById('input_files').files = fileList.files;
}

function addFile() {
    const files = document.getElementById('input_files').files;
    const fileArray = Array.from(files);
    fileArray.forEach(file => {
        fileList.items.add(file);
    });
    renderAttachment();
}

function deleteFile(fileNo) {
    let files = fileList.files;
    let fileArray = Array.from(files);
    fileArray.splice(fileNo, 1);
    fileList.clearData();
    fileArray.forEach(file => {
        fileList.items.add(file);
    });
    renderAttachment();
}




