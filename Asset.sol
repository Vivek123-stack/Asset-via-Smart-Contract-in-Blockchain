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
    constructor() public ERC721("nft original","NFT"){
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
    function assetCreate(uint256 tokenId,string memory _AssetName, string memory _CreaterName,string memory _Discription_of_the_asset,string memory _Category_of_Asset)public onlyOwner{
        
        //Defining of the mapping
        AssetCreation[assetCount]=assetcreation(assetCount,_AssetName,_CreaterName,_Discription_of_the_asset,_Category_of_Asset);
        
        //Incrementing assetcount by 1
        assetCount += 1;
         
        //Declaration of the variable and copying data from one datatype to another datatype
        uint256 assetTokenClassId = assetCount;
         
        //Deffining the mint function from ERC721
        _mint(msg.sender, assetTokenClassId);
        
        //Require statement to check that the token exits or not
        require(_exists(tokenId));
        
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Owner[msg.sender]=true);
        
        //Require statement for verifying that the owner and transaction cannot be done before
        require(Verified_Transaction[msg.sender]=true);
    }
    
    function burnToken(uint256 tokenId) public {
      
      //Burn the token     
     _burn(tokenId);
    }
}
