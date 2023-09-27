<?php
// {"state" : true, "message" : "取得訂單資料成功", "data" : "訂單資料"}
// {"state" : false, "message" : "取得會員資料失敗"}
// {"state" : false, "message" : "查無訂單資料"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
require_once "../dbtools.php";

$conn = create_connect();

// 取得 member 資料表內的 id,username 等資料
$sql = "SELECT id, OrderNo, Username, Products, Quantities, Prices, Total, Realname, Phone, Address, Pay, CreateTime FROM orderlist ORDER BY id ASC";

$result = execute_sql($conn, 'bakery', $sql);

// 如果有此資料，將此資料以陣列形式存到 mydata
if (mysqli_num_rows($result) > 0) {
    $mydata = array();
    // 依序 id, username, realname 到 createtime將資料一筆筆丟進 $mydata 內
    while($row = mysqli_fetch_assoc($result)){
        $mydata[] = $row;
    }
    echo '{"state" : true, "message" : "取得訂單資料成功", "data" : '.json_encode($mydata).'}';
}else{
    echo '{"state" : false, "message" : "查無訂單資料"}';
}
mysqli_close($conn);
