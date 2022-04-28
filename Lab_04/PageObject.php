<?php
include "PageClass.php";
$newPage = new Page("New page generated from Class", "2022", "Group 3");
$newPage->addContent("<h1>This is a page of Group 3</h1>");
$newPage->createPage();
?>