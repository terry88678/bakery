<?php
// {"state" : true, "message" : "取得會員資料成功", "data" : "會員資料"}
// {"state" : false, "message" : "取得會員資料失敗"}
// {"state" : false, "message" : "查無會員資料"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["orderno"]) && isset($_POST["phone"])) {
    if ($_POST["orderno"] != "" && $_POST["phone"] != "") {
        $p_orderno = $_POST["orderno"];
        $p_phone = $_POST["phone"];

        require_once "../dbtools.php";

        $conn = create_connect();

        // 取得 Uid = xxx 的 id,username 等資料
        $sql = "SELECT id, OrderNo, Username, Products, Quantities, Prices, Total, Realname, Phone, Address, Pay, CreateTime FROM orderlist WHERE OrderNo = '$p_orderno' AND Phone = '$p_phone'";

        $result = execute_sql($conn, 'bakery', $sql);

        // 如果有找到符合此筆的資料，將此資料以陣列形式存到 mydata
        if (mysqli_num_rows($result) == 1) {
            $mydata = mysqli_fetch_assoc($result);

            echo '{"state" : true, "message" : "取得訂單資料成功", "data" : ' . json_encode($mydata) . '}';
        } else {
            echo '{"state" : false, "message" : "查無訂單"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
