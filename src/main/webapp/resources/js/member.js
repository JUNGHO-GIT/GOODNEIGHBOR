// 0. openDaumPostcode() -------------------------------------------------------------------------->
function openDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      document.getElementById("member_zipcode").value = data.zonecode;
      document.getElementById("member_addr").value = data.address;
    },
  }).open();
}

// 0. memberPwCheck() ----------------------------------------------------------------------------->
function memberPwCheck() {
  if (document.delForm.member_pw.value == "" || document.delForm.member_pw2.value == "") {
    alert("암호는 필수 입력입니다.");
    document.delForm.member_pw.focus();
  } else {
    if (document.getElementById("member_pw").value != document.getElementById("member_pw2").value) {
      alert("비밀번호와 비밀번호확인이 다릅니다.");
      document.getElementById("member_pw").value = "";
      document.getElementById("member_pw2").value = "";
      document.delForm.member_pw.focus();
      return false;
    }
    return true;
  }
}

// ----------------------------------------------------------------------------------------------->
function memberCheck() {
  if ($("#member_id").val() == "") {
    alert("아이디를 입력하시오.");
    return false;
  }
  if ($("#member_pw").val() == "") {
    alert("비밀번호를 입력하시오.");
    return false;
  }
  if ($("#member_pw2").val() == "") {
    alert("비밀번호를 다시 입력해 주세요.");
    $("#member_pw").value = "";
    $("#member_pw").focus();
    return false;
  }
  if ($("#member_name").val() == "") {
    alert("성함을 입력하시오.");
    return false;
  }
  if ($("#member_email").val() == "") {
    alert("이메일을 입력하시오.");
    return false;
  }
  if ($("#member_tel").val() == "") {
    alert("전화번호를 입력하시오.");
    return false;
  }
  if ($("#member_addr").val() == "") {
    alert("우편번호와 주소를 입력하시오.");
    $("#member_zipcode").focus();
    return false;
  }
  if ($("#member_addr2").val() == "") {
    alert("상세 주소를 입력하시오.");
    $("#member_addr2").focus();
    return false;
  }
  if (!$("#agree_TermsofUse").is(":checked")) {
    alert("웹사이트 이용약관에 동의해주세요.");
    return false;
  }
  if (!$("#agree_Privacy").is(":checked")) {
    alert("개인정보 수집 및 이용에 동의해주세요.");
    return false;
  }
  return true;
}

// 1. updateMemberCheck --------------------------------------------------------------------------->
function updateMemberCheck() {
  if ($("#member_name").val() == "") {
    alert("성함을 입력하시오.");
    return false;
  }
  if ($("#member_email").val() == "") {
    alert("이메일을 입력하시오.");
    return false;
  }
  if ($("#member_tel").val() == "") {
    alert("전화번호를 입력하시오.");
    return false;
  }
  if ($("#member_addr").val() == "") {
    alert("우편번호와 주소를 입력하시오.");
    $("#member_zipcode").focus();
    return false;
  }
  if ($("#member_addr2").val() == "") {
    alert("상세 주소를 입력하시오.");
    $("#member_addr2").focus();
    return false;
  }
  return true;
}


// 2. confirmIdCheck() ---------------------------------------------------------------------------->
function confirmIdCheck() {

  const id_validation = /^[a-zA-Z0-9]{6,12}$/;
  const member_id = document.getElementById("member_id")
  const memberId = document.getElementById("member_id").value;
  const member_pw = document.getElementById("member_pw");
  const memberPw = document.getElementById("member_pw").value;

  if (memberId == "") {
    alert("아이디를 입력하세요.");
    return false;
  }
  else if (!id_validation.test(memberId)) {
    alert("6~12자리의 영문 대소문자, 숫자로 이루어진 아이디를 작성하시오.");
    memberId = "";
    memberId.focus();
    return false;
  }
  else {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", `/${ctxPath}/member/idCheck.do`, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("member_id=" + memberId);
    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        if (xhr.responseText == -1) {
          alert("중복된 아이디입니다.");
          memberId.value = "";
          memberId.focus();
          return false;
        }
        else if (xhr.responseText == 1) {
          alert("사용 가능한 아이디입니다.");
          memberPw.focus();
          return true;
        }
        else {
          alert("오류가 발생했습니다.");
          return false;
        }
      }
    }
  }
}

// 2. confirmPwCheck() ---------------------------------------------------------------------------->
function confirmPwCheck() {
  const pw_validation = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/;

  if ($("#member_pw").val() == "") {
    $("#password-error").text(
      "8~15자리의 영문 대소문자, 숫자, 특수문자가 포함된 암호를 작성하시오.",
    );
    $("#password-error").removeClass("password-errorf");
    $("#password-error").addClass("password-errort");
    $("#member_pw").focus();
  } else if (pw_validation.test($("#member_pw").val())) {
    if ($("#member_pw").val() != $("#member_pw2").val()) {
      $("#password-error").text("비밀번호와 비밀번호확인이 다릅니다.");
      $("#password-error").addClass("password-errorf");
      $("#password-error").removeClass("password-errort");
      $("#member_pw").val("");
      $("#member_pw2").val("");
      $("#member_pw").val("").focus();
      return false;
    }
    $("#password-error").text("");
    return true;
  } else if (!pw_validation.test($("#member_pw").val())) {
    $("#password-error").text(
      "8~15자리의 영문 대소문자, 숫자, 특수문자가 포함된 암호를 작성하시오.",
    );
    $("#password-error").addClass("password-errorf");
    $("#password-error").removeClass("password-errort");
    $("member_#pw").val("");
    $("#member_pw2").val("");
    $("#member_pw").focus();
  }
}

// 3. confirmEmailCheck() ------------------------------------------------------------------------->
function confirmEmailCheck() {
  const email_validation = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

  if ($("#member_email").val() == "") {
    return false;
  } else if (email_validation.test($("#member_email").val())) {
    return true;
  } else if (!email_validation.test($("#member_email").val())) {
    alert("이메일을 올바르게 작성하였는지 확인해주세요.");
    $("#member_email").val("");
    $("#member_email").focus();
  }
}

// 4. confirmTelCheck() --------------------------------------------------------------------------->
function confirmTelCheck() {
  const tel_validation = /^01[0|1|6|7|8|9].?([0-9]{3,4}).?([0-9]{4})$/;

  if ($("#member_tel").val() == "") {
    return false;
  } else if (tel_validation.test($("#member_tel").val())) {
    console.log("정규표현식에 맞음 성공");
    return true;
  } else if (!tel_validation.test($("#member_tel").val())) {
    console.log("정규표현식에 맞지 않음 실패");
    alert("전화번호를 올바르게 작성하였는지 확인해주세요.");
    $("#member_tel").val("");
    $("#member_tel").focus();
    return false;
  }
}

// 5. viewTerms() -------------------------------------------------------------------------------->
function viewTerms(event) {
  event.preventDefault();
  window.open(
    event.target.href,
    "팝업",
    "width=500,height=700,left=100, top=50,scrollbars=no, resizable=no, toolbar=no, menubar=no",
  );
}

// 6. agree_check() ------------------------------------------------------------------------------->
function agree_check() {
  if (!document.getElementById("check_all").checked) {
    $("#agreeMessage").text("이용 약관에 동의해주세요.");
    $("#agreeMessage").addClass("agreeMessagef");
    return false;
  }
  $("#agreeMessage").text("");
  return true;
}

// 7. loginCheck() ------------------------------------------------------------------------------->
function loginCheck() {
  if (document.loginForm.member_id.value == "") {
    alert("아이디를 입력하세요.");
    document.loginForm.member_id.focus();
    return false;
  }
  if (document.loginForm.member_pw.value == "") {
    alert("비밀번호를 입력하세요.");
    document.loginForm.member_pw.focus();
    return false;
  }
}

// 8. searchIdCheck() ---------------------------------------------------------------------------->

// 검색 방법을 변경하는 함수
function setSearchMethod(method) {
  searchMethod = method;
}

// 아이디 찾기 버튼을 눌렀을 때 실행되는 함수
function searchIdCheck() {
  const form = document.getElementById('searchId');

  if (searchMethod === 'tel') {
    const search_tel_name = document.getElementById('search_tel_name').value;
    const search_tel_number = document.getElementById('search_tel_number').value;

    // 입력 필드가 비어 있지 않은지 확인
    if (!search_tel_name || !search_tel_number) {
      alert('이름과 휴대전화 번호를 모두 입력해주세요.');
      return false;
    }

    form.action = `/${ctxPath}/member/searchIdByTel.do`;
  } else if (searchMethod === 'email') {
    const search_email_name = document.getElementById('search_email_name').value;
    const search_email_domain = document.getElementById('search_email_domain').value;

    // 입력 필드가 비어 있지 않은지 확인
    if (!search_email_name || !search_email_domain) {
      alert('이름과 이메일을 모두 입력해주세요.');
      return false;
    }

    form.action = `/${ctxPath}/member/searchIdByEmail.do`;
  }

  // 검증이 완료되면 form을 제출
  form.submit();
}

// 9. searchPwCheck() ---------------------------------------------------------------------------->
// 비밀번호 찾기 버튼을 눌렀을 때 실행되는 함수
function searchPwCheck() {
  const form = document.getElementById('searchPw');

  if (searchMethod === 'tel') {
    const search_tel_id = document.getElementById('search_tel_id').value;
    const search_tel_name = document.getElementById('search_tel_name').value;
    const search_tel_number = document.getElementById('search_tel_number').value;

    // 입력 필드가 비어 있지 않은지 확인
    if (!search_tel_id || !search_tel_name || !search_tel_number) {
      alert('아이디, 이름, 휴대전화 번호를 모두 입력해주세요.');
      return false;
    }

    form.action = `/${ctxPath}/member/searchPwByTel.do`;
  } else if (searchMethod === 'email') {
    const search_email_id = document.getElementById('search_email_id').value;
    const search_email_name = document.getElementById('search_email_name').value;
    const search_email_domain = document.getElementById('search_email_domain').value;

    // 입력 필드가 비어 있지 않은지 확인
    if (!search_email_id || !search_email_name || !search_email_domain) {
      alert('아이디, 이름, 이메일을 모두 입력해주세요.');
      return false;
    }

    form.action = `/${ctxPath}/member/searchPwByEmail.do`;
  }

  // 검증이 완료되면 form을 제출
  form.submit();
}

let searchMethod = 'tel'; // 기본 검색 방법 설정
const ctxPath = new URL(location.href).pathname.split("/")[1];
