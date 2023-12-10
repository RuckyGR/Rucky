$(document).ready(function(){ 
   $("#qnaWrite").click(function(){
      location.href = "insertQna.qna";
      });
   
   $("#qnaDel").click(function(){
      let qna_test = confirm("정말로 삭제하시겠습니까?");
      if(qna_test == true){
         let s = document.fm.qna_seq.value;
         let w = document.fm.qna_writer.value;
         location.href = "deleteQna.qna?qna_seq="+s+"&qna_writer="+w;
      }
      else if(qna_test == false){
           return false;
      }
   });
   $("#aqnaDel").click(function(){
      let qna_test = confirm("정말로 삭제하시겠습니까?");
      if(qna_test == true){
         let s = document.fm.qna_seq.value;
         let w = document.fm.qna_writer.value;
         location.href = "adeleteQna.qna?qna_seq="+s+"&qna_writer="+w;
      }
      else if(qna_test == false){
           return false;
      }
   });
   
      $("#qnaList").click(function(){
      location.href = "u_getQnaList.qna";
   });
   
      $("#aqnaList").click(function(){
      location.href = "a_getQnaList.qna";
   });
   
   $("#qnaUpdate").click(function(){
      location.href = "updateQna.qna";
   });
   });
   
   
function selQna1(val){
	   location.href = "/getQna.qna?qna_seq="+val;
}
function selQna2(val){
	   location.href = "/getQnaRepl.qna?qna_seq="+val;
}

	var qnaNo;
	
	function pwChk(qnaNo) {
		$.ajax({
			url: "/getQnaPass.qna",
			type : "post",
			data : {"qna_seq": qnaNo},
			cache : false,
			success : function(qnaPwd){
				if(qnaPwd != ''){
					var inputPwd = prompt('게시글 비밀번호를 입력해주세요.');
				
					if(qnaPwd ==inputPwd){
						location.href = "getQna.qna?qna_seq="+qnaNo;
					} else {
						alert("비밀번호가 틀렸습니다.");
					}
				}else {
					location.href = "getQna.qna?qna_seq="+qnaNo;
				}
			},
			error : function(){
			}
		});
	}