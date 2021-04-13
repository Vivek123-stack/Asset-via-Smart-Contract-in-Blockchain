pragma solidity >=0.4.0 <0.9.0;

    //Creation of the contract
    contract AssetContract{
    //Declaration of the variables
    address owner;
    uint public assetcount = 0;
    
    event Purchase(address indexed _buyer,uint _amount);
    
    //Creation of the modifier
    modifier onlyOwner{
        
        //Require statement
        require(msg.sender == owner ,"Only Owner can create and deploy this Asset");
        _;
    }
    
    //Creation of the constructor
    constructor() public{
        owner = msg.sender;
    }
    
    //Creation of the mapping
    mapping(address => bool)public Verified_Owner;
    mapping(address => bool)public Verified_Transaction;
    mapping(uint => assetcreation)public AssetCreation;
    
    //Creation of the array
    assettransfer[] public AssetTransfer;
    
    //Creation of the structure
    struct assetcreation{
        
        uint _id;
        string _AssetName;
        string _CreaterName;
    }
    
    struct assettransfer{
        
        address _from;
        address _to;
    }
    
    //Defining of the function
    function assetcreate(string memory _AssetName, string memory _CreaterName)public payable onlyOwner{
        
        //Defining of the mapping
        AssetCreation[assetcount]=assetcreation(assetcount,_AssetName,_CreaterName);
        
        //Incrementing assetcount by 1
        assetcount += 1;
    }
    
    function assettransfers(address _from,address _to)public{
    
        //Defining of the array
        AssetTransfer.push(assettransfer(_from,_to));
    }
    
    function verifyowner()public returns(bool){
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Owner[msg.sender]=true);
        
        //require previous owner cannot sell again his/her particular asset once its sold
        //require(!Verified_Owner[msg.sender]);
    }
    
    function verifytransactions()public returns(bool){
        
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Transaction[msg.sender]=true);
    }
    
  
}
