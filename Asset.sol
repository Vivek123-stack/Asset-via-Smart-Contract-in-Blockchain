//Importing ERC1155 standards into our contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

    //Creation of the contract
    contract assetContract is ERC721{
        
    //Declaration of the variables
    address owner;
    uint public assetCount = 0;
    
    //Creation of the event
    event Purchase(address indexed _buyer,uint _amount);
    
    //Creation of the modifier
    modifier onlyOwner{
        
        //Require statement
        require(msg.sender == owner ,"Only Owner can create and deploy this Function");
        _;
    }
    
    //Creation of the constructor
    constructor() public ERC721("",""){
        owner = msg.sender;
    }
    
    //Creation of the mapping
    mapping(address => bool)public Verified_Owner;
    mapping(address => bool)public Verified_Transaction;
    mapping(uint => assetcreation)public AssetCreation;
    
    //Creation of the structure
    struct assetcreation{
        
        uint _id;
        string _AssetName;
        string _CreaterName;
        string _Discription_of_the_asset;
        string _Category_of_Asset;
    }
    
    //Defining of the function
    function assetCreate(string memory _AssetName, string memory _CreaterName,string memory _Discription_of_the_asset,string memory _Category_of_Asset)public onlyOwner{
        
        //Defining of the mapping
        AssetCreation[assetCount]=assetcreation(assetCount,_AssetName,_CreaterName,_Discription_of_the_asset,_Category_of_Asset);
        
        //Incrementing assetcount by 1
        assetCount += 1;
    }
    
    function verifyOwner()public returns(bool){
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Owner[msg.sender]=true);
        
        //require previous owner cannot sell again his/her particular asset once its sold
        //require(!Verified_Owner[msg.sender]);
    }
    
    function verifyTransactions()public returns(bool){
        
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Transaction[msg.sender]=true);
    }
    
}
