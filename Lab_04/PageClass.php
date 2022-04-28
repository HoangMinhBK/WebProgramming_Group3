<?php
class Page
{
    public $page;
    public $title;
    public $year;
    public $copyright;

    public function __construct($title, $year, $copyright)
    {
        $this->title = $title;
        $this->year = $year;
        $this->copyright = $copyright;
    }

    function addHeader()
    {
        $this->page = $this->page . "<h1> This is the page header </h1>" . "<br>";
        $this->page = $this->page . "<h2> Title: " . $this->title . "</h2>" . "<br>";
    }

    function addFooter()
    {
        $this->page = $this->page . "<h1> This is the page footer </h1>" . "<br>";
        $this->page = $this->page . "<h2> Copyright: " . $this->copyright . "</h2>" . "<br>";
        $this->page = $this->page . "<h2> Year: " . $this->year . "</h2>" . "<br>";
    }

    function addContent($content)
    {
        $this->addHeader();
        $this->page = $this->page . $content . "<br>";
        $this->addFooter();
    }

    function createPage()
    {
        print($this->page);
    }
}
