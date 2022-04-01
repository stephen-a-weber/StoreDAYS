<?php
class ReviewModel implements JsonSerializable{

    private int $ID;
    public String $Name;
    public int $Description;
    public int $Cost;
    public int $Catagory_ID;
    public int $Img;
    public int $Availability;
    function __construct(int $ID, string $Name, int $Description, int $Cost, int $Catagory_ID, int $Img, int $Availability)
    {
        $this->ID=$ID;
        $this->Name=$Name;
        $this->Description=$Description;
        $this->Cost=$Cost;
        $this->Catagory_ID=$Catagory_ID;
        $this->Img=$Img;
        $this->Availability=$Availability;
    }

    public function jsonSerialize(): mixed
    {
        return array(
        'ID'=>$this->ID,
        'Name'=>$this->Name,
        'Description'=>$this->Description,
        'Cost'=>$this->Cost,
        'Catagory_ID'=>$this->Catagory_ID,
        'Img'=>$this->Img,
        'Availability'=>$this->Availability,
        );
    }
}

?>
