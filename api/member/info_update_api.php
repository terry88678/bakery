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
if (isset($_POST["id"]) && isset($_POST["realname"]) && isset($_POST["birthday"]) && isset($_POST["phone"]) && isset($_POST["email"])) {
    if ($_POST["id"] != "" && $_POST["realname"] != "" && $_POST["birthday"] != "" && $_POST["phone"] != "" && $_POST["email"] != "") {
        $p_id = $_POST["id"];
        $p_realname = $_POST["realname"];
        $p_birthday = $_POST["birthday"];
        $p_phone = $_POST["phone"];
        $p_email = $_POST["email"];


        require_once "../dbtools.php";

        $conn = create_connect();

        $sql = "UPDATE member SET Realname = '$p_realname', Birthday = '$p_birthday', Phone = '$p_phone', Email = '$p_email' WHERE id = '$p_id'";


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