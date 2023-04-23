//  productCheck --------------------------------------------------------------------------------->
function productCheck() {
	if ($("#product_name").val() == "") {
		alert("후원품 이름을 입력 하세요");
		$("#product_name").focus();
		return false;
	}

	if ($("#product_detail").val() == "") {
		alert("후원품 정보를 입력 하세요");
		$("#product_detail").focus();
		return false;
	}

	if ($("#product_price").val() == "") {
		alert("후원품 가격을 입력 하세요");
		$("#product_price").focus();
		return false;
	}

	if ($("#product_stock").val() == "") {
		alert("후원품 수량을 입력 하세요");
		$("#product_stock").focus();
		return false;
	}

	if ($("#product_company").val() == "") {
		alert("후원품 제조회사를 입력하세요");
		$("#product_company").focus();
		return false;
	}

	if ($("#product_image").val() == "") {
		alert("후원품 사진을 등록하세요");
		$("#product_image").focus();
		return false;
	}
	alert("등록 완료 되었습니다.");
	return true;
}

// setThumbnail() --------------------------------------------------------------------------------->
function setThumbnail(event) {
	let reader = new FileReader();
	reader.onload = function (event) {
		let img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("max-width", "400px");
		img.setAttribute("max-height", "400px");
		let imageContainer = document.querySelector("div#image_container");
		while (imageContainer.firstChild) {
			imageContainer.removeChild(imageContainer.firstChild);
		}
		imageContainer.appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}

// function deleteCheck() ------------------------------------------------------------------------>
function deleteCheck() {
	if (confirm("정말 삭제 하시겠습니까?")) {
		alert("삭제가 완료 되었습니다.");
		window.location.href = "/goodneighbor/product/empty.jsp";
		return true;
	} else {
		return false;
	}
}

// function updateCheck() ------------------------------------------------------------------------>
function updateCheck() {
	if (confirm("정말 수정 하시겠습니까?")) {
		alert("수정이 완료 되었습니다.");
		window.location.href = "/goodneighbor/product/listProduct";
		return true;
	} else {
		return false;
	}
}

// function deleteConfirmation() ----------------------------------------------------------------->
function deleteConfirmation(ctxPath, productId) {
	if (confirm("정말 삭제 하시겠습니까?")) {
		location.href = `deleteProduct?product_id=${productDTO.product_id}`;
	}
	alert("삭제되었습니다.");
}

// function updateConfirmation() ----------------------------------------------------------------->
function updateConfirmation(ctxPath, productId) {
	if (confirm("정말 수정 하시겠습니까?")) {
		location.href = `insertProduct?product_id=${productDTO.product_id}`;
	}
	alert("수정되었습니다.");
}