//first line lets things work on first page load, no need for refresh.
$(document).delegate('.ui-page', 'pagecreate', function () {

  function globals() { 

    this.contentCount = 0;

  }
  var globe = new globals();

//the list of conditions on the procedures page goes to that condition's specific page.
	$("[name=condition]").bind("click",function() { 

		$(this).closest("form").submit();
    return false;

	});

//the top right select menu with procedures and appendix.
	$("#nav").live("change",function() {
	    var page = $(this).val();
	    window.location = page;
      return false;
	});

//goes to ajax call, submits step2.php, the condition name (edentulism in the first case), and the id of the subsection of edentulism
	$("[name=case]").bind("click",function() { 

		var fieldset = $(this).closest("fieldset"); 
		makeRequest(fieldset.attr("data-submission"),fieldset.attr("data-condition"), $(this).attr("id"));
    return false;

	});

//the button formatting given by the designer did not allow input type = submit for some reason. Workaround
	$("#continue").die("tap").live("tap",function() { 

		$(this).closest("form").submit();
    return false;

	});

  $(".content").each(function() {
/*$(this).closest("li").find("a").html();*/
    var header = '<a data-rel="back" data-icon="back"   data-iconpos="notext">Back</a>'; 
    header +=  "<h1>Beginner's Guide to Dental Implant Prosthodontics</h1>";
    var information = "<div data-role='page' id='page" + globe.contentCount++
     + "'><div data-role='header' data-theme='b'>" + header + "</div><div data-role='content'>" + $(this).html() + "</div>";
    
      $("body").append(information).trigger("create");
      
      //now that we have appended the page, remove the incorrectly formatted content.
      $(this).remove();
  });

    globe.contentCount = 0;

  $("[data-icon*='arrow'] a").each(function() {

      $(this).attr("href","#page" + globe.contentCount++);

  });


//Thanks to MDN for all the browser specifics
function makeRequest(url, condition,id) { 

  		//make sure ajax works in all browsers...mdn
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...  
      httpRequest = new XMLHttpRequest();  
    } else if (window.ActiveXObject) { // IE  
      try {  
        httpRequest = new ActiveXObject("Msxml2.XMLHTTP");  
      }   
      catch (e) {  
        try {  
          httpRequest = new ActiveXObject("Microsoft.XMLHTTP");  
        }   
        catch (e) {}  
      }  
    }  
    if (!httpRequest) {  
      alert('Giving up :( Cannot create an XMLHTTP instance');  
      return false;  
    }  
    //change the page state
    httpRequest.onreadystatechange = alertContents;  
    httpRequest.open('POST', url);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	//send the data, which is interpreted by php. no matter what, the form is sent, even if incomplete. In this case, 
	//php decides what to do with the info. If incomplete, it does nothing.
    httpRequest.send("&case=" + encodeURIComponent(id) + "&condition=" + encodeURIComponent(condition));

  }  
//insert response text into ajaxcontent box, and show the continue button, cause now we're ready to GO!
function alertContents() {
  try {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200) {
        //show the ajax box with the html from step 3 in it. Trigger create is used to apply the jqmobile styles to the returned html
      	$(".ajaxContent").show().html(httpRequest.responseText).fadeIn("fast").trigger("create") ;
      	$("#continue").show();

      } else {
        alert('There was a problem with the request.');
      }
    }
  }
  catch( e ) {
    alert('Caught Exception: ' + e.description);
  }
}
 

});

