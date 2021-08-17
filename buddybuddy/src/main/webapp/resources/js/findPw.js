// 회원가입 유효성 검사
// 각 유효성 검사 결과를 저장할 객체
const checkObj = {
	"pwd3": false,
	"pwd4": false

};


// 새비밀번호, 새비밀번호 확인 일치 여부 판단
$("#newPwd1, #newPwd2").on("input", function() {

	const pwd3 = $("#newPwd1").val();

	const pwd4 = $("#newPwd2").val();

	if (pwd3.trim() == "" && pwd4.trim() == "") { // 둘다 비어있을 때
		$("#checkPwd4").html("&nbsp;");
		$("#checkPwd3").html("&nbsp;");
		checkObj.pwd4 = false;
	} else if (pwd3 == pwd4) {
		$("#checkPwd4").text("비밀번호 일치").css("color", "green");
		checkObj.pwd4 = true;
	} else {
		$("#checkPwd4").text("비밀번호 불일치").css("color", "red");
		checkObj.pwd4 = false;
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
				case "pwd3":
					msg = "비밀번호가 일치하지 않습니다. ";
					break;
				case "pwd4":
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




