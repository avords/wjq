//process message
function ProcessMsg(flag){
	var obj=document.getElementById("processing");
	if(obj!=null){
		if(flag==1)
			obj.style.visibility = "visible";
		else
			obj.style.visibility = "hidden";
	}
}
function disableRightClick(e)
{
  var message = "Right click disabled";
  
  if(!document.rightClickDisabled) // initialize
  {
    if(document.layers) 
    {
      document.captureEvents(Event.MOUSEDOWN);
      document.onmousedown = disableRightClick;
    }
    else document.oncontextmenu = disableRightClick;
    return document.rightClickDisabled = true;
  }
  if(document.layers || (document.getElementById && !document.all))
  {
    if (e.which==2||e.which==3)
    {
      //alert(message);
      return false;
    }
  }
  else
  {
    //alert(message);
    return false;
  }


}
//disableRightClick();
