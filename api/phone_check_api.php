<?php
// username:帳號

// {"state" : true, "message" : "電話不存在，可以使用"}
// {"state" : false, "message" : "電話已存在，不可使用"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}"


if (isset($_POST["phone"])) {
    if ($_POST["phone"] != "") {
        $p_phone = $_POST["phone"];

        require_once "dbtools.php";

        $conn = create_connect();

        $sql = "SELECT Phone FROM cart WHERE Phone = '$p_phone'";

        $result = execute_sql($conn, 'bakery', $sql);

        if (mysqli_num_rows($result) == 0){
            echo '{"state" : true, "message" : "此電話不存在，可以使用"}';
        }else{
            echo '{"state" : false, "message" : "電話已存在，不可使用"}';
        }

        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
?>