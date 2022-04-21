<html>
    <head><title>confirmed</title></head>
    <body>
        
        Hi <?php echo $_POST["name"]; ?><br><br>
        
        You have to choose to have an appointment on 
            <?php echo $_POST["hour"], ":", $_POST["min"],
                ":",$_POST["sec"],", ", $_POST["day"], "/", $_POST["month"], "/", $_POST["year"]; 
            ?><br><br>
        More information<br><br>
        In 12 hours, the time and date is
        
            <?php   $hour = $_POST["hour"];
                   if ($hour <= 12) echo $_POST["hour"], ":", $_POST["min"],
                        ":",$_POST["sec"]," AM, ", $_POST["day"], "/", $_POST["month"],
                        "/", $_POST["year"]; 
                   else {
                       $hour -= 12;
                       echo $hour, ":", $_POST["min"],
                       ":",$_POST["sec"]," PM, ", $_POST["day"], "/", $_POST["month"],
                       "/", $_POST["year"]; 
                   }
            ?><br><br>
            
        This month has 
            <?php   $month = $_POST["month"];
                    $day = $_POST["day"];
                    $year = $_POST["year"];
                   if ($month == 2) {
                       if ($year % 4 == 0) {
                           echo "29 days";
                           if ($day > 29) echo ", the day is invalid." ;
                       }
                       else {
                           echo "28 days";
                           if ($day > 28) echo ", the day is invalid." ;
                       }
                       
                   }
                   else if (($month ==4) || ($month ==6) || ($month ==9) || ($month ==11)){
                       echo "30 days";
                       if ($day > 30) echo ", the day is invalid." ;
                   }
                   else{
                       echo "31 days";
                   }
            ?>
    </body>       
</html>