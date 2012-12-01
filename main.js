  var format = {

    //take the content of each descriptor div, and put it into a data-role=page format. simple reformatting.
    pages: function() { 

      var content = $("[data-page]");
      var pages = content.length;
      var pages_to_append = "";

      for (var i = 0; i < pages; i++) {

        pages_to_append += "<div data-role='page' id='" + content.eq(i).attr("data-page") + "'>";
        pages_to_append += "<div data-role='header' data-theme='b'><h1>Beginner's Guide to Dental Implant Prosthodontics</h1></div>";
        pages_to_append += "<div data-role='content'>";
        pages_to_append += content.eq(i).html();
        pages_to_append += "</div></div>";

      }

      console.log(pages_to_append);
      return pages_to_append;

    },

    linkPages: function()  {

      // for non accordion, get the anchor, and the find the closest page to it. append that pages number to its href
      $("h3").find(".goToPage").each(function() {

        var $this = $(this);
        var pair = $this.closest("h3").next(".descriptor").attr("data-page");
        $this.attr("href","#" + pair);

      });

      //same as above, except with accordion
      $("li").find(".goToPage").each(function() { 

        var $this = $(this);
        var pair = $this.closest("li").next(".descriptor").attr("data-page");
        $this.attr("href","#" + pair);

        // for the last list item, the descriptor is appended after, so the lookup is slightly different
        if ($this.closest("li").hasClass("last-li")){

          pair = $this.closest("[data-role=collapsible]").next(".descriptor").attr("data-page");
          $this.attr("href","#" + pair);          

        }

      });

      //finally, remove the descriptor elements.
      $(".relative.descriptor").each(function() { 

        $(this).remove();

      });


    }
};

//first line lets things work on first page load, no need for refresh.
$(document).bind("mobileinit",function () {

  $.mobile.page.prototype.options.domCache = true;

}).one('pagecreate', function (event) {

  //make the separate page views for content
  $(format.pages()).appendTo($("body"));
  //lin each list item to the next content item
  format.linkPages();

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


  $("[data-icon*='arrow'] a").each(function() {


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

