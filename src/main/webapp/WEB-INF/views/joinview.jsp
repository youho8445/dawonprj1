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
<title>mainpage</title>
<link rel="stylesheet" href="resources/css/sidemenu.css" />
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link type="text/css" rel="stylesheet" href="resources/css/join.css" />

</head>
<body>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript">
      // 컨트롤러에 입력한 데이터를 보내기 전에
      // 빈 값이 있는지 확인하는 Validation(체크 과정)
      function InputValidation() {

         // 개발자도구 console창에서 확인 가능
         //console.log("InputValidation");
         //console.log("아이디 : " + $("#memberid").val());
         //console.log($("#memberid").val()=="");
         //console.log("이름 : " + $("#membername").val());

         // 이 위치에서 코드가 멈춤
         //debugger;

         // 사용자가 공백을 입력하면 false가 나오기 때문에
         // Trim()같은 메소드를 사용해서 공백 제거 필요
         var Checkresult = document.getElementById("Checkresult").value;
     

         if ($("#memberid").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#memberid").focus();
            return false;
         } else if ($("#memberpw").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#memberpw").focus();
            return false;
         } else if ($("#memberpwd").val() == "") {
            alert("비밀번호확인을 입력해주세요.");
            $("#memberpwd").focus();
            return false;
         } else if ($("#memberpw").val().length < 8) {
             alert("비밀번호는 8자 이상으로 설정해야 합니다.");
             $("#memberpw").val("").focus();
             return false;
          }else if ($("#membername").val() == "") {
            alert("이름을 입력해주세요.");
            $("#membername").focus();
            return false;
         } else if ($("#membernick").val() == "") {
            alert("닉네임을 입력해주세요.");
            $("#membernick").focus();
            return false;
         } else if ($("#roadAddrPart1").val() == "") {
            alert("주소를 입력해주세요.");
            $("#roadAddrPart1").focus();
            return false;
         } else if ($("#membertel").val() == "") {
            alert("핸드폰번호를 입력해주세요.");
            $("#membertel").focus();
            return false;
         } else if ($("#memberemail").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#memberemail").focus();
            return false;
         } else if ($("#memberage").val() == "") {
            alert("나이를 입력해주세요.");
            $("#memberage").focus();
            return false;
         } else if (Checkresult != 0) {
            alert("아이디 중복 확인 후 가입해주세요.");
            return false;
         } else if (nickCheckresult != 0) {
            alert("닉네임 중복 확인 후 가입해주세요.");
            return false;
         }
         return true;
         
      }

      $(document).ready(function() {
         // 취소
         $(".cencle").on("click", function() {
            location.href = "mainpage";
         });
      });
      function idCheck() {
         var Checkid = document.getElementById("memberid").value;
       

         if ($("#memberid").val() == "") {
            alert("입력된 아이디가 없습니다.");
            $("#memberid").focus();
         } else {
            location.href = "idCheck?memberid=" + Checkid;
         }
      }
      //닉네임 중복체크 
      function nickCheck() { 
         window.open("nickCheckForm", "", "width=500, height=350, left=750, top=200"); 
      }
   </script>
  
   <script type="text/javascript">
      $(function() {
         $("#alert-success").hide();
         $("#alert-danger").hide();
         $("input").keyup(function() {
            var memberpw = $('#memberpw').val();
            var memberpwd = $("#memberpwd").val();
            if (memberpw != "" || memberpwd != "") {
               if (memberpw == memberpwd) {
                  $("#alert-success").show();
                  /*  $("#submit").show();  */
                  $('#alert-danger').hide();
                  $('#submit').removeAttr("disabled");
               } else {
                  $("#alert-success").hide();
                  /*   $("#submit").hide();  */
                  $('#alert-danger').show();
                  $('#submit').attr("disabled", "disabled");
                  return false;
               }

            }

         });
      });
   </script>
   <script language="javascript">
      // opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
      //document.domain = "abc.go.kr";

      function goPopup() {
         // 주소검색을 수행할 팝업 페이지를 호출합니다.
         // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
         var pop = window.open("jusoPopup", "pop",
               "width=570,height=420, scrollbars=yes, resizable=yes");

         // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
         //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
      }

      function jusoCallBack(roadAddrPart1, addrDetail, jibunAddr, zipNo) {
         
         document.getElementById('roadAddrPart1').value = roadAddrPart1
         document.getElementById('addrDetail').value = addrDetail
         document.getElementById('jibunAddr').value = jibunAddr
         document.getElementById('zipNo').value = zipNo

      }
      function callBackDiv2(membernick) {
    	   document.getElementById('membernick').value = membernick
	}
   </script>



   <div id="wrap">
      <div id="header1">
         <div class="container">
            <a href="mainpage"><img src="resources/img/logo1.png" alt=""
               width="1400" height="240" /></a>
         </div>
      </div>
      <div id="header2">
         <div class="container">
            <c:if test="${empty membernick }">
            <script type="text/javascript">
                  $(document).ready(function() {
                     $(".submenuLink").on("click", function() {
                        alert("로그인 후 이용할수있는 페이지입니다.");
                        return false;
                     });
                     $(".topMenuLi").on("click", function() {
                        alert("로그인 후 이용할수있는 페이지입니다.");
                        return false;
                     });
                  });
               </script>
               <a href="loginview">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a
                  href="joinview">회원가입</a>
                  
                  
            </c:if>

            <c:if test="${not empty membernick }">
               <c:if test="${membernick ne '관리자' }">

                  <span><strong>${membernick }</strong>님 접속중</span>
                  <a href="memberprofile?memberid=${memberid }">mypage</a>&nbsp;
            <a href="logout">LogOut</a>

               </c:if>
               <c:if test="${membernick eq '관리자' }">
                  <span><strong>${membernick }</strong> 계정</span>
                  <a href="manager">Manager</a>&nbsp;&nbsp;&nbsp;
         <a href="logout">LogOut</a>
               </c:if>
            </c:if>

         </div>
      </div>
      <hr />
      <div id="banner">
         <div class="container">
            <div id="topMenu">
               <ul>
                  <li class="topMenuLi"><a class="menuLink" href="introducepage">소개</a>
                  <ul class="submenu">
                     <li><a class="submenuLink longLink" href="introducepage">소개글</a></li>
								<li><a class="submenuLink longLink" href="map">찾아오시는길</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="type_board">이상형만나기</a>
							<ul class="submenu">
								<li><a class="submenuLink longLink" href="type_board">프로필
										검색</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
								<li><a class="submenuLink longLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="ready">커뮤니티</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="free_board">자유 게시판</a></li>
								<li><a class="submenuLink" href="report_board">신고 게시판</a></li>
								<li><a class="submenuLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!-- <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink" href="faq">문의/FAQ</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="inquiry">문의</a></li>
								<li><a class="submenuLink" href="faq">FAQ</a></li>
								<li><a class="submenuLink" href="ready">준비중입니다</a></li>
							</ul></li>
						<!--    <li>|</li> -->
						<li class="topMenuLi"><a class="menuLink"
							href="memberprofile?memberid=${memberid }">마이페이지</a>
							<ul class="submenu">
								<li><a class="submenuLink" id=""
									href="minihompy?memberid=${memberid }"
									onclick="window.open('minihompy?memberid=${memberid }','','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=800,height=600,left=500, top=500, scrollbars=yes');return false">내
										미니홈피</a></li>
								<li><a class="submenuLink" href="ready">내 아이템</a></li>
								<li><a class="submenuLink"
									href="notebox?takenick=${membernick }">내 쪽지함</a></li>
								<li><a class="submenuLink"
									href="memberpw?memberid=${memberid }">비밀번호 변경</a></li>
								<li><a class="submenuLink"
									href="memberdelete?memberid=${memberid }">회원탈퇴</a></li>
                  </ul></li>
                  
            </ul>
               <span style="font-size: 30px; cursor:pointer; padding-left: 20px;  
                  position: absolute;" onclick="openNav()">&#9776; open</span>
            </div>
            
         </div>
      </div>

      <div id="contents1">
         <div id="contents2">
            <form action="joinform" name="joinInfo"
               onsubmit="return InputValidation()" method="post">

               <dl>
                  <dt>
                     <span style="font-size: 35px; font-style: BOLD;">회원가입</span> <br />
                     (*은 필수 항목입니다.)
                  </dt>

               </dl>

               <dl>
                  <dt>
                     <span>*</span>아이디 입력
                  </dt>
                  <dd>
                     <input class="validate required" size="30"
                        placeholder="아이디를 입력해주세요" type="text" id="memberid"
                        name="memberid" value="${memberid}"  />&nbsp; <input
                        type="button" id="Checkid" style="margin-left: 150px;"
                        onclick="idCheck()" value="중복확인" /> <br /> <input
                        type="hidden" id="Checkresult" value="${Checkresult }" />
                     <c:if test="${Checkresult == 0 }">
                        <span style="color: green;">사용 가능한 아이디입니다.</span>
                     </c:if>
                     <c:if test="${Checkresult == 1 }">
                        <span style="color: red;">이미 가입된 아이디입니다.</span>
                     </c:if>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>비밀번호 입력
                  </dt>
                  <dd>
                     <input class="validate required" size="30" type="password"
                        id="memberpw" name="memberpw" />
                  </dd>

               </dl>
               <dl>
                  <dt>
                     <span>*</span>비밀번호 확인
                  </dt>
                  <dd>
                     <input class="validate required" size="30" type="password"
                        id="memberpwd" name="memberpwd" />
                  </dd>
                  <dd>
                     <span class="alert alert-success" id="alert-success"
                        style="color: green;">비밀번호가 일치합니다.</span> <span
                        class="alert alert-danger" id="alert-danger" style="color: red;">비밀번호가
                        일치하지 않습니다.</span>
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>이름
                  </dt>
                  <dd>
                     <input class="validate required" size="30" type="text"
                        id="membername" name="membername" />
                  </dd>
               </dl>
                  	<div id="callBackDiv2">
               <dl>
                  <dt>
                     <span>*</span>닉네임 (최대 10글자이내)
                  </dt>

                  <dd>
                     <input class="left" size="30" type="text" id="membernick" name="membernick" readonly="membernick"/>
                     <input type="button" value="닉네임확인" onclick="nickCheck()" />
                     
                  </dd>
               </dl>
						</div>
               <dl>
                  <dt>
                     <span>*</span>성별
                  </dt>
                  <dd>
                     <select class="left" style="width: 70px; height: 25px"
                        id="membergender" name="membergender">
                        <option value="남성">남성</option>
                        <option value="여성">여성</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <div id="list"></div>
                  <div id="callBackDiv">
                     <dt>
                        <span>*</span>도로명주소
                     </dt>
                     <dd>
                        <input class="validate required" type="text" size="30"
                           id="roadAddrPart1" name="roadAddrPart1" readonly /> 
                        <input type="button" style="margin-left: 150px;" onClick="goPopup();"
                           value="주소찾기" />
                     </dd>
                     <dt>
                        <span>*</span>고객입력 상세주소
                     </dt>
                     <dd>
                        <input type="text" class="validate required" size="30"
                           id="addrDetail" name="addrDetail" readonly />
                     </dd>
                     <dt>
                        <span>*</span>지번
                     </dt>
                     <dd>
                        <input type="text" class="validate required" size="30"
                           id="jibunAddr" name="jibunAddr" readonly />
                     </dd>
                     <dt>
                        <span>*</span>우편번호
                     </dt>
                     <dd>
                        <input type="text" class="validate required" size="30"
                           id="zipNo" name="zipNo" readonly />
                     </dd>
                  </div>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>태어난년도 <select style="width: 100px; height: 30px;"
                        class="left" id="memberyear" name="memberyear">
                        <option>1970</option>
                        <option>1971</option>
                        <option>1972</option>
                        <option>1973</option>
                        <option>1974</option>
                        <option>1975</option>
                        <option>1976</option>
                        <option>1977</option>
                        <option>1978</option>
                        <option>1979</option>
                        <option>1980</option>
                        <option>1981</option>
                        <option>1982</option>
                        <option>1983</option>
                        <option>1984</option>
                        <option>1985</option>
                        <option>1986</option>
                        <option>1987</option>
                        <option>1988</option>
                        <option>1989</option>
                        <option>1990</option>
                        <option>1991</option>
                        <option>1992</option>
                        <option>1993</option>
                        <option>1994</option>
                        <option>1995</option>
                        <option>1996</option>
                        <option>1997</option>
                        <option>1998</option>
                        <option>1999</option>
                        <option>2000</option>
                        <option>2001</option>
                        <option>2002</option>
                        <option>2003</option>
                        <option>2004</option>
                        <option>2005</option>
                        <option>2006</option>
                        <option>2007</option>
                        <option>2008</option>
                        <option>2009</option>
                     </select>
                  </dt>

                  <dt>
                     <span>*</span>태어난월 <select style="width: 100px; height: 30px;"
                        class="left" id="membermonth" name="membermonth">
                        <option>1월</option>
                        <option>2월</option>
                        <option>3월</option>
                        <option>4월</option>
                        <option>5월</option>
                        <option>6월</option>
                        <option>7월</option>
                        <option>8월</option>
                        <option>9월</option>
                        <option>10월</option>
                        <option>11월</option>
                        <option>12월</option>
                     </select>
                  </dt>
                  <dt>
                     <span>*</span>태어난일 <select style="width: 100px; height: 30px;"
                        class="left" id="memberday" name="memberday">
                        <option>1일</option>
                        <option>2일</option>
                        <option>3일</option>
                        <option>4일</option>
                        <option>5일</option>
                        <option>6일</option>
                        <option>7일</option>
                        <option>8일</option>
                        <option>9일</option>
                        <option>10일</option>
                        <option>11일</option>
                        <option>12일</option>
                        <option>13일</option>
                        <option>14일</option>
                        <option>15일</option>
                        <option>16일</option>
                        <option>17일</option>
                        <option>18일</option>
                        <option>19일</option>
                        <option>20일</option>
                        <option>21일</option>
                        <option>22일</option>
                        <option>23일</option>
                        <option>24일</option>
                        <option>25일</option>
                        <option>26일</option>
                        <option>27일</option>
                        <option>28일</option>
                        <option>29일</option>
                        <option>30일</option>
                        <option>31일</option>
                     </select>
                  </dt>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>나이 <input type="text"
                        style="width: 30px; height: 15px;" id="memberage"
                        name="memberage" /> 세
                  </dt>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>연락처
                  </dt>
                  <dd>
                     <input class="validate required" size="30" type="tel"
                        id="membertel" name="membertel" /> ex)010-1111-1111
                  </dd>
               </dl>
               <dl>
                  <dt>
                     <span>*</span>이메일
                  </dt>
                  <dd>
                     <input class="validate required" size="30" type="email"
                        id="memberemail" name="memberemail" />
                  </dd>
               </dl>
              


               <button type="submit" id="submit" class="join"
                  style="width: 70px; margin-top: 15px; height: 25px;" onclick="return sel_event()">회원가입</button>
               <button type="button" class="cencle"
                  style="width: 70px; margin-top: 15px; height: 25px;" >취소</button>


            </form>
            <dl style="padding-top: 15px;">
               <dd>※ 회원가입 완료시 마이페이지에서 자세히 입력해주세요.</dd>
               <dd>※ 미 입력시 매칭 불이익은 책임지지 않습니다.</dd>
            </dl>

         </div>
      </div>
      <br />
      <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a class="sidemenu" href="joinview">회원가입</a>
  
   <c:if test="${not empty membernick }">
               <script type="text/javascript">
                  $(document).ready(function() {
                     $(".sidemenu").on("click", function() {
                        alert("로그아웃 후 이용할 수 있는 페이지입니다.");
                        return false;
                     });                 
                  });
                 
               </script>
       
            </c:if>
  <a href="map">찾아오시는길</a>
  <a href="#">방문상담신청</a>
  <a href="#">온라인상담</a>
</div>


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "200px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
      </div>
      
      <div id="footer">
		<a href="#">공지사항 </a>&nbsp;|
		<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
			href="">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">청소년보호정책</a> <br />(주)DAWON
		다원 COMPANY | 대표: 최현범, 이규정, 신유호, 신동욱  <br />사업자등록번호 xxx-xx-xxxxxxx |
		문의전화: xxx-xxxx-xxxx <br /> 영업시간: AM 09:00 ~ PM 17:00

	</div>
</body>
</html>