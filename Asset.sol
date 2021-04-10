pragma solidity >=0.4.0 <0.9.0;

//Creation of the contract
contract AssetContract{
    //Declaration of the variables
    address owner;
    /*address payable wallet;
    uint256 price;*/
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
        /*wallet =_wallet;
        price = _price;*/
        owner = msg.sender;
    }
    
    //Creation of the mapping
    mapping(address => bool)public Verified_owner;
   // mapping(address => uint256)public Balances;
    mapping(uint => assetcreation)public AssetCreation;
    mapping(address => bool)public Verified_Transaction;
    
    //Creation of the array
    assettransfer[] public AssetTransfer;
    
    //Creation of the structure
    struct assetcreation{
        
        uint _id;
        uint _Cost;
        string _AssetName;
        string _CreaterName;
    }
    
    struct assettransfer{
        
        address _from;
        address _to;
    }
    
    //Defining of the function
    function assetcreate(uint _Cost, string memory _AssetName, string memory _CreaterName)public onlyOwner{
        
        //Defining of the mapping
        AssetCreation[assetcount]=assetcreation(assetcount,_Cost,_AssetName,_CreaterName);
        
        //Incrementing assetcount by 1
        assetcount += 1;
        
        //Record of the owner and transactions that the owner and transactions are correctly entered
        Verified_owner[msg.sender]=true;
        Verified_Transaction[msg.sender]=true;
    }
    
    function assettransfers(address _from,address _to)public{
        
        //Require statement for verifying that the owner and transaction cannot be done before
        require(!Verified_owner[msg.sender]);
        require(!Verified_Transaction[msg.sender]);
        
        //Defining of the array
        AssetTransfer.push(assettransfer(_from,_to));
    }
    
    
   /* function Buytoken()public payable{
        
        require(msg.value == price);
        Balances[msg.sender] +=1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender,1);
    }*/
}