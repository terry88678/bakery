<?php
// category:產品類別
// product:產品名稱
// price:產品價格
// discount:會員價
// content:產品內容
// photo:照片檔名
// sell: 是否上架

// {"state" : true, "message" : "產品新增成功"}
// {"state" : false, "message" : "產品新增失敗"}
// {"state" : false, "message" : "欄位不允許空白"}
// {"state" : false, "message" : "欄位錯誤"}

if (isset($_POST["category"]) && isset($_POST["product"]) && isset($_POST["price"]) && isset($_POST["discount"]) && isset($_POST["content"]) && isset($_FILES['file']['name'])) {
    if ($_POST["category"] != "" && $_POST["product"] != "" && $_POST["price"] != "" && $_POST["discount"] != "" && $_POST["content"] != "" && $_FILES['file']['name'] != "") {
        if ($_FILES['file']['type'] == 'image/jpeg' || $_FILES['file']['type'] == 'image/png') {
            $photoName = substr(hash('sha256', uniqid(time())), 0, 10) . '_' . $_FILES['file']['name'];
            $location = '../../upload/' . $photoName;
            move_uploaded_file($_FILES['file']['tmp_name'], $location);

            $datainfo = array();
            $datainfo["state"] = true;
            $datainfo["name"] = $_FILES['file']['name'];
            $datainfo["type"] = $_FILES['file']['type'];
            $datainfo["tmp_name"] = $_FILES['file']['tmp_name'];
            $datainfo["size"] = $_FILES['file']['size'];
            $datainfo["photoName"] = $photoName;
            $datainfo["location_name"] = $location;

            $p_category = $_POST["category"];
            $p_product = $_POST["product"];
            $p_price = $_POST["price"];
            $p_discount = $_POST["discount"];
            $p_content = $_POST["content"];

            require_once "../dbtools.php";

            $conn = create_connect();

            $sql = "INSERT INTO product(Category, Product, Price, Discount, Content, Photo, Sell) VALUES ('$p_category', '$p_product', '$p_price', '$p_discount', '$p_content', '$photoName', 'true')";

            if (execute_sql($conn, 'bakery', $sql)) {
                echo '{"state" : true, "message" : "產品新增成功", "dataInfo" : ' . json_encode($datainfo) . '}';
            } else {
                echo '{"state" : false, "message" : "產品新增失敗"}';
            }
            mysqli_close($conn);
        } else {
            echo '{"state" : false, "message" : "檔案格式不符"}';
        }
    } else {
        echo '{"state" : false, "message" : "欄位不允許空白"}';
    }
} else {
    echo '{"state" : false, "message" : "欄位錯誤"}';
}
