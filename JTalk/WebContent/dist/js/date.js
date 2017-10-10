// 데이트 피커
var maxDate = new Date();
var dd = maxDate.getDate() + 15;
maxDate.setDate(dd);

$('#datepicker').datepicker({
    	autoclose: true,
    	endDate: maxDate
  })
// 데이트 레인지 피커
    $('#reservation').daterangepicker({
	  "locale": {
	        "format": "YYYY-MM-DD",
	        "separator": " ~ ",
	        "autoUpdateInput": false,
	        "applyLabel": "적용",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 1
	    }
  });