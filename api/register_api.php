<?php
// username:帳號
// password:密碼
// realname:暱稱
// birthday:生日
// phone:電話
// email:電子信箱

// {"state" : true, "message" : "註冊成功"}
// {"state" : false, "message" : "註冊失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}

if (isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["realname"]) && isset($_POST["birthday"]) && isset($_POST["phone"]) && isset($_POST["email"])) {
    if ($_POST["username"] != "" && $_POST["password"] != "" && $_POST["realname"] != "" && $_POST["birthday"] != "" && $_POST["phone"] != "" && $_POST["email"] != "") {
        $p_username = $_POST["username"];
        $p_password = substr(md5($_POST["password"]), 3, 5).substr(md5($_POST["password"]), 13, 8);
        $p_realname = $_POST["realname"];
        $p_birthday = $_POST["birthday"];
        $p_phone = $_POST["phone"];
        $p_email = $_POST["email"];

        require_once "dbtools.php";

        $conn = create_connect();

        $sql = "INSERT INTO member(Username, Password, Realname, Birthday, Phone, Email, UserState, IsAdmin) VALUES ('$p_username', '$p_password', '$p_realname', '$p_birthday', '$p_phone', '$p_email', 'true', 'false')";

        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "註冊成功"}';
        } else {
            echo '{"state" : false, "message" : "註冊失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
?>