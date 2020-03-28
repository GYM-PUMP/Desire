$(document).ready(function(){
	// var apoint= $(".gym-img")
	// var bpoint= $(".gym-space")
	// var reapoint = Number(apoint.attr('id').split('-')[1])
	var row_div = $(".gym-img")
	var row_div2 = $(".gym-space")
	for (var i=0; i < row_div.length; i++){
	  var reapoint = Number(row_div[i].id.split('-')[1])
	  if ((reapoint % 2) == 0){
	      row_div[i].before(row_div2[i])
	  }
	}
});