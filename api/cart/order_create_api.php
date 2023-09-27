<?php
// orderno:產品類別
// username:訂購人帳號
// products:購買的產品
// quantities:購買的數量
// prices:購買的價格
// total:消費總金額

// {"state" : true, "message" : "訂單新增成功"}
// {"state" : false, "message" : "訂單新增失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}
header("Access-Control-Allow-Origin: https://terry88678.github.io");
if (isset($_POST["username"]) && isset($_POST["products"]) && isset($_POST["quantities"]) && isset($_POST["prices"]) && isset($_POST["total"]) && isset($_POST["phone"]) && isset($_POST["realname"]) && isset($_POST["address"]) && isset($_POST["pay"])) {
    if ($_POST["username"] != "" && $_POST["products"] != "" && $_POST["quantities"] != "" && $_POST["prices"] != "" && $_POST["total"] != "" && $_POST["phone"] != "" && $_POST["realname"] != "" && $_POST["address"] != "" && $_POST["pay"] != "") {
        
        $p_orderno = substr( uniqid(time()), 2, 9);
        $p_username = $_POST["username"];
        $p_products = $_POST["products"];
        $p_quantities = $_POST["quantities"];
        $p_prices = $_POST["prices"];
        $p_total = $_POST["total"];
        $p_realname = $_POST["realname"];
        $p_phone = $_POST["phone"];
        $p_address = $_POST["address"];
        $p_pay = $_POST["pay"];

        $datainfo = array();
        $datainfo["orderno"] = $p_orderno;
        $datainfo["username"] = $p_username;
        $datainfo["products"] = $p_products;
        $datainfo["quantities"] = $p_quantities;
        $datainfo["prices"] = $p_prices;
        $datainfo["total"] = $p_total;
        $datainfo["realname"] = $p_realname;
        $datainfo["phone"] = $p_phone;
        $datainfo["address"] = $p_address;
        $datainfo["pay"] = $p_pay;

        require_once "../dbtools.php";

        $conn = create_connect();

        $sql = "INSERT INTO orderlist(OrderNo, Username, Products, Quantities, Prices, Total, Phone, Realname, Address, Pay) VALUES ('$p_orderno', '$p_username', '$p_products', '$p_quantities', '$p_prices', '$p_total', '$p_phone', '$p_realname', '$p_address', '$p_pay')";

        if (execute_sql($conn, 'bakery', $sql)) {
            echo '{"state" : true, "message" : "訂單新增成功", "dataInfo" : ' . json_encode($datainfo) . '}';
        } else {
            echo '{"state" : false, "message" : "訂單新增失敗"}';
        }
        mysqli_close($conn);
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
