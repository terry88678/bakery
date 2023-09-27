<?php
// product:產品名稱

// {"state" : true, "message" : "尚無此產品，可以新增"}
// {"state" : false, "message" : "產品名稱已存在，不可使用"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}"

header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["product"])) {
    if ($_POST["product"] != "") {
        $p_product = $_POST["product"];

        require_once "dbtools.php";

        $conn = create_connect();

        $sql = "SELECT Product FROM product WHERE Product = '$p_product'";

        $result = execute_sql($conn, 'bakery', $sql);

        if (mysqli_num_rows($result) == 0){
            echo '{"state" : true, "message" : "尚無此產品，可以新增"}';
        }else{
            echo '{"state" : false, "message" : "產品名稱已存在，不可使用"}';
        }

        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
?>