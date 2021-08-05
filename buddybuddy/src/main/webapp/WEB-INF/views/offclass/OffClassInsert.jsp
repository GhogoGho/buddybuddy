<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="summer/summernote-ko-KR.js"></script>
    <script src="summer/summernote-lite.js"></script>
    <link rel="stylesheet" href="summer/summernote-lite.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>


        div {
            box-sizing: border-box;
        }

        th {
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border: 2px;
            border-color: #3333FF;
            border-radius: 8px;
            /*모서리 둥글게*/
        }

        .modal-backdrop {
            position: fixed;
            z-index: 0;
        }

        .pagination {
            margin: 20px 0;
            border-radius: 4px;
        }

        .filef {
            float: right;
            font-size: 25px;
            height: 30px;
            line-height: 0px;
        }

        .filem {
            float: right;
            font-size: 25px;
            margin-left: 10px;
            width: 33.53px;
        }

        .main-btn-color {
            background-color: #50b8b3;
        }

        td {
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border: 2px;
            border-color: #3333FF;
            border-radius: 8px;
            /*모서리 둥글게*/
        }
    </style>

    <script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
            // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar(); //달력 cell 만들어 출력 
        }

        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();//달력 cell 만들어 출력
        }

        var currentYear;
        var currentMonth;

        function buildCalendar() {//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";


            currentYear = today.getFullYear();
            currentMonth = today.getMonth() + 1;


            /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
                //열을 지워줌
                //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
                //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
            }
            var row = null;
            row = tbCalendar.insertRow();
            //테이블에 새로운 열 삽입//즉, 초기화
            var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
            for (i = 0; i < doMonth.getDay(); i++) {
                /*이번달의 day만큼 돌림*/
                cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            }
            /*달력 출력*/
            for (i = 1; i <= lastDate.getDate(); i++) {
                //1일부터 마지막 일까지 돌림
                cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                if (cnt % 7 == 1) {/*일요일 계산*/
                    //1주일이 7일 이므로 일요일 구하기
                    //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                    cell.innerHTML = "<font color=#F79DC2>" + i
                    //1번째의 cell에만 색칠
                }
                if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
                    //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                    cell.innerHTML = "<font color=skyblue>" + i
                    //7번째의 cell에만 색칠
                    row = calendar.insertRow();
                    //토요일 다음에 올 셀을 추가
                }
                /*오늘의 날짜에 노란색 칠하기*/
                if (today.getFullYear() == date.getFullYear()
                    && today.getMonth() == date.getMonth()
                    && i == date.getDate()) {
                    //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                    cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
                }
            }
        }
    </script>
</head>

<body>
  

    <!-- 컨테이너 입력 부분 -->
    <form action="">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1><b>오프라인 클래스 작성</b></h1>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label style="font-size: 25px;">카테고리 : </label>
                    <select style="font-size: 20px;">
                        <option selected>공예</option>
                        <option value="1">요리</option>
                        <option value="2">미술</option>
                        <option value="3">플라워</option>
                    </select>
                </div>
                <div class="col-md-12 mb-3">
                    <label style="font-size: 25px;">제목 : </label>
                    <input type="text" class="form-control" style="width: 90%; display: inline-block;">
                </div>
                <div class="col-md-12 mb-3">
                    <label style="font-size: 25px;">썸네일 : </label>
                    <input type="file" style="display: inline-block;" accept="images/*">
                </div>
                <div class="col-md-12  mb-3">
                    <label style="font-size: 25px;">예약가능 날짜 : </label>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary main-btn-color" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                        예약하기
                    </button>

                    <!-- Modal -->
                    <div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content ">
                                <div class="row">

                                    <div class="col-md-6">
                                        <p></p>

                                        <table id="calendar" border="3" style="text-align: center"
                                            style="border-color:#3333FF;margin: auto; ">
                                            <tr>
                                                <!-- label은 마우스로 클릭을 편하게 해줌 -->
                                                <th><label onclick="prevCalendar()">
                                                        &lt; </label>
                                                </th>
                                                <th align="center" id="tbCalendarYM" colspan="5">
                                                    yyyy년 m월</th>
                                                <th><label onclick="nextCalendar()">>

                                                    </label></th>
                                            </tr>
                                            <tr>
                                                <th align="center">
                                                    <label style='color="#F79DC2"'>일</label>
                                                </th>
                                                <th align="center">월</th>
                                                <th align="center">화</th>
                                                <th align="center">수</th>
                                                <th align="center">목</th>
                                                <th align="center">금</th>
                                                <th align="center">
                                                    <label style='color="skyblue"'>토</label>
                                                </th>
                                            </tr>
                                        </table>
                                        <script type="text/javascript">

                                            buildCalendar();//
                                        </script>

                                    </div>

                                    <div id="time" class="col-md-6">

                                        <div class="col-md-12"
                                            style="border: 1px solid black;margin-top: 10px; text-align: left;">
                                            <div>
                                                <input type="time" name="startTi" id="startTime" style="width: 150px;">
                                                ~
                                                <input type="time" name="endTi" class="endTime" style="width: 150px;">
                                                <br>
                                                <label id="inonesu">인원수</label> : <input type="text"><br>
                                                <button>저장</button><br>
                                                <div style="text-align: right;">
                                                    <button style="margin-right: 0px;" onclick="calAdd()">+</button>
                                                </div>
                                            </div>

                                        </div>




                                        <!-- <div class="col-md-12" style="border: 1px solid black; text-align: left;" >
                                        <h4 style="margin-bottom: 20px;">가격</h4>
                                    </div> -->

                                    </div>
                                    <script>
                                        function calAdd() {
                                            var fd = document.createElement("div");
                                            var sd = document.createElement("div");
                                            var td = document.createElement("div");
                                            var x = document.createElement("br");
                                            var x1 = document.createElement("br");
                                            fd.setAttribute("class", "col-md-12");
                                            fd.setAttribute("style", "border: 1px solid black; margind-top 10px;text-align:left;");
                                            td.setAttribute("style", "text-align:right;");
                                            var tbt = document.createElement("button");
                                            var tbtm = document.createElement("button");
                                            var tbts = document.createElement("button");
                                            tbt.innerHTML = "+";
                                            tbtm.innerHTML = "-";
                                            tbts.innerHTML = "저장";
                                            tbt.setAttribute("style", "margin-right: 0px;");
                                            tbt.setAttribute("onclick", "calAdd()");
                                            tbtm.setAttribute("style", "margin-right: 0px;");
                                            tbtm.setAttribute("class", "tbtmm");
                                            tbtm.setAttribute("conclick", "calel(this)");
                                            td.appendChild(tbt);
                                            td.appendChild(tbtm);
                                            var input1 = document.createElement("input");
                                            var input2 = document.createElement("input");
                                            var input3 = document.createElement("input");
                                            var tlabel = document.createElement("label");
                                            tlabel.innerHTML = "인원수 :";
                                            input1.setAttribute("type", "time");
                                            input1.setAttribute("name", "startTi");
                                            input1.setAttribute("id", "startTime");
                                            input1.setAttribute("style", "width:150px");
                                            input2.setAttribute("type", "time");
                                            input2.setAttribute("name", "endTi");
                                            input2.setAttribute("class", "endTime");
                                            input2.setAttribute("style", "width:150px");
                                            input3.setAttribute("type", "text");
                                            input3.setAttribute("name", "inone");
                                            sd.appendChild(input1);
                                            sd.appendChild(input2);
                                            sd.appendChild(x);
                                            sd.appendChild(tlabel);
                                            sd.appendChild(input3);
                                            sd.appendChild(x1);
                                            sd.appendChild(tbts);
                                            sd.appendChild(td);
                                            fd.appendChild(sd);


                                            document.getElementById("time").appendChild(fd);
                                        }

                                        $(document).on("click",".tbtmm",function(){
                                            $(this).parent().parent().parent().remove();
                                        })
                                

                                        $(document).on("click", ".endTime", function () {
                                            let minTime = $(this).prev().val();

                                            $(this).attr("min", minTime);
                                            if ($(this).prev().val() == "") {
                                                swal({
                                                    "icon": "error",
                                                    "title": "시작시간부터 입력해주세요"
                                                });
                                            }
                                            if ($(this).prev().val() < $(this).val()) {
                                                swal({
                                                    "icon": "error",
                                                    "title": "시작시간보다 최소 30분 초과로 입력해주세요"
                                                });
                                            }

                                        });
                                        $(".endTime").on("input", function () {
                                            let minTime = $(this).prev().val();

                                            $(this).attr("min", minTime);

                                            if ($(this).prev().val() + 30 > $(this).val()) {
                                                swal({
                                                    "icon": "error",
                                                    "title": "시작시간보다 최소 30분 크게 입력해주세요"
                                                });
                                                $(this).val("");
                                            }

                                        });
                                    </script>




                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary main-btn-color"
                                        data-bs-dismiss="modal">취소</button>
                                    <button id="eee" type="button" class="btn btn-primary main-btn-color">예약</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 mb-3">
                    <textarea class="summernote" name="editordata"></textarea>
                    <script>
                        $('.summernote').summernote({
                            height: 450,
                            lang: "ko-KR",
                            toolbar: [
                                // [groupName, [list of button]]
                                ['fontname', ['fontname']],
                                ['fontsize', ['fontsize']],
                                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                                ['color', ['forecolor', 'color']],
                                ['table', ['table']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['height', ['height']],
                                ['insert', ['picture', 'link', 'video']],
                                ['view', ['fullscreen', 'help']]
                            ],
                            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
                        });
                    </script>

                </div>

                <div class="col-md-3">
                    <label style="font-size: 25px;">클래스 소개 이미지</label><br>
                    <label style="font-size: 25px;">(최대 8개)</label><br>
                </div>
                <div id="imgff" class="col-md-9">
                    <div>
                        <input type="file" name="offimg" accept="image/*" class="mb-3"
                            style="padding: 0;display: inline;"><button class="filef" onclick="add()">+</button><br>
                    </div>

                    <script>
                        let count = 0;
                        function add() {
                            if (count < 7) {
                                var p = document.createElement("div");
                                p.setAttribute("style", "width:100%");
                                var addvalue = document.getElementById("imgff");
                                var ip = document.createElement("input");
                                var btnf = document.createElement("button");
                                var btnm = document.createElement("button");
                                btnf.innerHTML = "+";
                                btnm.innerHTML = "-";
                                ip.setAttribute("type", "file");
                                ip.setAttribute("name", "offimg");
                                ip.setAttribute("accept", "image/*");
                                ip.setAttribute("class", "mb-3");
                                ip.setAttribute("style", "padding: 0;display: inline;");
                                btnm.setAttribute("class", "btnm")
                                btnm.setAttribute("style", " float: right; font-size: 25px; margin-left: 10px; width: 34px; height : 30px;line-height: 0px;");

                                btnm.setAttribute("onclick", "deleteImage(this)")
                                btnf.setAttribute("class", "btnf");
                                btnf.setAttribute("style", "float: right; font-size: 25px; height : 30px;line-height: 0px;");
                                btnf.setAttribute("onclick", "add()");
                                p.appendChild(ip);
                                p.appendChild(btnm);
                                p.appendChild(btnf);

                                document.getElementById("imgff").appendChild(p);
                                count++;
                            }
                        }

                        function deleteImage(el) {
                            el.parentElement.remove();
                            count--;
                        }

                    </script>

                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-primary" type="reset"
                        style="float: right;margin-left: 25px; font-size: 25px;">취소</button>
                    <button class="btn btn-primary" style="float: right; font-size: 25px;">작성</button>
                </div>
            </div>
        </div>
    </form>



<jsp:include page="../common/footer.jsp"></jsp:include>
    <script>
        $(".btn-fullscreen").remove();
    </script>
    <script>
        $(document).on("click", "tbody td", function () {
            const thisDate = currentYear + "-" + currentMonth + "-" + $(this).text()

            console.log(thisDate);

            $("td").css("backgroundColor", "white");
            $(this).css("backgroundColor", "red");

        });


    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
         crossorigin="anonymous"></script>

</body>

</html>