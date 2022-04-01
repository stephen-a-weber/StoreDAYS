<?php
class ReviewModel implements JsonSerializable{

    private int $ID;
    public String $UserName;
    public int $FirstName;
    public int $LastName;
    public int $DateOfBirth;
    public int $Password;
    public String $Email;
    public int $Admin;
    function __construct(int $ID, string $UserName, int $FirstName, int $LastName, int $DateOfBirth, int $Password, String $Email, int $Admin)
    {
        $this->ID=$ID;
        $this->UserName=$UserName;
        $this->FirstName=$FirstName;
        $this->LastName=$LastName;
        $this->DateOfBirth=$DateOfBirth;
        $this->Password=$Password;
        $this->Email=$Email;
        $this->Admin=$Admin;
    }

    public function jsonSerialize(): mixed
    {
        return array(
        'ID'=>$this->ID,
        'UserName'=>$this->UserName,
        'FirstName'=>$this->FirstName,
        'LastName'=>$this->LastName,
        'DateOfBirth'=>$this->DateOfBirth,
        'Password'=>$this->Password,
        'Email'=>$this->Email,
        'Admin'=>$this->Admin,
        );
    }
}

?>
