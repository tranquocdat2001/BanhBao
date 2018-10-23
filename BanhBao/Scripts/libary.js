function openpreview(sUrl,w,h)
{	
	var winX = 0;
    var winY = 0;
    if (parseInt(navigator.appVersion) >= 4)
    {
	    winX = (screen.availWidth - w)*.5;
	    winY = (screen.availHeight - h)*.5;
    }
    var newWindow = window.open(sUrl, '', 'scrollbars,resizable=yes,status=yes, width=' + w + ',height=' + h + ',left=' + winX + ',top=' + winY);
}

