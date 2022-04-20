<html>
    <head><title> single form </title></head>
    <body>
        <form ACTION = "submitted.php" METHOD = "POST">
            <h4> 
                Enter your name and select date and time for appointment 
            </h4>
            <table>
                <tr>
                    <td>Your name: </td>
                    <td><input type = "text" size = "30" maxlength = "30" name = "name"></td>
                </tr>
                <tr>
                    <td>Date: </td>
                    <td><select name="day">
                    <?php
                        for ($i = 1; $i <= 31; $i++){
                            print("<option>$i</option>");
                        }
                     
                    ?>
                    </select>
                    <select name="month">
                    <?php
                        for ($i = 1; $i <= 12; $i++){
                            print("<option>$i</option>");
                        }
                     
                    ?>
                        </select>
                    <select name="year">
                    <?php
                        for ($i = 2000; $i <= 2030; $i++){
                            print("<option>$i</option>");
                        }8
                    ?>
                    </select>
                    </td>
                </tr>  
                <tr>
                    <td>Time: </td>
                    <td><select name="hour">
                    <?php
                        for ($i = 0; $i <= 23; $i++){
                            print("<option>$i</option>");
                        }
                     
                    ?>
                    </select>
                    <select name="min">
                    <?php
                        for ($i = 0; $i <= 59; $i++){
                            print("<option>$i</option>");
                        }
                     
                    ?>
                        </select>
                    <select name="sec">
                    <?php
                        for ($i = 0; $i <= 59; $i++){
                            print("<option>$i</option>");
                        }
                     
                    ?>
                    </select>
                    </td>
                </tr>  
                
                
                <tr>
                    <td align=" right"><input type="submit" value="submit"></td>
                    <td align=" left"><input type="reset" value="reset"></td>                   
                </tr>
            </table>
            
        </form>
    </body>
    
        
</html>