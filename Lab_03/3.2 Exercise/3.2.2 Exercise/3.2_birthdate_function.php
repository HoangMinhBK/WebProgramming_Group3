<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Angle Converter</title>
</head>

<body>
    <?php
    function toDeg($rad)
    {
        $_deg = $rad * 180 / M_PI;
        return $_deg;
    }
    function toRad($deg)
    {
        $_rad = $deg * M_PI / 180;
        return $_rad;
    }
    $birthday1 = $_POST["birthday1"];
    $birthday2 = $_POST["birthday2"];
    if ($birthday1 != $birthday2)
    {
        echo "First birthday: ";
        echo date("D, F j, Y", strtotime($birthday1));
        echo "<br>Second birthday: ";
        echo date("D, F j, Y", strtotime($birthday2));
        echo "<br>Difference in day between two dates: ";
        $diff = date_diff(date_create($birthday1), date_create($birthday2));
        echo $diff->format("%a days");
        $today = date("Y-m-d");
        $age1 = date_diff(date_create($birthday1), date_create($today));
        echo "<br>First age: ";
        echo $age1->format("%y year(s) old");
        $age2 = date_diff(date_create($birthday2), date_create($today));
        echo "<br>Second age: ";
        echo $age2->format("%y year(s) old");
        echo "<br>Difference in age between two persons: ";
        $y1 = date('Y',strtotime($birthday1));
        $y2 = date('Y',strtotime($birthday2));
        echo abs($y1 - $y2);
    }
    else 
        echo "Two persons have the same birthday at: ";
        echo date("D, F j, Y", strtotime($birthday1));
    ?>
</body>

</html>