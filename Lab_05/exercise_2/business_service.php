<html>

<head>
    <title>Create Table</title>
</head>

<body>
    <?php
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
        $SQLcmd_1 = "CREATE TABLE $table_1 (
                BusinessID CHAR(20) PRIMARY KEY,
                Name VARCHAR(50),
                Address VARCHAR(50),
                City VARCHAR(50),
                Telephone VARCHAR(15),
                URL VARCHAR(50)
                )";
        $SQLcmd_2 = "CREATE TABLE $table_3 (
                    CategoryID CHAR(20) PRIMARY KEY,
                    Title VARCHAR(20),
                    Description VARCHAR(50)
                )";

        $SQLcmd_3 = "CREATE TABLE $table_2 (
                    BusinessID CHAR(20),
                    CategoryID CHAR(20),
                    PRIMARY KEY (BusinessID, CategoryID),
                    FOREIGN KEY (BusinessID) REFERENCES $table_1(BusinessID),
                    FOREIGN KEY (CategoryID) REFERENCES $table_3(CategoryID)
                )";
        mysqli_select_db($connect, $mydb);
        if (mysqli_query($connect, $SQLcmd_1)) {
            print '<font size="4" color="blue" >Created Table ';
            print "<i>$table_1</i> in database <i>$mydb</i><br></font>";
        }
        if (mysqli_query($connect, $SQLcmd_2)) {
            print '<font size="4" color="blue" >Created Table ';
            print "<i>$table_3</i> in database <i>$mydb</i><br></font>";
        }
        if (mysqli_query($connect, $SQLcmd_3)) {
            print '<font size="4" color="blue" >Created Table ';
            print "<i>$table_2</i> in database <i>$mydb</i><br></font>";
        }
        mysqli_close($connect);
    }
    ?>
</body>

</html>