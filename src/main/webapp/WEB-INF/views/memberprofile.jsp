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
<title>mypage</title>
<link rel="stylesheet" href="resources/css/mstyle.css" />
<link type="text/css" rel="stylesheet" href="resources/css/join.css" />
<link rel="stylesheet" href="resources/css/sidemenu.css" />
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
       $(".cencle").on("click", function() {
          history.back();
       });
    });
</script>
<body>
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
            </div>
         </div>
      </div>

      <div id="contents1">
         <div id="contents2">
            <form action="profileproc" method="post"  enctype="multipart/form-data">
               <input type="hidden" id="memberid" name="memberid"
                  value="${prop.memberid }" />

               <dl>
                  <dt>
                     <span style="font-size: 35px; font-style: BOLD;">기본정보</span>
                  </dt>
               </dl>
               <dl>
                  <dt>아이디</dt>
                  <dd>
                     <input class="validate required" size="30" type="text"
                        id="memberid" name="memberid" readonly="${prop.memberid}"
                        value="${prop.memberid}" />
                  </dd>
               </dl>
               <dl>
                  <dt>닉네임 (최대 10글자이내)</dt>
                  <dd>
                     <input class="validate required" size="30" type="text"
                        id="membernick" name="membernick" value="${prop.membernick}" />
                  </dd>
               </dl>
               <dl>
                  <dt>종교</dt>
                  <dd>
                     <select style="width: 100px; height: 30px;" class="left"
                        id="memberreligion" name="memberreligion">
                        <option>무교</option>
                        <option>기독교</option>
                        <option>천주교</option>
                        <option>힌두교</option>
                        <option>불교</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>흡연여부</dt>
                  <dd>
                     <select style="height: 30px;" class="left" id="membersmok"
                        name="membersmok">
                        <option>흡연</option>
                        <option>비흡연</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>직업</dt>
                  <dd>
                     <input class="left" type="text" id="memberjob" size="30"
                        name="memberjob" value="${prop.memberjob}" /> ex)공무원
                  </dd>
               </dl>
               <dl>
                  <dt>성격</dt>
                  <dd>
                     <input class="left" type="text" size="30" id="memberpersonality"
                        name="memberpersonality" value="${prop.memberpersonality}" />ex)밝은
                     성격
                  </dd>
               </dl>
               <dl>
                  <dt>이상형</dt>
                  <dd>
                     <input class="left" type="text" size="30" id="memberideal"
                        name="memberideal" value="${prop.memberideal}" />ex)깔끔한 스타일
                  </dd>
               </dl>
               <dl>
                  <dt>연봉</dt>
                  <dd>
                     <input class="left" type="text" size="30" id="membersal"
                        name="membersal" value="${prop.membersal}" />만원 (숫자만 입력해주세요)
                  </dd>
               </dl>
               <dl>
                  <dt>혈액형</dt>
                  <dd>
                     <select style="width: 100px; height: 30px;" class="left"
                        id="memberblood" name="memberblood">
                        <option>A형</option>
                        <option>B형</option>
                        <option>O형</option>
                        <option>AB형</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>안경착용</dt>
                  <dd>
                     <select style="width: 100px; height: 30px;" class="left"
                        id="memberglasses" name="memberglasses"
                        value="${prop.memberglasses}">
                        <option>착용</option>
                        <option>미착용</option>
                     </select>
                  </dd>
               </dl>
               <dl>
                  <dt>학력</dt>
                  <dd>
                     <input class="left" type="text" size="30" id="memberschool"
                        name="memberschool" value="${prop.memberschool}" />ex)대졸
                  </dd>
               </dl>
               <dl>
                  <dt>자기소개</dt>
                  <dd>
                     <textarea rows="10" cols="30" id="membercontent"
                        name="membercontent">${prop.membercontent}</textarea>
                  </dd>
               </dl>
               <dl>
                  <dt>프로필 사진 (선택)</dt>
                  <dd>
                     <input type="file" style="width: 800px; height: 30px;"
                        id="filesrc" name="filesrc" size="30" />
                  </dd>
               </dl>


               <button type="submit" id="submit" style="width: 70px; height: 25px">수정완료</button>
               <button class="cencle" style="width: 70px; height: 25px"
                  type="button">취소</button>

            </form>
            <dl style="padding-top: 15px;">
               <dd>※ 마이페이지를 전부 작성해주세요.</dd>
               <dd>※ 미 입력시 매칭에 불이익이 있을 수 있습니다.</dd>
            </dl>
         </div>
      </div>
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