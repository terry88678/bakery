<?php
// {"state" : true, "message" : "取得會員資料成功", "data" : "會員資料"}
// {"state" : false, "message" : "取得會員資料失敗"}
// {"state" : false, "message" : "查無會員資料"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["username"])) {
    if ($_POST["username"] != "") {
        $p_username = $_POST["username"];

        require_once "../dbtools.php";

        $conn = create_connect();

        // 取得 Uid = xxx 的 id,username 等資料
        $sql = "SELECT id, OrderNo FROM orderlist WHERE Username = '$p_username' ORDER BY id DESC";

        $result = execute_sql($conn, 'bakery', $sql);

        // 如果有找到符合此筆的資料，將此資料以陣列形式存到 mydata
        if (mysqli_num_rows($result) > 0) {
            $mydata = mysqli_fetch_assoc($result);
            echo '{"state" : true, "message" : "取得訂單資料成功", "data" : '.json_encode($mydata).'}';
        }else{
            echo '{"state" : false, "message" : "取得訂單資料失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}