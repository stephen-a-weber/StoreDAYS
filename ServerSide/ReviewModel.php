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
if(isset($_GET['ID'])&isset($_GET['Body']) && isset($_GET['User_ID'])&& isset($_GET['Rate'])&& isset($_GET['Items_ID'])&& isset($_GET['Catagory_ID']) ){
$ID= $_GET['ID'];
    $Body= $_GET['Body'];
$User_ID= $_GET['User_ID'];
$Rate= $_GET['Rate'];
$Items_ID= $_GET['Items_ID'];
$Catagory_ID= $_GET['Catagory_ID'];
echo json_encode(new ReviewModel($ID,$Body,$User_ID,$Rate,$Items_ID,$Catagory_ID));

}

?>