<?php
// realname:暱稱
// birthday:生日
// phone:電話
// email:電子信箱


// {"state" : true, "message" : "更新成功"}
// {"state" : false, "message" : "更新失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["customer_uid"]) && isset($_POST["username"])) {
    if ($_POST["customer_uid"] != "" && $_POST["username"] != "") {
        $customer_uid = $_POST["customer_uid"];
        $p_username = $_POST["username"];


        require_once "../dbtools.php";

        $conn = create_connect();

        $sql = "UPDATE cart SET Username = '$p_email' WHERE Username = '$customer_uid'";


        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "更新成功"}';
        } else {
            echo '{"state" : false, "message" : "更新失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
?>