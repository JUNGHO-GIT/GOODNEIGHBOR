// 0. searchBoardCheck() -------------------------------------------------------------------------->
function searchBoardCheck() {
	if (!document.searchForm.keyWord.value) {
		alert("검색어를 입력하세요");
		document.searchForm.keyWord.focus();
		return false;
	}
	document.searchForm.submit();
}

// 1. boardWriteSave() ---------------------------------------------------------------------------->
function boardWriteSave() {
	if ($("#board_writer").val() == "") {
		alert("이름을 입력 하세요 ");
		$("#board_writer").focus();
		return false;
	}
	if ($("#board_title").val() == "") {
		alert("글제목을 입력 하세요 ");
		$("#board_title").focus();
		return false;
	}
	if ($("#board_content").val() == "") {
		alert("글내용을 입력 하세요 ");
		$("#board_content").focus();
		return false;
	}
	if ($("#board_pw").val() == "") {
		alert("암호을 입력 하세요 ");
		$("#board_pw").focus();
		return false;
	}
	return true;
}

// 2. pwCheck1() ---------------------------------------------------------------------------------->
function pwCheck1() {
	if ($("#board_pw").val() == "") {
		alert("암호는 필수 입력입니다.");
		$("#board_pw").focus();
		return false;
	}
}

// 3. pwCheck2() ---------------------------------------------------------------------------------->
function pwCheck2() {
	if ($("#board_pw").val() == "") {
		alert("암호를 입력 하세요");
		$("#board_pw").focus();
		return false;
	}

	if ($("#board_pw2").val() == "") {
		alert("암호를 입력 하세요");
		$("#board_pw2").focus();
		return false;
	}

	if ($("#board_pw").val() != $("#pw2").val()) {
		alert("암호와 암호확인이 다릅니다");
		$("#pw2").val("");
		$("#board_pw").val("").focus();
		return false;
	}
}


