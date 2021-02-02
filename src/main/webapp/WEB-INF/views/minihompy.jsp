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
<title>Insert title here</title>
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
         <strong>${hom.membernick}님의 미니홈피</strong>
      </div>
      <table>
         <tr>
            <td style="padding-left: 10px;"><img src="resources/upload/${hom.filesrc }" 
                  width="100" height="130" />
                  <a href="sendnote"><img src="resources/img/mail.png"/></a>
            </td>
            <td width="90">
            
            </td>
            
            <td>
               <div id="content">
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>종교</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberreligion">${hom.memberreligion}</td>
                        </tr>
                     </tbody>

                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>흡연</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="membersmok">${hom.membersmok}</td>
                        </tr>
                     </tbody>
                  </table>

                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>성격</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberpersonality">${hom.memberpersonality}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>이상형</strong></td>
                           <td width="24"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberideal">${hom.memberideal}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>직업</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberjob">${hom.memberjob}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>연봉</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="membersal">${hom.membersal}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>혈액형</strong></td>
                           <td width="24"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberblood">${hom.memberblood}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>안경착용</strong></td>
                           <td width="8"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberglasses">${hom.memberglasses}</td>
                        </tr>
                     </tbody>
                  </table>
                  <table>
                     <tbody>
                        <tr>
                           <td><img src="resources/img/icon.png" /></td>
                           <td width="1"></td>
                           <td><strong>학력</strong></td>
                           <td width="40"></td>
                           <td><img src="resources/img/pink.png" /></td>
                           <td id="memberschool">${hom.memberschool}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </td>
         </tr>
         <tr>
            <td style="padding-left: 10px;">
               <div>자기소개</div>
            </td>
         </tr>
         <tr>
            <td style="padding-left: 10px;">
               <div id="intro">${hom.membercontent}</div>
            </td>
         </tr>
      </table>
   </div>

</body>
</html>