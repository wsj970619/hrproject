<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">

<style>

</style>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>--%>


</head>
<body>

		<form class="form-horizontal" action="add">
            <div class="form-group">
                <label class="col-sm-2 control-label">编号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="请输入编号" name="number">
                </div>
            </div>
			<div class="form-group">
				<label class="col-sm-2 control-label">名字</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请输入名字"
						name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<input type="radio" name="gender" value="男"> 男
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" value="女"> 女
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="请输入年龄"
						name="age">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">部门</label>
				<div class="col-sm-10">
					<select class="form-control" name="dep.id">
						<c:forEach var="dep" items="${depList }">
							<option value="${dep.id }" >${dep.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</div>
		</form>
</body>
</html>