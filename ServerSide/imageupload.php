<?php
//get image
$image = $_POST["image"];
//replace spaces with +
$data = str_replace(" ","+",$image);
//decoding base 64
$data = base64_decode($data);
//saving file as image
file_put_contents("image.jpeg",$data);
//sending respaonce back
echo "done";
 ?>
