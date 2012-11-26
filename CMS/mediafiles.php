<?php
    /**
 * Indents a flat JSON string to make it more human-readable.
 *
 * @param string $json The original JSON string to process.
 *
 * @return string Indented version of the original JSON string.
 * visible in the console
 */
function indent($json) {

    $result      = '';
    $pos         = 0;
    $strLen      = strlen($json);
    $indentStr   = '  ';
    $newLine     = "\n";
    $prevChar    = '';
    $outOfQuotes = true;

    for ($i=0; $i<=$strLen; $i++) {

        // Grab the next character in the string.
        $char = substr($json, $i, 1);

        // Are we inside a quoted string?
        if ($char == '"' && $prevChar != '\\') {
            $outOfQuotes = !$outOfQuotes;
        
        // If this character is the end of an element, 
        // output a new line and indent the next line.
        } else if(($char == '}' || $char == ']') && $outOfQuotes) {
            $result .= $newLine;
            $pos --;
            for ($j=0; $j<$pos; $j++) {
                $result .= $indentStr;
            }
        }
        
        // Add the character to the result string.
        $result .= $char;

        // If the last character was the beginning of an element, 
        // output a new line and indent the next line.
        if (($char == ',' || $char == '{' || $char == '[') && $outOfQuotes) {
            $result .= $newLine;
            if ($char == '{' || $char == '[') {
                $pos ++;
            }
            
            for ($j = 0; $j < $pos; $j++) {
                $result .= $indentStr;
            }
        }
        
        $prevChar = $char;
    }

    return $result;
}
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
    $filetypes = array("png","gif","jpg","jpeg","mov","mp4",".ppt",".pptx");
    if ($filename == "." || $filename == "." || $filename[0] == ".")
        return false;
    $t = extension($filename);
    if (in_array($t, $filetypes) && has_period($filename))
        return true;
    
    return false;
}

//search dir and validate each item, then put into json array
if ($handle = opendir('fupload/server/php/files')) {
    $json = '{"files": [';

    while (false !== ($entry = readdir($handle))) {
        if (good_file($entry)){ 
            $json .= '{ "name" : "' . $entry . '", ';
            $json .= '"extension": "' . extension($entry) . '"},'; 
        }
    }

    closedir($handle);

    $json .= '{"name":"lastentry1337", "extension": "end"}  ]}';
    $json = indent($json);
    echo $json;
}
