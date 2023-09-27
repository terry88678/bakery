<?php
// {"state" : true, "message" : "取得產品資料成功", "data" : "產品資料"}
// {"state" : false, "message" : "取得產品資料失敗"}
// {"state" : false, "message" : "查無產品資料"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
require_once "../dbtools.php";

$conn = create_connect();

$sql = "SELECT * FROM product WHERE Category = '麵粉' AND Sell = 'true' ORDER BY Product";

$result = execute_sql($conn, 'bakery', $sql);

// 如果有此資料，將此資料以陣列形式存到 mydata
if (mysqli_num_rows($result) > 0) {
    $mydata = array();
    while($row = mysqli_fetch_assoc($result)){
        $mydata[] = $row;
    }
    echo '{"state" : true, "message" : "取得產品資料成功", "data" : '.json_encode($mydata).'}';
}else{
    echo '{"state" : false, "message" : "目前尚無此產品，敬請見諒"}';
}
mysqli_close($conn);