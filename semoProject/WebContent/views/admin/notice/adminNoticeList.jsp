<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice, java.text.SimpleDateFormat,java.util.Date" %>  

<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date); // "2020-02-25"
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">

    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">공지사항 관리</h1>
                    <!--
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active">전체 회원 보기</li>
                    </ol>
                    -->
                    <br>
                    
                    <button class="btn btn-dark" type="button"><a style="color: white;" id="tr1">공지사항 작성</a></button>
                    &nbsp;
                    <button class="btn btn-dark" type="button"><a style="color: white;" id="tr2">공지사항 수정</a></button>
                    
                    
                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>공지사항 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                            
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>날짜</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    
                                    <% if(list.isEmpty()){ %>
									<tr>
										<td colspan="4"> 존재하는 공지사항이 없습니다.</td>
									</tr>
									<% }else{ %>
                                    
                                    	<% for(Notice n : list){ %>
                                    	<tr id="tr1">
                                            <td><input type="checkbox"></td>
                                            <td><%= n.getNoticeNo() %></td>
                                            <td><a href="#"><%= n.getNoticeTitle() %></a></td>
                                            <td><%= n.getNoticeDate() %></td>
                                        </tr>
                                        	<% } %>
										<% } %>	
										
                                    </tbody>
                                </table>

                                <button class="btn btn-danger" style="float: right;">삭제</button>
                                <!-- <input type="submit" class="btn btn-danger" style="float: right;" value="승인"> -->
                            </div>
                            
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Cookies</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    
        <!-- Modal1-->
    <form class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    action="<%=request.getContextPath()%>/ainsert.no" method="POST" >
        <div class="modal-dialog" id=insertNotice role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">공지사항 작성</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 제목</label>
                                <br>
                                <input type="text" name="title" >
                            </td>
                        </tr>
                        <tr>                            
                        	<td>
                                <label class="modal-title-font">공지사항 작성일</label>
                                <br>
                                <%=today%>
                            </td>
                        
                        </tr>

                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 내용</label>
                                <br>
                                <textarea style="resize:none" class="diyDiv" cols="50" rows="10" name = "content"> 
                                
                                
                                </textarea>
                                
                            </td>
                        </tr>

                    </table>                        
                </div>
                <div class="modal-footer">
                    <button type="sumbit" class="btn btn-primary">공지사항 작성하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                        
                </div>
            </div>
        </div>
    </form>

    <!-- Modal 2-->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    action=<%=contextPath %>/ainsert.no" method="post">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">공지사항 세부 내용</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 제목</label>
                                <br>
                                
                                
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 내용</label>
                                <br>
                                <div class="diyDiv" style="height: 150px;">
                                    편의성 개선은 안내는 공지사항에서 확인해
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label> 공지사항 수정 내용 </label>
                                <br>
                                <div style="height:250px;">
                                    	수정할 사항은 여기다가 입력
                                </div>
                            </td>
                        </tr>
                    </table>                        
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn1">공지사항 수정하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>                        
                </div>
            </div>
        </div>
    </div>

    

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>
<script>
    $(function() {
        $("#tr1").click(function() {
            $("#exampleModal").modal("show");
        });
    });
    $(function() {
        $("#tr2").click(function() {
            $("#exampleModal2").modal("show");
        });
    });
    
    
</script>
</body>
</html>