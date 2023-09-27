<?php
    if(isset($_POST["id"]) && isset($_POST["isadmin"])){
        if($_POST["id"] != "" && $_POST["isadmin"] != ""){
            $p_id = $_POST["id"];
            $p_isadmin = $_POST["isadmin"];

            require_once "../dbtools.php";

            $conn = create_connect();
            $sql = "UPDATE member SET IsAdmin = '$p_isadmin' WHERE ID = '$p_id'";
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