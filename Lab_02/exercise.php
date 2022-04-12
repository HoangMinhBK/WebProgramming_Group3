<html>

<head>
    <title>Receiving Input</title>
</head>

<body>
    <font size=5>Thank you: Got Your Input.</font>
    <br />
    <?php
    $username = $_POST["username"];
    $class = $_POST["class"];
    $university = $_POST["university"];
    $hobby_1 = $_POST["hobby_1"];
    $hobby_2 = $_POST["hobby_2"];
    $hobby_3 = $_POST["hobby_3"];
    $language = $_POST["fav_language"];
    $age = $_POST["age"];
    print("Hello, $username\n");
    print("You are studying at $class, $university\n");
    print("<br/>");
    print("Your hobby is: ");
    print("<br/>");
    print("<ul>
    <li>$hobby_1</li>
    <li>$hobby_2</li>
    <li>$hobby_3</li>
    </ul>");
    print("<br/>");
    print("Your favorite language is $language");
    print("<br/>");
    print("Your age group is $age");
    ?>
</body>

</html>