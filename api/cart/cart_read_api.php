<?php
// {"state" : true, "message" : "取得購物車資料成功", "data" : "購物車資料"}
// {"state" : false, "message" : "取得購物車資料失敗"}
// {"state" : false, "message" : "查無會員資料"}

header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["uid"])) {
    if ($_POST["uid"] != "") {
        $uid = $_POST["uid"];

        require_once "../dbtools.php";

        $conn = create_connect();

        // 取得 Uid = xxx 的 id,uid 等資料
        $sql = "SELECT cart.*, product.Photo, member.Uid01, member.Username, member.Realname, member.Phone FROM cart LEFT JOIN product ON cart.Product = product.Product LEFT JOIN member ON cart.Username = member.Username WHERE member.Uid01 = '$uid';";

        $result = execute_sql($conn, 'bakery', $sql);

        // 如果有找到符合此筆的資料，將此資料以陣列形式存到 mydata
        if (mysqli_num_rows($result) > 0) {
            $mydata = array();
            // 依序 id, uid, realname 到 createtime將資料一筆筆丟進 $mydata 內
            while($row = mysqli_fetch_assoc($result)){
                $mydata[] = $row;
            }
            echo '{"state" : true, "message" : "取得購物車資料成功", "data" : '.json_encode($mydata).'}';
        }else{
            echo '{"state" : false, "message" : "取得購物車資料失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}