<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Angle Converter</title>
</head>
<body>
    <form action = "3.2_converter_function.php" METHOD = "POST">
        <input type="radio" name="choice" value="0"/>
		<label>Radians to Degrees</label>
        <input type="radio" name="choice" value="1"/>
		<label>Degrees to Radians</label>
        <br>
        <input type="text" name="number" required/>
		<input type="submit" value="Submit">
		<input type="reset" value="Reset">
    </form>
</body>
</html>