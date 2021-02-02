<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@media
screen
and
(min-width:512px)
and
(max-width:1024px)
</style>
<style>
body {
   background-image: url('resources/img/icon3.png');
   background-size: 800px 600px;
}

#title {
   margin-top: 30px;
   margin-bottom: 10px;
}

body, tr, td {
   font-family: "돋움";
   font-size: 15px;
   color: #666;
}

#content, tbody {
   /* margin: 10px 250px 0px 250px; */
   
   padding-right: 70px;
   border-style: dotted;
   border-color: pink;
   
}

#title strong {
   font-size: 25px;
   font-weight: bold;
}
</style>

<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(800,600)"
   onload="parent.resizeTo(800,600)">
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
$(function(){
   var membernick =$('#membernick').val();
   if (membernick == "")  {
       window.close();
   alert("로그인 후 이용해주세요.");
        return false;
   }
});
</script> 
   
   <div id="form1" style="margin-left: 40px;">
      <div id="title">
      <input type="hidden" id="membernick" value="${hom.membernick }" />
         <h3>${hom.membernick}님의 상세정보</h3>
      </div>
      <table>
         <tr>
            <td style="padding-left: 10px;"><img src="resources/upload/${hom.filesrc }" 
                  width="100" height="130" />
                  
            </td>
            <td width="90">
            
            </td>
            
            <td>
               <div id="content">
               <table>
                     <tbody>
                        <tr>
                           <td><strong>이름:</strong></td>
                           <td>${hom.membername }</td>
                           <td width="40"></td>
                           <td><strong>나이:</strong></td>
                           <td width="5"></td>
                           <td>${hom.memberage}</td>
                        </tr>
                        <tr>
                           <td><strong>주소:</strong></td>
                           <td>${hom.roadaddrpart1 }, ${hom.addrdetail }</td>
                           <td width="40"></td>
                           <td><strong>성별:</strong></td>
                           <td width="5"></td>
                           <td>${hom.membergender}</td>
                        </tr>
                        <tr>
                           <td><strong>이메일:</strong></td>
                           <td>${hom.memberemail }</td>
                           <td width="40"></td>
                           <td><strong>연락처:</strong></td>
                           <td width="5"></td>
                           <td>${hom.membertel}</td>
                        </tr>
                        <tr>
                           <td><strong>생년월일:</strong></td>
                           <td>${hom.memberyear }년 ${hom.membermonth } ${hom.memberday }</td>
                           <td width="40"></td>
                           <td><strong>종교:</strong></td>
                           <td width="5"></td>
                           <td>${hom.memberreligion}</td>
                        </tr>
                        <tr>
                           <td><strong>직업:</strong></td>
                           <td>${hom.memberjob }</td>
                           <td width="40"></td>
                           <td><strong>성격:</strong></td>
                           <td width="5"></td>
                           <td>${hom.memberpersonality}</td>
                        </tr>   
                        
                     </tbody>

                  </table>
                  
               </div>
            </td>
         </tr>
         
      </table>
   </div>

</body>
</html>