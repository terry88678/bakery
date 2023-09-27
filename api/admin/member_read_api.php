<?php
// {"state" : true, "message" : "取得會員資料成功", "data" : "會員資料"}
// {"state" : false, "message" : "取得會員資料失敗"}
// {"state" : false, "message" : "查無會員資料"}

require_once "../dbtools.php";

$conn = create_connect();

// 取得 member 資料表內的 id,username 等資料
$sql = "SELECT id, Username, Realname, Birthday, Phone, Email, CreateTime, Uid01, UserState, IsAdmin FROM member ORDER BY id ASC";

$result = execute_sql($conn, 'bakery', $sql);

// 如果有此資料，將此資料以陣列形式存到 mydata
if (mysqli_num_rows($result) > 0) {
    $mydata = array();
    // 依序 id, username, realname 到 createtime將資料一筆筆丟進 $mydata 內
    while($row = mysqli_fetch_assoc($result)){
        $mydata[] = $row;
    }
    echo '{"state" : true, "message" : "取得會員資料成功", "data" : '.json_encode($mydata).'}';
}else{
    echo '{"state" : false, "message" : "查無會員資料"}';
}
mysqli_close($conn);
