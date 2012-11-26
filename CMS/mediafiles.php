<?php
    
//returns file extn, png, gif, jpg, mov, mp4, etc
function extension($file_name) {
  return substr(strrchr($file_name,'.'),1);
}
//boolean: returns true if string has a period. used to test for directory or file
function has_period($str) { 
   return !(strpos ($str,"." ) === FALSE); 
}

//only certain filetypes and names are accepted, also no directories.
function good_file($filename) { 
    $filetypes = array("png","gif","jpg","jpeg","mov","mp4");
    if ($filename == "." || $filename == "." || $filename[0] == ".")
        return false;

    $t = extension($filename);
    if (in_array($t, $filetypes) && has_period($filename))
        return true;
    
    return false;
}

//search dir and validate each item, then put into json array
if ($handle = opendir('fupload/server/php/files')) {
    echo '{"files": [';

    while (false !== ($entry = readdir($handle))) {
        if (good_file($entry)){ 
            echo '{ "name" : "' . $entry . '", ';
            echo '"extension": "' . extension($entry) . '"},'; 
        }
    }

    closedir($handle);

    echo '{"name":"lastentry1337", "extension": "end"}  ]}';
}
