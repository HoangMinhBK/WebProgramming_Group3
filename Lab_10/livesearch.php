<?php
header("Content-Type: text/xml");
$people = array(
    "Acer Nitro 5", "Acer Aspire 5", "Lenovo Legion", "ASUS Tuf",
    "Dell Latitude", "Dell Inspiron", "HP Envy", "HP Compaq",
    "Predator 101", "Workstation", "MacBook", "MacBook Pro",
    "Asus Zenbook", "Asus Zenbook Pro", "Asus Zenbook UX31E"
);
$query = $_GET['query'];
echo "<?xml version=\"1.0\"?>\n";
echo "<names>\n";
//display all names that match the query
foreach ($people as $name) {
    if (stristr($name, $query)) {
        echo "<name>$name</name>\n";
    }
}
echo '</names>';