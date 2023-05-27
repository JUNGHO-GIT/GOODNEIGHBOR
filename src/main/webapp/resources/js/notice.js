// 1. noticeCheck() ------------------------------------------------------------------------------->
function noticeCheck() {
	if ($("#title").val() == "") {
		alert("글제목을 입력하세요");
		$("#title").focus();
		return false;
	}
	if ($("#content").val() == "") {
		alert("글내용을 입력하세요");
		$("#content").focus();
		return false;
	}
	if ($("#pw").val() == "") {
		alert("pw를 입력하세요");
		$("#pw").focus();
		return false;
	}
	if ($("#writer").val() == "") {
		alert("글쓴이를 입력하세요");
		$("#writer").focus();
		return false;
	}
	return true;
}

// 2. noticeSearchCheck() ------------------------------------------------------------------------->
function noticeSearchCheck() {
	if (!document.searchForm.keyWord.value) {
		alert("검색어를 입력하세요");
		document.searchForm.keyWord.focus();
		return false;
	}
	document.searchForm.submit();
}

// 4. insertNoticeCheck() ------------------------------------------------------------------------->
const insertNoticeCheck = async () => {
  const notice_writer = document.getElementById("admin_id").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (notice_writer == "" || notice_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    window.location.href = `/${ctxPath}/notice/insertForm.do`;
    return true;
  }
}

// 4. updateNoticeCheck() ------------------------------------------------------------------------->
const updateNoticeCheck = async () => {
  const notice_number = document.getElementById("notice_number").value;
  const notice_writer = document.getElementById("admin_id").value;
  const pageNum = document.getElementById("pageNum").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (notice_writer == "" || notice_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    const response = await fetch(`/${ctxPath}/notice/updateCheck.do`, {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `notice_number=${notice_number}&notice_writer=${notice_writer}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("작성자가 아닙니다.");
        return false;
      }
      else if (text == 1) {
        window.location.href = `/${ctxPath}/notice/updateForm.do?notice_number=${notice_number}&pageNum=${pageNum}`;
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

// 5. deleteNoticeCheck() ------------------------------------------------------------------------->
const deleteNoticeCheck = async () => {
  const notice_number = document.getElementById("notice_number").value;
  const notice_pw = prompt("글을 삭제하시려면 암호를 입력하세요");

  if (notice_pw == "" || notice_pw == null) {
    alert("암호가 입력되지 않았습니다.");
    return false;
  }
  else {
    const response = await fetch('deleteCheck.do', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `notice_pw=${notice_pw}&notice_number=${notice_number}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("암호가 일치하지 않습니다.");
        return false;
      }
      else if (text == 1) {
        alert("글이 삭제되었습니다.");
        window.location.href = `deletePro.do?notice_number=${notice_number}&notice_pw=${notice_pw}`;
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