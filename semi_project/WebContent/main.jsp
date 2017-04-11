<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:forward page="${pageContext.request.contentType}/DispatcherServlet">
	<jsp:param value="storeShow" name="command"/>
</jsp:forward>
