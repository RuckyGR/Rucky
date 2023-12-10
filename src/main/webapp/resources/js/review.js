function selRv(val){
   location.href = "/getReview.rev?rev_seq="+val;
}

$(document).ready(function(){ 

   $(".revDel").click(function(){
      let rev_test = confirm("정말로 삭제하시겠습니까?");
      if(rev_test){
         let s_w = $(this).prevAll("input[name=rev_seq_writer]").val();
         //alert(s_w);
         let s = parseInt(s_w.split("_")[0]);
         let w = s_w.split("_")[1];
         console.log(s, w);
         location.href = "deleteReview.rev?rev_seq="+ s +"&rev_writer="+w;
      } else {
           return false;
      }
   });
   
$(".revUpdate").click(function() {
    var confirmUpdate = confirm("정말로 수정하시겠습니까?");
    if (confirmUpdate) {
        var rating = $("input[name=rev_star]:checked").val();
        var writer = $("input[name=rev_writer]").val();
        var content = $("#comment").val();
        var filename = $("input[name=rev_filename]").val();
        var regdate = $("input[name=rev_regdate]").val();
    } else {
        return false;
    }
});

$(".revReport").click(function() {
    var confirmReport = confirm("정말로 신고하시겠습니까?");
    if (confirmReport) {
        var seq = $("input[name=rev_seq]:checked").val();
        var writer = $("input[name=rev_writer]").val();
        var revContent = $("input[name=rev_content]").val();
        var repContent = $("input[name=rep_content]").val();
    } else {
        return false;
    }
});
  

   $("#revWrite").click(function(){
      location.href = "insertReview.rev";
   });
   
   $("#revList").click(function(){
      location.href = "getReviewList.rev";
   });
});
   