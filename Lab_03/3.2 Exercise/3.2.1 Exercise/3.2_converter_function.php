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
    $number = $_POST["number"];
    $choice = $_POST["choice"];
    if (!is_numeric($number))
        echo "Input is not a number!";
    else {
        echo "<br><b>Result</b><br>";
        switch ($choice) {
            case 0:
                $temp = toDeg($number);
                echo "<br>$number <i>rad</i> ≈ " . number_format($temp, 4) . "°";
                echo "<br><mark>Formula</mark>: $number <i>rad</i> × 180/π ≈ " . number_format($temp, 4) . "°";
                break;
            case 1:
                $temp = toRad($number);
                echo "<br>$number<i>°</i> ≈ " . number_format($temp, 4) . " <i>rad</i>";
                echo "<br><mark>Formula</mark>: $number<i>°</i> × π/180 ≈ " . number_format($temp, 4) . " <i>rad</i>";
                break;
            default:
                echo "Invalid operation!";
                break;
        }
    }

    ?>
</body>

</html>