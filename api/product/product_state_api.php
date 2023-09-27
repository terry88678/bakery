<?php
header("Access-Control-Allow-Origin: https://terry88678.github.io");
    if(isset($_POST["id"]) && isset($_POST["sellstate"])){
        if($_POST["id"] != "" && $_POST["sellstate"] != ""){
            $p_id = $_POST["id"];
            $p_sellstate = $_POST["sellstate"];

            require_once "../dbtools.php";

            $conn = create_connect();
            $sql = "UPDATE product SET Sell = '$p_sellstate' WHERE ID = '$p_id'";
            if(execute_sql($conn, 'bakery', $sql)){
                echo '{"state" : true, "message" : "狀態更新成功"}';
            }else{
                echo '{"state" : false, "message" : "狀態更新失敗"}';
            }
            mysqli_close($conn);
        }else{
            echo '{"state" : false, "message" : "欄位不允許空白"}';
        }
    }else{
        echo '{"state" : false, "message" : "欄位錯誤"}';
    }
?>