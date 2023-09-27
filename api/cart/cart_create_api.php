<?php
// orderno:產品類別
// username:訂購人帳號
// product:購買的產品
// quantity:購買的數量
// price:購買的價格
// total:消費總金額

// {"state" : true, "message" : "訂單新增成功"}
// {"state" : false, "message" : "訂單新增失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}

if (isset($_POST["username"]) && isset($_POST["product"]) && isset($_POST["quantity"]) && isset($_POST["price"])) {
    if ($_POST["username"] != "" && $_POST["product"] != "" && $_POST["quantity"] != "" && $_POST["price"] != "") {
        
        $p_username = $_POST["username"];
        $p_product = $_POST["product"];
        $p_quantity = $_POST["quantity"];
        $p_price = $_POST["price"];

        $datainfo = array();
        $datainfo["username"] = $p_username;
        $datainfo["product"] = $p_product;
        $datainfo["quantity"] = $p_quantity;
        $datainfo["price"] = $p_price;

        require_once "../dbtools.php";

        $conn = create_connect();

        $sql = "INSERT INTO cart(Username, Product, Quantity, Price) VALUES ('$p_username', '$p_product', '$p_quantity', '$p_price')";

        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "加入購物車", "dataInfo" : ' . json_encode($datainfo) . '}';
        } else {
            echo '{"state" : false, "message" : "加入購物車失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
