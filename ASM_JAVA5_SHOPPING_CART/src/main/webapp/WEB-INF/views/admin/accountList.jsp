<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
	 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<style>
.table-account{
border:1px solid #DCDCDC;
border-radius:5px;
}
.form-Search .form-control{
border-radius:15px;
}

</style>
<script type="text/javascript">
     $(document).ready(function(){
    	$('.table  .deleteBtn').on('click',function(event){
    		event.preventDefault();
    		var href = $(this).attr('href');
    		$('#deleteModal #deleteHref').attr('href',href);
    		$('#deleteModal').modal();
    	}) 
     });
</script>
<title>Insert title here</title>
</head>
<body>

      <div class="container">
      	<section class="row my-4">
      		<form action="/admin/account/search" method="post" class="row col-md-12">
      		<div class="form-group col-md-10 form-Search">
      		<input type="text" class="form-control" placeholder="Enter Search..." name="keyword"/>
      		</div>
      		<div class="form-group col-md-2">
      		<button class="btn btn-success px-5">Search</button>
      		</div>
      		</form>
      		<div class="form-group col-md-12">
      		   <table class="table table-borderless table-account ">
      		   <thead>
      		   <tr>
      		   <th class="text-center">No.</th>
      		   <th class="text-center">Photo</th>
      		   <th class="text-center">Username</th>
      		   <th>Fullname</th>
      		   <th class="text-center">Password</th>
      		   <th>Email</th>
      		   <th class="text-center">Activated</th>
      		   <th class="text-center">Roles</th>
      		   <th class="text-center">Action</th>
      		   </tr>
      		   </thead>
      		   <tbody>
      		   <c:set var="no" value="0"></c:set>
      		   <c:forEach var="item" items="${pageAccounts}">
      		   <c:set var="no" value="${no + 1}"></c:set>
      		   <tr>
      		   <td class="align-middle text-center">${no}</td>
      		   <td class="align-middle text-center">
      		   <img src="/images/${item.photo}" alt="" class="rounded-circle" width="80" height="80"/>
      		   </td>
      		   <td class="align-middle text-center">${item.username}</td>
      		   <td class="align-middle">${item.fullname}</td>
      		   <td class="align-middle text-center">${item.password}</td>
      		   <td class="align-middle">${item.email}</td>
      		   <td class="align-middle text-center">${item.activated?'Yes':'No'}</td>
      		   <td class="align-middle text-center">${item.admin?'[Admin]' : '[User]'}</td>
      		   <td class="align-middle text-center">
      		   <a href="/admin/account/edit/${item.username}"><i class="fas fa-edit"></i></a>
      		   <a href="/admin/account/delete/${item.username}" class="deleteBtn"><i class="fas fa-trash-alt"></i></a>
      		   <a href="/admin/account/add"><i class="fas fa-plus-square"></i></a>
      		   </td>
      		   </tr>
      		   </c:forEach>
      		   </tbody>
      		   </table>
      		</div>
      		<div class="col-md-12">
							<ul class="pagination-custom text-center">
								<li class="pag-link"><a href="/admin/account?page=0"><i
										class="fa fa-angle-double-left"></i></a></li>
								<li class="pag-link"><a href="/admin/account?page=${pageNumber - 1}"><i
										class="fa fa-chevron-left"></i></a></li>
								<li class="pag-link"><a href="/admin/account?page=${pageNumber + 1}"><i
										class="fa fa-chevron-right"></i></a></li>
								<li class="pag-link"><a href="/admin/account?page=${ pageTotalPages- 1}"><i
										class="fa fa-angle-double-right"></i></a></li>
							</ul>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Delete Account</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
						<p>Are you sure you want to delete account?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">No</button>
							<a class="btn btn-danger" href="" id="deleteHref">Yes</a>
						</div>
					</div>
				</div>
			</div>
		</section>
      </div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>
</body>
</html>