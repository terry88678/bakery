<?php
// {"state" : true, "message" : "刪除成功"}
// {"state" : false, "message" : "刪除失敗"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["id"])) {
    if ($_POST["id"] != "") {
        $p_id = $_POST["id"];
        require_once "../dbtools.php";
        $conn = create_connect();
        $sql = "DELETE FROM orderlist WHERE id = '$p_id'";
        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "刪除成功"}';
        } else {
            echo '{"state" : false, "message" : "刪除失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
?>