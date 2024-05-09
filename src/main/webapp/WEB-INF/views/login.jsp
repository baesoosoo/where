<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

   body{
  margin: 0;
  padding: 0;
  background-size: cover;
  background: rgb(237,102,87);
  height: 100px;

}

.center{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  background: white;
  border-radius: 10px;
  
}

.center h1{
  text-align: center;
  padding: 0 0 20px 0;
  border-bottom: 1px solid silver;
}

.center form{
  padding: 0 40px;
  box-sizing: border-box;
}

form .txt_field{
  position: relative;
  border-bottom: 2px solid #adadad;
  margin: 30px 0;
}

.txt_field input{
  width: 80%;
  padding: 0 5px;
  height: 40px;
  font-size: 16px;
  border: none;
}


input[type="Submit"]{
  width: 100%;
  height: 50px;
  border: 1px solid;
  border-radius: 25px;
  font-size: 18px;
  font-weight: 700;
  cursor: pointer;
  background-color: rgb(240, 240, 18);

}

input[type="Submit"]:hover{
  background: rgb(253, 253, 5);
  color: #e9f4fb;
  transition: 0.5s;
}

.signup_link{
  margin: 30px 0;
  text-align: center;
  font-size: 16px;
  color: #666666;
}

.signup_link a{
  color: #2691d9;
  text-decoration: none;
}

.signup_link a:hover{
  text-decoration: underline;
}

</style> 
</head>
<body>

 <div>
      <div class="center">
      
      <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

          <h1>Login</h1>

          <form action="#" method="POST">
              <div class="txt_field">
                  <input type="text" name="user_id" required placeholder="Id">
                  <span></span>
               
              </div>

              <div class="txt_field">
                  <input type="password" name="pwd" required placeholder="Password">
                  <span></span>
                  
              </div>

              <input type="Submit" name="submit" value="Login">
              <div class="signup_link"> Not a Member ? <a href="<%=request.getContextPath()%>/join.go">Join</a>
              </div>
          </form>

      </div>
    </div>

</body>
</html>