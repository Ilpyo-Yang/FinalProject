<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% String ctxPath = request.getContextPath();   %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
body {margin:0}

.icon-bar {
  width: 90px;
  background-color: #555;
  height: 100%;
}

.icon-bar a {
  display: block;
  text-align: center;
  padding: 16px;
  transition: all 0.3s ease;
  color: white;
  font-size: 36px;
}

.icon-bar a:hover {
  background-color: #000;
}

.active {
  background-color: #04AA6D;
}
</style>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


<body>

<div class="icon-bar">
  <a class="active" href="<%=ctxPath%>/index.action"><i class="fab fa-pinterest-square"></i></a> 
  <a href="#"><i class="fas fa-user-alt"></i></a> 
  <a href="#"><i class="fas fa-user-slash"></i></a> 
  <a href="#"><i class="fa fa-home"></i></a> 
  <a href="#"><i class="fas fa-comments"></i></a> 
  <a href="#"><i class="fas fa-user-circle"></i></a> 
</div>
  

</body>
</html> 