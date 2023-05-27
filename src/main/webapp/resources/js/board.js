// 0. searchBoardCheck() -------------------------------------------------------------------------->
function searchBoardCheck() {
	if (!document.searchForm.keyWord.value) {
		alert("검색어를 입력하세요");
		document.searchForm.keyWord.focus();
		return false;
	}
	document.searchForm.submit();
}

// 1. boardCheck() -------------------------------------------------------------------------------->
function boardCheck() {
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

// 4. updateCheck() ------------------------------------------------------------------------------->
const updateCheck = async () => {
  const board_number = document.getElementById("board_number").value;
  const board_writer = document.getElementById("member_id").value;
  const pageNum = document.getElementById("pageNum").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (board_writer == "" || board_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    const response = await fetch(`/${ctxPath}/board/updateCheck.do`, {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `board_number=${board_number}&board_writer=${board_writer}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("작성자가 아닙니다.");
        return false;
      }
      else if (text == 1) {
        window.location.href = `/${ctxPath}/board/updateForm.do?board_number=${board_number}&pageNum=${pageNum}`;
        return true;
      }
      else {
        alert("오류발생 :" + response.status);
        return false;
      }
    }
    else {
      alert("오류발생 :" + response.status);
      return false;
    }
  }
}

// 5. deleteCheck() ------------------------------------------------------------------------------->
const deleteCheck = async () => {
  const board_number = document.getElementById("board_number").value;
  const board_pw = prompt("글을 삭제하시려면 암호를 입력하세요");

  if (board_pw == "" || board_pw == null) {
    alert("암호가 입력되지 않았습니다.");
    return false;
  }
  else {
    const response = await fetch('deleteCheck.do', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `board_pw=${board_pw}&board_number=${board_number}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("암호가 일치하지 않습니다.");
        return false;
      }
      else if (text == 1) {
        alert("글이 삭제되었습니다.");
        window.location.href = `deletePro.do?board_number=${board_number}&board_pw=${board_pw}`;
        return true;
      }
      else {
        alert("오류발생 :" + response.status);
        return false;
      }
    }
    else {
      alert("오류발생 :" + response.status);
      return false;
    }
  }
}




