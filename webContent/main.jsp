<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ page import="java.io.PrintWriter" 
%><%@ page import="bbs.BbsDAO" 
%><%@ page import="bbs.Bbs" 
%><%@ page import="java.util.ArrayList" 
%><%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList" %><!DOCTYPE html>
<% 
	int pageNumber = 1; //기본은 1 페이지를 할당
	// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
	// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
	if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
} %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>알바선배</title>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script defer src="./js/scripts.js"></script>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body>
    <%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">알바선배</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <%
					// 로그인 하지 않았을 때 보여지는 화면
					if(userID == null){
				%>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a></li>
                        <!--<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>-->
                    </ul>
                <%
					// 로그인이 되어 있는 상태에서 보여주는 화면
					}else{
				%>
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="logoutAction.jsp">로그아웃</a></li>
                        <!--<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>-->
                    </ul>
				<%
					}
				%>
                </div>
            </div>
        </nav>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">알바선배에 오신걸 환영합니다</h1>
                    <p class="lead mb-0">알바선배란? ~~~</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <div class="w3-content w3-display-container" style="max-width:853px">
						  <img class="mySlides" src="./img/exam1.png" style="width:100%">
						  <img class="mySlides" src="./img/exam2.png" style="width:100%">
						  <img class="mySlides" src="./img/exam3.png" style="width:100%">
						  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
						    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
						    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
						    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
						    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
						    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
						  </div>
						</div>
                    </div>
                    <!-- Nested row for non-featured blog posts-->
        			<div class="row">
        				 <%
	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	evaluationList = new EvaluationDAO().evaluationList();
	if(evaluationList != null)
	for(int i = 0; i < evaluationList.size(); i++) {
		if(i == 5) break;
		EvaluationDTO evaluation = evaluationList.get(i);
%>
	<div class="col-lg-6">
     <div class="card mb-4">
      <div class="card bg-light mt-3">
        <div class="card-header bg-light">
          <div class="row">
            <div class="col-8 text-left"><%=evaluation.getLectureName()%>&nbsp;<small><%=evaluation.getProfessorName()%></small></div>
            <div class="col-4 text-right">
              종합 <span style="color: red;"><%=evaluation.getTotalScore()%></span>
            </div>
          </div>
        </div>
        <div class="card-body">
          <h5 class="card-title">
            <small>(<%=evaluation.getLectureYear()%>년 <%=evaluation.getSemesterDivide()%>)</small>
          </h5>
          <p class="card-text"><%=evaluation.getEvaluationContent()%></p>
          <div class="row">
            <div class="col-9 text-left">
              만족도 <span style="color: red;"><%=evaluation.getCreditScore()%></span>
              일의 강도 <span style="color: red;"><%=evaluation.getComfortableScore()%></span>
              종류 <span style="color: red;"><%=evaluation.getLectureScore()%></span>
              <span style="color: green;">(추천: <%=evaluation.getLikeCount()%>)</span>
            </div>
            <div class="col-3 text-right">
              <a onclick="return confirm('추천하시겠습니까?')" href="likeAction.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">추천</a>
              <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction2.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">삭제</a>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
<%
	}
%>
    </div>
<%
	evaluationList = new EvaluationDAO().evaluationList();
	if(evaluationList != null)
	for(int i = 0; i < evaluationList.size(); i++) {
		if(i == 5) break;
		EvaluationDTO evaluation = evaluationList.get(i);
%>
      <div class="card bg-light mt-3">
        <div class="card-header bg-light">
          <div class="row">
            <div class="col-8 text-left"><%=evaluation.getLectureName()%>&nbsp;<small><%=evaluation.getProfessorName()%></small></div>
            <div class="col-4 text-right">
              종합 <span style="color: red;"><%=evaluation.getTotalScore()%></span>
            </div>
          </div>
        </div>
        <div class="card-body">
          <h5 class="card-title">
            <small>(<%=evaluation.getLectureYear()%>년 <%=evaluation.getSemesterDivide()%>)</small>
          </h5>
          <p class="card-text"><%=evaluation.getEvaluationContent()%></p>
          <div class="row">
            <div class="col-9 text-left">
              만족도 <span style="color: red;"><%=evaluation.getCreditScore()%></span>
              일의 강도 <span style="color: red;"><%=evaluation.getComfortableScore()%></span>
              종류 <span style="color: red;"><%=evaluation.getLectureScore()%></span>
              <span style="color: green;">(추천: <%=evaluation.getLikeCount()%>)</span>
            </div>
            <div class="col-3 text-right">
              <a onclick="return confirm('추천하시겠습니까?')" href="likeAction.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">추천</a>
              <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction2.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">삭제</a>
            </div>
          </div>
        </div>
      </div>
<%
	}
%>
    </div>
                    <!-- Pagination-->
                  <!--   <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav> -->
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">카테고리</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="bbs.jsp">#자유게시판</a></li>
                                        <li><a href="exam.jsp">#대타평가</a></li>
                                        <li><a href="#!">#대타구직</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#">#마이페이지</a></li>
                                        <li><a href="exam2.jsp">#알바리뷰</a></li>
                                        <li><a href="#!"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">최근게시글</div>
                        <div class="card-body">
                            <div class="row">
                                <table class="d-sm-table" style="text-align: center;">
									<!-- <thead>
										<tr>
											<th>style="background-color: #eeeeee; text-align: center;"번호</th>
											<th>style="background-color: #eeeeee; text-align: center;"제목</th>
											<th>style="background-color: #eeeeee; text-align: center;"작성자</th>
											<th>style="background-color: #eeeeee; text-align: center;"작성일</th>
										</tr>
									</thead> -->
									<tbody>
									<%
										BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
										ArrayList<Bbs> list = bbsDAO.getTimeList(pageNumber);
										for(int i = 0; i < list.size(); i++){
									%>
										<tr>
											<%-- <td><%= list.get(i).getBbsID() %></td> --%>
											<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
											<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
												<%= list.get(i).getBbsTitle() %></a></td>
											<%-- <td><%= list.get(i).getUserID() %></td> --%>
											<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
												+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
										</tr>
									<%
										}
									%>	
									</tbody>
							</table>	
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright ⓒ 2021 알바선배 All Rights Reserved.</p></div>
        </footer>
        <!-- 슬라이더 -->
         <script>
			var slideIndex = 1;
			showDivs(slideIndex);
			
			function plusDivs(n) {
			  showDivs(slideIndex += n);
			}
			
			function currentDiv(n) {
			  showDivs(slideIndex = n);
			}
			
			function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("demo");
			  if (n > x.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			    dots[i].className = dots[i].className.replace(" w3-white", "");
			  }
			  x[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " w3-white";
			}
		</script>
		<script>
			const searchEl = document.querySelector('.search')
			const searchinputEl = document.querySelector('input')
	
			searchEl.addEventListener('click', function() {
			    searchinputEl.focus()
			})
	
			searchinputEl.addEventListener('focus', function() {
			    searchEl.classList.add('focused')
			    searchinputEl.setAttribute('placeholder', '통합검색')
			})
	
			searchinputEl.addEventListener('blur', function() {
			    searchEl.classList.remove('focused')
			    searchinputEl.setAttribute('placeholder', '')
			})
		</script>
    </body>
</html>
