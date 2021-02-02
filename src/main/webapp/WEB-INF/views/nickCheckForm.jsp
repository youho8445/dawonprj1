<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
   //request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
   //request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
   String membernick = request.getParameter("membernick");
%>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function InputValidation() {
var nickCheckresult = document.getElementById("nickCheckresult").value;
if (nickCheckresult != 0) {
    alert("닉네임 중복 확인 해주세요.");
    return false;
 }
return true;
 
}
function nickCheck() {
    var nickCheckid = document.getElementById("membernick").value;
    var getNickName= RegExp(/^[A-Za-z0-9가-힣]{2,10}$/);
    
    if ($("#membernick").val() == "") {
       alert("입력된 닉네임이 없습니다.");
       $("#membernick").focus();
    }else if (!getNickName.test($("#membernick").val())) {
      alert("사용할 수 없는 닉네임입니다");
      $("#membernick").val("");
      $("#membernick").focus();
      return false;
   }else {
       location.href = "nickCheck?membernick=" + nickCheckid;
    }
 }
 
 
 $(document).ready(function() {
    // 취소
    $("#submit").on("click", function() {
       opener.callBackDiv2("<%=membernick%>");   
         window.close();
      });
   });
</script>
<body>
   <form id="form" name="form" method="post"
      onsubmit="return InputValidation()">
      <dl>
         <dt>
            <span>*</span>닉네임 (최대 10글자이내)
         </dt>

         <dd>


            <input class="validate required" size="30" placeholder="닉네임을 입력해주세요"
               type="text" id="membernick" name="membernick"
               value="${membernick }" /> &nbsp; <input type="button"
               id="nickCheckid" style="margin-left: 150px;" onclick="nickCheck()"
               value="중복확인" /> <br /> <input type="hidden" id="nickCheckresult"
               value="${nickCheckresult }" />
            <c:if test="${nickCheckresult == 0 }">
               <span style="color: green;">사용 가능한 닉네임입니다.</span>
            </c:if>
            <c:if test="${nickCheckresult == 1 }">
               <span style="color: red;">이미 가입된 닉네임입니다.</span>
               <input type="hidden" id="submit" value="닉네임쓰기" />
            </c:if>

         </dd>
      </dl>
      <input type="submit" id="submit" value="입력" />
   </form>
</body>
</html>