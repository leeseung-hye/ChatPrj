<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');
</style>
<meta charset="UTF-8">
<title>요청 폼</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(function(){
   $("input[type=button]").click(function(){
      console.log();
      var form = $("#fileUploadForm")[0];
      //제이쿼리는 자바스크립트처럼 queryselector, queryselectorAll 이 없다.
      //제이쿼리 객체는 기본적으로 queryselectorAll 로 반환이 되는데, 배열로 반환되기 때문에, [0] 명시
      console.log("form "+form);
      //var form1 = $("#fileUploadForm")[1];
      //console.log("form1 "+form1);
      var form_data = new FormData(form);
      console.log(form_data);
      $("input[type=button]").prop("disabled", false);
      $.ajax({
         url: "http://192.168.111.128:5000/test1",
         async: true,
         //비동기요청
         type:"POST",
         data: form_data,
         //서버로 보낼 데이터
         processData:false,
         contentType:false,
         success:function(data, status, xhr){
            console.log("data: "+data);
            console.log("status: "+status);
            console.log("xhr: "+xhr);
            $("#result").text(JSON.stringify(data));
            //타회사 서버의 REST API에서 받은 JSON을 string 형변환 후 출력
            $("input[type=button]").prop("disabled",false);
            //false면 버튼 재사용 가능 true면 버튼 재사용 불가능
         },
         error:function(e, status, xhr){
            console.log("ERROR : ", e);
            alert("fail");
         }         
      })
   })
   
   $("input[type=button2]").click(function(){
      console.log();
      var form = $("#chatview")[0];
      //제이쿼리는 자바스크립트처럼 queryselector, queryselectorAll 이 없다.
      //제이쿼리 객체는 기본적으로 queryselectorAll 로 반환이 되는데, 배열로 반환되기 때문에, [0] 명시
      console.log("form "+form);
      //var form1 = $("#fileUploadForm")[1];
      //console.log("form1 "+form1);
      var form_data = new FormData(form);
      console.log(form_data);
      $("input[type=button2]").prop("disabled", false);
      $.ajax({
         url: "http://192.168.111.128:5000/test1",
         async: true,
         //비동기요청
         type:"get",
         data: form_data,
         //서버로 보낼 데이터
         processData:false,
         contentType:false,
         success:function(data, status, xhr){
            console.log("data: "+data);
            console.log("status: "+status);
            console.log("xhr: "+xhr);
            $("#result").text(JSON.stringify(data));
            //타회사 서버의 REST API에서 받은 JSON을 string 형변환 후 출력
            $("input[type=button2]").prop("disabled",false);
            //false면 버튼 재사용 가능 true면 버튼 재사용 불가능
         },
         error:function(e, status, xhr){
            console.log("ERROR : ", e);
            alert("fail");
         }
      })
   })
});
</script>
    <style>
    
.header { font-size: 14px; padding: 15px 0; background: #3B1F06; color: white; text-align: center;  }
.flex-container {
   width: 410px;
   height: 55vh;
   display: relative;
   margin-bottom: -80px;
   -webkit-box-align: center;
   -moz-box-align: center;
   -ms-flex-align: center;
   align-items: center; /* 수직 정렬 */
   -webkit-box-pack: center;
   -moz-box-pack: center;
   -ms-flex-pack: center;
   justify-content: center; /* 수평 정렬 */
   margin: auto;
   margin-top: 200px;
  
   font-family: 'Press Start 2P', cursive;
}

.hr-sect {
   display: flex;
   flex-basis: 3%;
   align-items: center;
   color: rgba(0, 0, 0, 0.35);
   /*    font-size: 12px; */
   margin: 8px 0px;
   font-size: 25px;
   margin-bottom: 20px;
   line-height: 0;
}

.hr-sect:before, .hr-sect:after {
   content: "";
   flex-grow: 1;
   background: rgba(0, 0, 0, 0.35);
   height: 1px;
   font-size: 0px;
   line-height: 0px;
   margin: 0px 16px;
}

.chat-box {
   background-color: #9bbbd4;
   color: grey;
   width: 400px;
   height: 500px;
   /* padding: 150px; */
   border: 3px;
   max-height: 600px;
   overflow-y: scroll;
   /* padding-block: 250px; */
   display: flex;
   flex-direction: column;
}

.container-1 {
   width: 100%;
   display: flex;
   margin-bottom: -80px;
   -webkit-box-align: center;
   align-items: center; /* 수직 정렬 */
   -webkit-box-pack: center;
   justify-content: center; /* 수평 정렬 */
   margin-top: 10px;
}

.container-1 input#data {
   width: 300px;
   height: 25px;
   color: yellow;
   background: white;
   border-color: currentColor;
   font-size: 13pt;
   float: left;
   padding-left: 35px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

.button {
   padding-left: 17px;
}

.chat_content{
	margin-top:3%;
}

</style>
 
</head>
<body>

<div class="flex-container">

      <div class="chat-box">      
         <div>         
            	<div class="header">
       				 CHAT
    			</div><br/>
            <div class="hr-sect" style=" font-size: 11px;">2022년 12월 2일 금요일 </div><br/>
               <!-- <input type="button" id="button2" value="5" />  -->                
               <c:forEach var="req" items="${reqResult}">               	
               	<div class="chat_content">
					익명: ${req}
				</div><br/>							
				</c:forEach>
         </div>
      </div>
 
   <div class="container-1">
      <form method="post" enctype="multipart/form-data" id="fileUploadForm">
         <!-- <input type="text" name="data"  style="width: 450px;" value="Press Enter for send message">  -->
         <input type="text" id="data" name="data"
            style="width: 260px; color: black;" placeholder="Send message.."/>
         <span class="button"><input type="button"
            style="background-color: #3B1F06; width: 60px; color: white; border-radius: 8px; height: 30px;"
            value="SEND"></span>

      </form>
   </div>
</div>
   <!--    <div id="result">여기에 요청 결과가 출력되어야 합니다.</div> -->

</body>
</html>