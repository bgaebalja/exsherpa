<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>학업성취도 평가 관리자</title>
    <link rel="icon" href="/img/fav.png">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/common.css"/>
    <link rel="stylesheet" href="/css/toast_ui/tui-grid.css"/>
    <link rel="stylesheet" href="/css/toast_ui/tui-pagination.css"/>
    <link rel="stylesheet" type="text/css" href="/css/custom/custom.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css"/>
    <link rel="stylesheet"
          href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css"/>

    <script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../js/admin.js"></script>
    <script type="text/javascript" src="../../js/swiper.min.js"></script>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://danml.com/js/download.js"></script>
    <script src="/js/common.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
    <script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
            integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript" src="/js/util/checkbox.js"></script>
    <script type="text/javascript" src="/js/toast_ui/tui-code-snippet.js"></script>
    <script type="text/javascript" src="/js/toast_ui/tui-pagination.js"></script>
    <script type="text/javascript" src="/js/toast_ui/tui-grid.js"></script>
    <script type="text/javascript" src="/js/toast_ui/builder/GridBuilder.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/RowHeaderCheckboxRenderer.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/DateRenderer.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/RowNumberRenderer.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/HyperLinkRenderer.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/ExamDetailRenderer.js"></script>
    <script type="text/javascript" src="/js/toast_ui/column/CustomCodeMatchRenderer.js"></script>


</head>
<style>
    #grid table td a {
        display: inline-block;
        padding: 5px 15px;
        background-color: #ddd;
        margin-left: 5px;
    }
</style>
<body>
<div class="wrap">
    <div class="list-wrap">
        <ul class="list-tab">
            <li class="active">
                <a href="/naea-service/exam/exam-list" id="tmenu1">시험지 관리</a>
            </li>
            <li>
                <a href="/student/student-list" id="tmenu2">응시자 관리</a>
            </li>
        </ul>
        <!-- s: 시험지 관리 -->
        <form class="list-cnt on" id="tab_cont1" onsubmit="return false">
            <div class="type search_box_wrap">
                <div class="select">
                    <span class="txt">서비스 구분</span>
                    <select name="search_type">
                        <option value="all" selected>전체</option>
                        <option value="01">천재교육</option>
                        <option value="02">천재교과서</option>
                    </select>
                </div>
                <button type="submit" name="searchBtn" onclick="searchExam()">검색</button>
            </div>
            <div class="table-wrap">
                <div class="table-top">
            <span class="txt">
              총 <em id="total_count"></em> 개
            </span>
                    <div class="btn-wrap">
                        <a href="javascript:openPop1();" class="" data-name="pop-paper">시험지 등록</a>
                        <a href="javascript:openPop2();" class="" data-name="pop-template">템플릿 등록</a>
                        <a href="javascript:checkAll();" class="" data-name="pop-choice" id="check_all">전체 선택</a>
                        <a href="javascript:removeRow();" class="pop-open" data-name="pop-delete">삭제</a>
                    </div>
                </div>

            </div>
            <div class="tbl_scroll_box">
                <div id="grid"></div>
            </div>
        </form>
        <!-- e: 시험지 관리 -->

        <%--<!-- s: 응시자 관리 -->
        <div class="list-cnt" id="tab_cont2">
            <div class="table-wrap">
                <div class="table-top">
            <span class="txt">
              총 <span id="total_count2"></span> 개
            </span>
                    <select class="select_box" onchange="javascpript:onChangeDataPerPage(this);">
                        <option value="10" selected>10개 보기</option>
                        <option value="30">30개 보기</option>
                        <option value="50">50개 보기</option>
                        <option value="100">100개 보기</option>
                    </select>
                </div>
            </div>
            <div id="gridStudents"></div>
        </div>
        <!-- e: 응시자 관리 -->--%>


    </div>

</div>
</body>
<script>
    let ww = $(window).width();

    function openPop1() {
        var popup = window.open('/naea-service/exam/pop-exam-create', '시험지 등록', 'width=1920px,height=900px');
    }

    function openPop2() {
        var popup = window.open('/naea-service/exam/pop-template', '템플릿 등록', 'width=1900px,height=940px');
    }
</script>

<script>
    //시험지 목록 script
    function buildExamListGrid() {

        const columns =
            [
                {
                    header: '번호'
                    , name: 'rowNum'
                    , align: 'center'
                },
                {
                    header: '서비스 구분'
                    , name: 'serviceName'
                    , align: 'center'
                },
                {
                    header: '학교급'
                    , name: 'schoolLevel'
                    , align: 'center'
                    , renderer: {
                        type: CustomCodeMatchRenderer,
                        options: {
                            code: {"SL01": "초등", "SL02": "중등", "SL03": "고등"}
                        }
                    }
                },
                {
                    header: '학년'
                    , name: 'grade'
                    , align: 'center'
                    , renderer: {
                        type: CustomCodeMatchRenderer,
                        options: {
                            code: {"GR01": "6", "GR02": "3", "GR03": "2"}
                        }
                    }
                },
                {
                    header: '과목'
                    , name: 'subjectId'
                    , align: 'center'
                    , renderer: {
                        type: CustomCodeMatchRenderer,
                        options: {
                            code: {"14": "국어", "15": "영어", "16": "수학", "17": "사회", "18": "과학"}
                        }
                    }
                },
                {
                    header: '회차'
                    , name: 'examRound'
                    , align: 'center'
                },
                {
                    header: '시험지명'
                    , name: 'examName'
                    , align: 'center'
                },
                {
                    header: '문항 수'
                    , name: 'itemCnt'
                    , align: 'center'
                },
                {
                    header: '최종 수정일'
                    , name: 'updateDate'
                    , align: 'center'
                    , renderer: {
                        type: DateRenderer
                    }
                },
                {
                    header: '상세'
                    , align: 'center'
                    , renderer: ExamDetailRenderer
                }
            ];

        const dataSource = {
            contentType: 'application/json',
            api: {
                readData: {url: '/naea-service/exam/exam-get-list/', method: 'GET'},
                createData: {url: '/exam/', method: 'POST'},
                updateData: {url: '/exam/', method: 'PUT'},
                deleteData: {url: '/exam/', method: 'DELETE'}
            },
            initialRequest: true
        };

        const rowHeaders = [
            {
                type: 'checkbox',
                header: `
                  <label for="examList-checkbox" class="checkbox">
                    <input type="checkbox" id="examList-checkbox" class="hidden-input" name="_checked"/>
                    <span class="custom-input"></span>
                  </label>
                `,
                renderer: {
                    type: RowHeaderCheckboxRenderer
                }
            }/*,
            {
                type: 'rowNum',
                renderer: {
                    type: RowNumberRenderer
                }
            }*/
        ]

        return new GridBuilder(document.getElementById('grid'), dataSource, columns)
            .setRowHeaders(rowHeaders)
            .setResizable()
            .setTheme()
            .build();

    } //buildExamListGrid end

    const grid = buildExamListGrid();

    grid.on('onGridMounted', (ev) => {
        grid.readData(1);
    });

    grid.on('onGridUpdated', (ev) => {
        $('#total_count').html(grid.getPaginationTotalCount());
    });

    grid.on('onGridUpdated', (ev) => {
        document.getElementById('total_count').innerText = ev.instance.getRowCount();
    });


    ////////////////////////////////////////////////////////////////////////////////////////// grid(exam) end
    ////////////////////////////////////////////////////////////////////////////////////////// gridStudents start

    //시험지 목록 script
    /*    function buildStudentListGrid() {

            const columns =
                [
                    {
                        header: '번호'
                        , name: 'rowNum'
                        , align: 'center'
                    },
                    {
                        header: '닉네임'
                        , name: 'nickname'
                        , align: 'center'
                    },
                    {
                        header: '핸드폰번호'
                        , name: 'studentId'
                        , align: 'center'
                    },
                    {
                        header: '응시코드'
                        , name: 'certificateCode'
                        , align: 'center'
                    },
                    {
                        header: '최초인증일자'
                        , name: 'createDate'
                        , align: 'center'
                    },
                    {
                        header: '인증코드 전송'
                        , name: 'examRound'
                        , align: 'center'
                    }
                ];

            const dataSource = {
                contentType: 'application/json',
                api: {
                    readData: {url: '/student/list', method: 'GET'},
                    createData: {url: '/exam/', method: 'POST'},
                    updateData: {url: '/exam/', method: 'PUT'},
                    deleteData: {url: '/exam/', method: 'DELETE'}
                },
                initialRequest: true
            };

            const rowHeaders = [
                {
                    type: 'checkbox',
                    header: `
                      <label for="examList-checkbox" class="checkbox">
                        <input type="checkbox" id="examList-checkbox" class="hidden-input" name="_checked"/>
                        <span class="custom-input"></span>
                      </label>
                    `,
                    renderer: {
                        type: RowHeaderCheckboxRenderer
                    }
                }
            ]

            return new GridBuilder(document.getElementById('gridStudents'), dataSource, columns)
                .setRowHeaders(rowHeaders)
                .setPageOptions(10)
                .setResizable()
                .setTheme()
                .build();

        } //buildStudentListGrid end

        const gridStudents = buildStudentListGrid();

        gridStudents.refreshLayout();

        gridStudents.on('onGridMounted', (ev) => {
            grid.readData(1);
        });

        gridStudents.on('onGridUpdated', (ev) => {
            $('#total_count2').html(grid.getPaginationTotalCount());
        });

        gridStudents.on('onGridUpdated', (ev) => {
            document.getElementById('total_count2').innerText = ev.instance.getRowCount();
        });

        function onChangeDataPerPage() {
            gridStudents.setPerPage(selectedOption.value);
            initPagination(gridStudents, selectedOption.value);
        }

        function gridStudentRefresh() {
            gridStudents.readData(1);
            gridStudents.refreshLayout();
        }*/

    function checkAll() {
        let checkAllButton = document.getElementById('check_all');
        if (checkAllButton.innerText === '전체 선택') {
            checkAllButton.innerText = '전체 해제';
            grid.checkAll(false);
        } else {
            checkAllButton.innerText = '전체 선택';
            grid.uncheckAll(false);
        }
    }


    //////////////////////////////////////////////////////////////////////////////////////////

    function searchExam() {
        const formData = new FormData(document.getElementById('tab_cont1'));
        let params = {};
        formData.forEach(function (value, key) {
            params[key] = value;
        });
        grid.setRequestParams(params);
        grid.readData(1);
        initPagination(grid);

    }

    // 시험지 지우기
    function removeRow() {
        let strValue = '';

        $("input[type=checkbox]:checked").each(function (checkBox) {
            strValue += grid.getRow(this.id)['examId'] + ',';
        });

        if (strValue === '') {
            alert("시험지를 선택해주세요.");
        } else {
            if (confirm("삭제할까요? \n삭제 후에는 취소가 불가합니다.")) {
                $.ajax({
                    url: "/naea-service/exam/exam-delete?exam_id=" + strValue,
                    method: "DELETE",
                    dataType: "json",
                    success: function (data) {
                        // grid.readData(1);
                        grid.instance.request('updateData', {showConfirm: false});
                    }
                });

            }
        }
        location.reload();
    }


</script>
</html>