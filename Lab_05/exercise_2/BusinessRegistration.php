<html>

<head>
    <title>Business Registration Completed!</title>
</head>

<body>
    <font size=5>Thank you: Got Your Input</font>
    <br />
    <?php
    $business_id = $_POST["business_id"];
    $business_name = $_POST["business_name"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $telephone = $_POST["telephone"];
    $url = $_POST["url"];
    // $categories = $_POST["categories"];

    $server = 'localhost';
    $user = 'root';
    $pass = '';
    $mydb = 'business_service';
    $table_1 = 'Businesses';
    $table_2 = 'Biz_Categories';
    $table_3 = 'Categories';
    $connect = mysqli_connect($server, $user, $pass);
    if (!$connect) {
        die("Cannot connect to $server using $user");
    } else {
        $SQLcmd_1 = "INSERT INTO $table_1 (BusinessID, Name, Address, City, Telephone, URL)
        VALUES ('$business_id', '$business_name', '$address', '$city', '$telephone', '$url')";

        mysqli_select_db($connect, $mydb);
        if (mysqli_query($connect, $SQLcmd_1)) {
            print '<font size="4" color="blue" >Inserted into Table ';
            print "<i>$table_1</i> in database <i>$mydb</i><br></font>";
        }
        mysqli_close($connect);
    }
    ?>
</body>