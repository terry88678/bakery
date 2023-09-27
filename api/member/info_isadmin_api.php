<?php
header("Access-Control-Allow-Origin: https://terry88678.github.io");
    if(isset($_POST["uid"])){
        if($_POST["uid"] != ""){
            $p_uid = $_POST["uid"];

            require_once "../dbtools.php";

            $conn = create_connect();
            $sql = "SELECT id, Username, Nickname, Birthday, Phone, Email, Uid01, IsAdmin, CreateTime FROM member WHERE Uid01 = '$p_uid'";

            $result = execute_sql($conn, 'bakery', $sql);

            if($result){
                $mydata = array();
                while($row = mysqli_fetch_assoc($result)){
                    $mydata[] = $row;
                }

                echo '{"state" : true, "message" : "資料讀取成功", "data" : '.json_encode($mydata).'}';
            }else{
                echo '{"state" : false, "message" : "資料讀取失敗"}';
            }
            mysqli_close($conn);
        }else{
            echo '{"state" : false, "message" : "欄位不允許空白"}';
        }
    }else{
        echo '{"state" : false, "message" : "欄位錯誤"}';
    }
?>