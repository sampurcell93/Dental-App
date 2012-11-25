<?php
    
//returns file extn, png, gif, jpg, mov, mp4, etc
function extension($file_name) {
  return substr(strrchr($file_name,'.'),1);
}
//boolean: returns true if string has a period. used to test for directory or file
function has_period($string) { 

    for ($i = 0; i < strlen($string); $i++) { 

        if($string[$i] == ".") { return true; }
    }
    return false;

}

if ($handle = opendir('fupload/server/php/files')) {
    echo '{"files": [';

    /* This is the correct way to loop over the directory. */
    while (false !== ($entry = readdir($handle))) {
        if ($entry != "." && $entry != ".." && $entry[0] != "." ){//&& has_period($entry)) { 
            echo '{ "name" : "' . $entry . '", ';
            echo '"extension": "' . extension($entry) . '"},'; 
        }
    }

    closedir($handle);

    echo '{"name":"lastentry1337", "extension": "end"}  ]}';
}
