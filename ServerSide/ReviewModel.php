<?php 
class ReviewModel implements JsonSerializable{

    private int $ID;
    public String $Body;
    public int $User_ID;
    public int $Rate;
    public int $Items_ID;
    public int $Catagory_ID;
    function __construct(int $ID, string $Body, int $User_ID, int $Rate, int $Items_ID, int $Catagory_ID)
    {
        $this->ID=$ID;
        $this->Body=$Body;
        $this->User_ID=$User_ID;
        $this->Rate=$Rate;
        $this->Items_ID=$Items_ID;
        $this->Catagory_ID=$Catagory_ID;

    }
    
    public function jsonSerialize(): mixed
    {
        return array(
        'ID'=>$this->ID,
        'Body'=>$this->Body,
        'User_ID'=>$this->User_ID,
        'Rate'=>$this->Rate,
        'Items_ID'=>$this->Items_ID,
        'Catagory_ID'=>$this->Catagory_ID
        );
    }
}

?>