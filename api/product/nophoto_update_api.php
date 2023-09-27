<?php
// category:產品類別
// product:產品名稱
// price:產品價格
// discount:會員價
// content:產品內容
// photo:照片檔名
// sell: 是否上架

// {"state" : true, "message" : "產品更新成功"}
// {"state" : false, "message" : "產品更新失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["id"]) && isset($_POST["category"]) && isset($_POST["product"]) && isset($_POST["price"]) && isset($_POST["discount"]) && isset($_POST["content"])) {
    if ($_POST["id"] != "" && $_POST["category"] != "" && $_POST["product"] != "" && $_POST["price"] != "" && $_POST["discount"] != "" && $_POST["content"] != "") {
        $p_id = $_POST["id"];
        $p_category = $_POST["category"];
        $p_product = $_POST["product"];
        $p_price = $_POST["price"];
        $p_discount = $_POST["discount"];
        $p_content = $_POST["content"];

        require_once "../dbtools.php";

        $conn = create_connect();


        $sql = "UPDATE product SET Category = '$p_category', Product = '$p_product', Price = '$p_price', Discount = '$p_discount', Content = '$p_content' WHERE id = '$p_id'";

        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "產品更新成功"}';
        } else {
            echo '{"state" : false, "message" : "產品更新失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
