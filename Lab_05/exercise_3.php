<html>
<head>
<title>Bussiness Listings</title></head>
<style>
    .middle
    {
        width: 1000px;
        height: 70px;   
    }

    .bLeft
    {        
        width: 700px;
        height: 70px;     
    }
</style>
<body>


<h1>Bussiness Listings</h1>   
<h2>Click on a category to find bussiness listings: </h2>
<form method="post">
    <table>
    <tr>    
        <td class="bLeft">
                <input type="submit" name="1" class="button" value='Automotive Parts and Supplies' />
                <br>
                <input type="submit" name="2" class="button" value='Seafood Stores and Restaurants' />
                <br>
                <input type="submit" name="3" class="button" value='Health and Beauty' />
                <br>
                <input type="submit" name="4" class="button" value='School and Colleges' />
                <br>
                <input type="submit" name="5" class="button" value='Community Sport and Recreation' />
        </td>
        
        <td class="middle">
            <?php   

            
            if(array_key_exists('1', $_POST) || array_key_exists('2', $_POST) 
                    || array_key_exists('3', $_POST) || array_key_exists('4', $_POST)
                    || array_key_exists('5', $_POST) ) {
                button();
            }
            
            function button() {
            if (array_key_exists('1', $_POST)) $tmp = $_POST['1'];
            if (array_key_exists('2', $_POST)) $tmp = $_POST['2'];
            if (array_key_exists('3', $_POST)) $tmp = $_POST['3'];
            if (array_key_exists('4', $_POST)) $tmp = $_POST['4'];
            if (array_key_exists('5', $_POST)) $tmp = $_POST['5'];

                $server = 'localhost';
                $user = 'root';
                $pass = '';
                $mydb = 'business_service';
                $table = 'Categories';
                $connect = mysqli_connect($server, $user, $pass, $mydb);
                if (!$connect) {
                      die("Cannot connect to $server using $user");
                } else {
                        
                    $lists = mysqli_query($connect, "select name FROM businesses JOIN Biz_Categories on "
                            . "Biz_Categories.BusinessID = businesses.BusinessID JOIN Categories "
                            . "on Biz_Categories.CategoryID = Categories.CategoryID where "
                            . "Categories.Title = '".$tmp."'") ;
                    
                    if (mysqli_num_rows($lists) > 0) {
                        while($row = mysqli_fetch_assoc($lists)) {
                                echo $row["name"]. "<br>";
                        }
                    }
                        mysqli_close($connect);      
                }
            }
            ?> 
        </td>
    </tr>
                                                  
    </table>
</form>

</body>
</html>