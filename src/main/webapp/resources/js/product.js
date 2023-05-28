// 1. productCheck() ----------------------------------------------------------------------------->
function productCheck() {
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

// 2. productSearchCheck() ---------------------------------------------------------------------->
function productSearchCheck() {
	if (!document.searchForm.keyWord.value) {
		alert("검색어를 입력하세요");
		document.searchForm.keyWord.focus();
		return false;
	}
	document.searchForm.submit();
}

// 4. insertProductCheck() ---------------------------------------------------------------------->
const insertProductCheck = async () => {
  const product_writer = document.getElementById("member_id").value;
  const pageNum = document.getElementById("pageNum").value;
  const product_number = document.getElementById("product_number").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (product_writer == "" || product_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    window.location.href = `/${ctxPath}/product/insertForm.do?product_number=${product_number}&pageNum=${pageNum}`;
    return true;
  }
}

// 4. updateProductCheck() ---------------------------------------------------------------------->
const updateProductCheck = async () => {
  const product_number = document.getElementById("product_number").value;
  const product_writer = document.getElementById("admin_id").value;
  const pageNum = document.getElementById("pageNum").value;
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if (product_writer == "" || product_writer == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    const response = await fetch(`/${ctxPath}/product/updateCheck.do`, {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `product_number=${product_number}&product_writer=${product_writer}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("작성자가 아닙니다.");
        return false;
      }
      else if (text == 1) {
        window.location.href = `/${ctxPath}/product/updateForm.do?product_number=${product_number}&pageNum=${pageNum}`;
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

// 5. deleteProductCheck() ---------------------------------------------------------------------->
const deleteProductCheck = async () => {
  const product_number = document.getElementById("product_number").value;
  const product_pw = prompt("글을 삭제하시려면 암호를 입력하세요");

  if (product_pw == "" || product_pw == null) {
    alert("암호가 입력되지 않았습니다.");
    return false;
  }
  else {
    const response = await fetch('deleteCheck.do', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: `product_pw=${product_pw}&product_number=${product_number}`
    });

    if (response.ok) {
      const text = await response.text();

      if (text == -1) {
        alert("암호가 일치하지 않습니다.");
        return false;
      }
      else if (text == 1) {
        alert("글이 삭제되었습니다.");
        window.location.href = `deletePro.do?product_number=${product_number}&product_pw=${product_pw}`;
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

// ------------------------------------------------------------------------------------------------>
setInterval(() => {
  let date = new Date();
  let options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', hour12: false };
  document.getElementById('time').innerHTML = date.toLocaleString([], options);
}, 1000);

let randomAmount = Math.floor(Math.random() * (2000000 - 1000000 + 1)) + 1000000;
let formattedAmount = randomAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

// insert won icon
let wonIcon = document.createElement('i');
wonIcon.classList.add('fas', 'fa-won-sign');

// Format the output string and color
let output = document.getElementById('randomAmount');
output.innerHTML = wonIcon.outerHTML + ' ' + formattedAmount;
output.style.color = "#3cc88f";


// 5. makeDonation() ---------------------------------------------------------------------------->
const makeDonation = () => {

  const memberId = document.getElementById("member_id");
  const productName = document.getElementById("product_name");
  const donationAmount = document.getElementById("donation_amount");
  const donationTime = document.getElementById("time");
  const ctxPath = new URL(location.href).pathname.split("/")[1];

  if(memberId.value == "" || memberId.value == null) {
    alert("로그인이 필요합니다.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    const confirmMessage = `후원하시겠습니까?\n\n후원자 : ${memberId.value}\n후웜품 : ${productName.value}\n후원금 : ${donationAmount.value}\n후원시간 : ${donationTime.innerText}`;
    const confirmResult = confirm(confirmMessage);
    if (confirmResult) {
      alert(`후원이 완료되었습니다.\n\n ${memberId.value}님의 후원을 진심으로 감사드립니다.`);
      window.location.href = `/${ctxPath}/product/list.do`;
      return true;
    }
    else {
      alert("후원이 취소되었습니다.");
      return false;
    }
  }
}