// 회원가입 유효성 검사
// 각 유효성 검사 결과를 저장할 객체
const checkObj = {
	"id": false,
	"pwd1": false,
	"pwd2": false,

};


// 아이디가 입력될 때 마다 유효성 검사
// 조건 : 영어, 숫자 6~12글자

$("#id").on("input", function() {

	// 아이디가 입력되는 경우 hidden 타입 태그의 값을 false로 변경 -> 팝업창 검사 
	// $("#idDup").val(false);

	// 정규표현식 객체 생성
	const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
	// ^ 시작 $ 끝
	// 숫자 0-9 또는 /d

	// 입력된 id(양쪽 공백 제거)를 얻어와  inputId변수에 저장
	const inputId = $("#id").val().trim();

	// 입력된 아이디가 정규식에 일치하는 경우 == 유효한 값인 경우
	if (regExp.test(inputId)) {
		//$("#checkId").text("유효한 아이디 입니다.").css("color", "green");
		//checkObj.id = true;

		// Ajax를 이용하여 비동기적으로 아이디 중복 검사를 진행

		//jQuery를 이용한 Ajax
		//$.ajax({url : "주소", 선택속성});
		$.ajax({
			url: "idDupCheck", // 요청 주소(필수로 작성!)
			data: { "id": inputId }, // 전달하려는 값 (파라미터)
			type: "post", // 데이터 전달 방식 

			success: function(result) {
				// 매개변수 result : 서버에서 비동기로 전달 받은 응답 데이터

				console.log(result);

				if (result > 0) { // id가 중복되는 경우 

					$("#checkId").text("이미 사용중인 이메일 입니다.").css("color", "red");
					checkObj.id = false;

				} else { // id가 중복되지 않는 경우

					$("#checkId").text("사용가능한 이메일 입니다.").css("color", "green");
					checkObj.id = true;
				}

			}, // 비동기 통신 성공 시 동작
			error: function(e) {

				console.log("ajax 통신 실패");
				console.log(e);

			} // 비동기 통신 실패 시 동작

		});

	} else { // 유효하지 않을 경우
		$("#checkId").text("올바른 이메일 형식을 입력하세요. 이메일은 @가 포함되어있어야 합니다.").css("color", "red");
		checkObj.id = false;
	}

});


// 비밀번호 유효성 검사
// 조건 : 영어, 숫자, 특수문자(#, -, _) 6~20글자
$("#pwd1").on("input", function() {
	const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;

	const inputPwd1 = $(this).val().trim();

	if (regExp.test(inputPwd1)) {
		$("#checkPwd1").text("유효한 비밀번호 입니다.").css("color", "green");
		checkObj.pwd1 = true;
	} else {
		$("#checkPwd1").text("비밀번호는 영어, 숫자, 특수문자 포함 6~20자리로 입력하세요.").css("color", "red");
		checkObj.pwd1 = false;
	}
});



// 비밀번호, 비밀번호 확인 일치 여부 판단
$("#pwd1, #pwd2").on("input", function() {

	const pwd1 = $("#pwd1").val();

	const pwd2 = $("#pwd2").val();

	if (pwd1.trim() == "" && pwd2.trim() == "") { // 둘다 비어있을 때

		$("#checkPwd2").html("&nbsp;");
		$("#checkPwd1").html("&nbsp;");

		checkObj.pwd2 = false;

	} else if (pwd1 == pwd2) {

		$("#checkPwd2").text("비밀번호 일치").css("color", "green");
		checkObj.pwd2 = true;

	} else {

		$("#checkPwd2").text("비밀번호 불일치").css("color", "red");
		checkObj.pwd2 = false;

	}
});





// 회원가입 버튼 클릭 시 전체 유효성 검사 여부 확인
// 자바스크립트
function validate() {

	// 아이디 중복 검사를 진행했는지 확인
	// * input 태그 값을 모두 String으로 반환됨
	// if ($("#idDup").val() != "true") { // 중복검사를 안한 경우
	//     swal("아이디 중복검사를 진행해 주세요").then(function () {
	//         $("#idDupCheck").focus(); // 중복 검사 버튼으로 포커스 이동
	//     });
	//     return false; // submit 이벤트 제거 
	// } 

	// checkObj에 작성된 속성들이 모두 true인지 확인

	// 객체 내 속성을 순차접근하는 반복문 : for in 구문
	for (const key in checkObj) {

		if (!checkObj[key]) { // false 값을 가진 속성이 있을 경우

			// 필수정보가 모두 입력된 경우(입력값이 전부 true일 경우)
			let msg;
			switch (key) {
				case "id":
					msg = "아이디가 유효하지 않습니다.";
					break;
				case "pwd1":
					msg = "비밀번호가 유효하지 않습니다.";
					break;
				case "pwd2":
					msg = "비밀번호가 일치하지 않습니다. ";
					break;
				

			}


			// msg에 담긴 내용을 출력
			swal(msg).then(function() {
				const selector = "#" + key;
				$(selector).focus();
				// 유효하지 않은 값을 입력한 부분으로 포커스 이동
			});
			return false; // submit이벤트 제거(회원가입 실행X)
		}
	} // for end

}


$("#btn").on("click", function() {
	$("#formFile").click();
});




