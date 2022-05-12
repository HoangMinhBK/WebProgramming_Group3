<html>
    <head><title>Create Table</title></head>
    <body>
        <?php
        $server = 'localhost';
        $user = 'root';
        $pass = 'password';
        $mydb = 'php';
        $table_name = 'categories';
        $connect = mysqli_connect($server, $user, $pass);
        if (!$connect) {
            die("Cannot connect to $server using $user");
        } else {
            $SQLcmd = "CREATE TABLE $table_name (
                CatID VARCHAR(20) PRIMARY KEY,
                Title VARCHAR(50),
                Product_desc VARCHAR(50))";
            mysqli_select_db($connect, $mydb);
            if (mysqli_query($connect, $SQLcmd)) {
                print '<font size="4" color="blue" >Created Table';
                print "<i>$table_name</i> in database<i>$mydb</i><br></font>";
                print "<br>SQLcmd=$SQLcmd";
            } else {
                die("Table Create Creation Failed SQLcmd=$SQLcmd");
            }
            mysqli_close($connect);
        }
        ?>
    </body>
</html>