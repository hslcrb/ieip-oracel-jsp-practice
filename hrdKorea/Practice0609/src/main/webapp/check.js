function chk(){
	if(documen.frm.do_date.value==""){
		alert("일자가 등록되지 않았습니다.");
		document.frm.do_date.focus();
		return false
	}
	if(documen.frm.do_date.value==""){
		alert("회원번호를 입력하지 않고 무엇했느냐. 다시하거라.");
		document.frm.fk_member.focus();
		return false
	}
	if(documen.frm.do_date.value==""){
		alert("메모를 입력하거라.");
		document.frm.do_memo.focus();
		return false
	}
}



/** I HAVE A PEN, I HAVE AN APLLE. OH! APPLE PEN. */
/** I HAVE A PEN, I HAVE AN PINEAPLLE. OH! PINEAPPLE PEN. */
/** APPLE PNE, PINEAPPLE PEN. OH!*/
/** PEN PINEAPPLE APPLE PEN.*/