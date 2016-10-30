<?php
function http_curl($url, $value=NULL,$is_post=0) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_POST, $is_post);
	if($is_post==1){
		curl_setopt($ch, CURLOPT_POSTFIELDS, $value);
	}
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	//curl_setopt($ch,CURLOPT_NETRC, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($ch, CURLOPT_VERBOSE, true);
	curl_setopt($ch,CURLOPT_USERPWD, '9712756d-415e-4123-925e-4bf3295b7e47:QAH0ewkTeUZClhtIDWFr26K9vTmWB0BuGD8wUQJ0Hft0ovTocTneik4FWO09k65b');
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/vnd.api+json','Accept: application/vnd.api+json'));
	$result=curl_exec($ch);
	echo curl_error($ch);
	return $result;
	curl_close($ch);
}
//echo var_dump(json_decode(arukas_curl('https://app.arukas.io/api/containers')));
$json=json_decode(http_curl('https://app.arukas.io/api/containers'));
//$json=json_decode(http_curl('https://github.com/'));
//echo http_curl('https://app.arukas.io/api/containers');
$data=$json->data;
$output='';
for($i=0;$i<count($data);$i++){
	$attr=$data[$i]->attributes;
	//echo $attr->port_mappings[0][0]->service_port;
	//echo $attr->port_mappings[0][0]->host;
	$port=$attr->port_mappings[0][0]->service_port;
	$host=$attr->port_mappings[0][0]->host;
	//$host=preg_replace('seaof-','1', $host);
	//$host=preg_replace('.jp-tokyo-(.*).arukascloud.io','1', $host);
	preg_match('/(\d+)-(\d+)-(\d+)-(\d+)/', $host,$matches);
	$host=str_ireplace('-', '.', $matches[0]);
	$output[$i]['host']=$host;
	$output[$i]['port']=$port;
	$output[$i]['url']='ss://' . base64_encode('aes-256-cfb:111111@' . $host . ':' . $port);
}
var_dump($output);
//file_put_contents('./ss.txt',json_encode($output));
//echo http_curl('http://localhost/test/ss54df/accept.php?ajzss=' . json_encode($output));
echo http_curl('http://ss.54df.top/accept.php?ajzss=' . json_encode($output));