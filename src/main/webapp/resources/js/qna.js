// 1. qnaCheck() ---------------------------------------------------------------------------------->
function qnaCheck() {
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

// 2. qnaReplyCheck() ---------------------------------------------------------------------------->
function qnaSearchCheck() {
  if (!document.searchForm.keyWord.value) {
    alert("검색어를 입력하세요");
    document.searchForm.keyWord.focus();
    return false;
  }
  document.searchForm.submit();
}

// 4. contentQnaCheck() --------------------------------------------------------------------------->
const contentQnaCheck = async (qna_number) => {
  const pageNum = document.getElementById("pageNum").value;
  const qnaPw = prompt("암호를 입력하세요");
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (qnaPw == "" || qnaPw == null) {
    alert("암호가 입력되지 않았습니다.");
    return false;
  }
  else {
    const response = await fetch(`/${ctxPath}/qna/contentCheck.do`, {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `qna_number=${qna_number}&qna_pw=${qnaPw}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("암호가 일치하지 않습니다.");
        return false;
      }
      else if (text == 1) {
        window.location.href = `/${ctxPath}/qna/content.do?qna_number=${qna_number}&pageNum=${pageNum}`;
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

// 4. insertQnaCheck() ---------------------------------------------------------------------------->
const insertQnaCheck = async () => {
  const qna_writer = document.getElementById("member_id").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (qna_writer == "" || qna_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    window.location.href = `/${ctxPath}/qna/insertForm.do`;
    return true;
  }
}

// 4. updateQnaCheck() ---------------------------------------------------------------------------->
const updateQnaCheck = async () => {
  const qna_number = document.getElementById("qna_number").value;
  const qna_writer = document.getElementById("member_id").value;
  const pageNum = document.getElementById("pageNum").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (qna_writer == "" || qna_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    const response = await fetch(`/${ctxPath}/qna/updateCheck.do`, {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `qna_number=${qna_number}&qna_writer=${qna_writer}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("작성자가 아닙니다.");
        return false;
      }
      else if (text == 1) {
        window.location.href = `/${ctxPath}/qna/updateForm.do?qna_number=${qna_number}&pageNum=${pageNum}`;
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


// 5. deleteQnaCheck() ---------------------------------------------------------------------------->
const deleteQnaCheck = async () => {
  const qna_number = document.getElementById("qna_number").value;
  const qna_pw = prompt("글을 삭제하시려면 암호를 입력하세요");

  if (qna_pw == "" || qna_pw == null) {
    alert("암호가 입력되지 않았습니다.");
    return false;
  }
  else {
    const response = await fetch('deleteCheck.do', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `qna_pw=${qna_pw}&qna_number=${qna_number}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("암호가 일치하지 않습니다.");
        return false;
      }
      else if (text == 1) {
        alert("글이 삭제되었습니다.");
        window.location.href = `deletePro.do?qna_number=${qna_number}&qna_pw=${qna_pw}`;
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