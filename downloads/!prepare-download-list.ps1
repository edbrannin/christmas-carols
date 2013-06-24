$regexTitle = [regex]'(?<=title = \\markup{\\override #''\(font-name . "Garamond Premier Pro Semibold"\){ \\abs-fontsize #18 \\smallCapsOldStyle")[^"]*(?=")';
$regexFileTitle = [regex]'(?<=\d+-).*(?=\.ly)';

$files = (dir *.midi)
$result = '{"name":"A Collection of Christmas Carols","tagline":"","body":"You can buy the finished book on Amazon.com [here](http://www.amazon.com/Collection-Christmas-Carols-Benjamin-Bloomfield/dp/1475217552/) or you can get the spiral bound edition through Lulu, [here](http://www.lulu.com/content/paperback-book/a-collection-of-christmas-carols-%2885x11%29/12933490).\r\n\r\nEventually, I may post individual PDFs, but I don''t have them right now.  The PDFs of the book as a whole are available in these formats:\r\n* [Tablet version (no margins)](http://acollectionofchristmascarols.com/pdfs/!playbook.pdf)\r\n* [6.14x9.21](http://acollectionofchristmascarols.com/pdfs/!!scribd%206.14.pdf)\r\n* [6x9](http://acollectionofchristmascarols.com/pdfs/!!scribd%206x9.pdf)\r\n* [8.5x11](http://acollectionofchristmascarols.com/pdfs/ccc.pdf)\r\n\r\nAnd here are the MIDIs:';
foreach ($_ in $files) {
  $title = $_.BaseName;
  $filename = $_.Name;
  $result += "\r\n* $title [(midi)](downloads/$filename)";
}
$result += '","google":"UA-41742275-1","note":"Don''t delete this file! It''s used internally to help with page regeneration."}';

[System.IO.File]::WriteAllLines('../params.json',$result);
#Set-Content -Path  -Value $result -Encoding UTF8

