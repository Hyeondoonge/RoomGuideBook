<%@page import="dto.PaymentDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="/resources/css/sellerOrder.css">
</head>
<body id="page-top">
	<div id="adminSidenav" class="sidenav">
		<h3>
			<strong>상품 관리</strong>
		</h3>
		<a href="/getProductList">상품조회 및 수정</a> 
		<a href="/getRegisterProductForm">상품 등록</a>
		<h3>
			<strong>주문 관리</strong>
		</h3>
		<a href="/getListForSeller">주문조회</a>
	</div>

	<div id="content-wrapper" class="content">
		<div class="orderList">
		<h1>주문 조회</h1>
			<table class="orderTable">
				<tr>
					<!-- <th>선택</th> -->
					<th>주문번호</th>
					<th>구매자ID</th>
					<th>상품 명</th>
					<th>수량</th>
					<th>결제예정금액</th>
					<th>결제금액</th>
					<th>주문상태</th>
					<th>주문일시</th>
				</tr>

				<tbody id="table2">
					<%
						List<Object[]> list = (ArrayList<Object[]>) request.getAttribute("list");

					for (int i = 0; i < list.size(); i++) {
						pageContext.setAttribute("product", (ProductDTO)list.get(i)[0]);
						pageContext.setAttribute("order", (OrderDTO)list.get(i)[1]);
						pageContext.setAttribute("payment", (PaymentDTO)list.get(i)[2]);
					%>
					<tr>
						<%-- <td><input type="checkbox" name="values"
							value="${order.orderId}"></td> --%>
						<td>${order.orderId}</td>
						<td>${order.userId}</td>
						<td>${product.name}</td>
						<td>${order.amount}</td>
						<td>${payment.amountSum}</td>
						<td>${payment.paidAmount}</td>
						<td>${payment.progress}</td>
						<td>${order.purchaseDate}</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>