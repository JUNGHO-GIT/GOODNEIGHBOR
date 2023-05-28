<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!DOCTYPE html>
<html lang="en, ko">

  <!----------------------------------------------------------------------------------------------->
  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />

  </head>

  <!----------------------------------------------------------------------------------------------->
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/slider.jsp" />

    <main class="main container-fluid">

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
          <img src="${srcPath}/upload/${dto.product_image}" class="product-imgs-detail img-fluid mb-5 mt-5 sh-7 rd-1"/>
        </div>
      </div>
      <hr class="green-line2"/>

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
          <table class="table table-borderless">
            <tr>
              <th style="border-top: transparent; background-color: transparent; text-align: center;" colspan="2">
                <span class="product-title">${dto.product_name}</span>
                <div class="empty"></div>
              </th>
            </tr>
            <tr>
              <td style="width:100px;">상세설명</td>
              <td><textarea id="product_content" name="product_content" class="form-control" rows="5" readonly="readonly">${dto.product_content}</textarea></td>
            </tr>
            <tr>
              <td style="width:100px;">후원금</td>
              <td>
                <input type="text" id="product_price" name="product_price" class="form-control" readonly value="&#8361; <fmt:formatNumber value='${dto.product_price}' type='number' pattern='#,###'/>" />
              </td>
            </tr>
            <tr>
              <td style="width:100px;">제조사</td>
              <td>
                <input type="text" id="product_company" name="product_company" class="form-control" value="${dto.product_company}" readonly="readonly" />
              </td>
            </tr>
             <tr>
              <td style="width:100px;">등록날짜</td>
              <td>
                <input type="text" id="product_regdate" name="product_regdate" class="form-control" readonly value="<fmt:formatDate value='${dto.product_regdate}' pattern='yyyy-MM-dd' />" />
                <input type="hidden" id="product_number" name="product_number" value="${dto.product_number}" />
              </td>
            </tr>
          </table>
        </div>
      </div>
      <br/><br/>

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
          <c:if test="${admin_id != null}">
            <button class="btn btn-primary btn-sm ms-2" onclick="return insertProductCheck();">
            후원품 등록</button>
            <button class="btn btn-primary btn-sm ms-2" onclick="return updateProductCheck();">
            글수정</button>
            <button class="btn btn-danger btn-sm ms-2" onclick="return deleteProductCheck();">
            글삭제</button>
          </c:if>
          <button class="btn btn-primary btn-sm ms-2" onclick="return insertProductCheck();">
          후원하기</button>
          <button class="btn btn-primary btn-sm ms-2" onclick="window.location.href='${ctxPath}/product/list.do?pageNum=${pageNum}'">리스트</button>
        </div>
      </div>

    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>