//バージョンを指定
pragma solidity ^0.5.0;

//テストをするRemixでは簡略的にGitHubのURLを指定
//もちろんファイルのパス指定も出来る
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.4.0/contracts/token/ERC721/ERC721Full.sol";

contract GesrecContentNFT is ERC721Full {
    //トークンの名前と最小単位を定義
    constructor() public ERC721Full("GesrecContentNFT", "Content NFT for GESREC service") {}
    
    //トークンの情報をstructで定義
    struct Token {
        string name;
        string description;
    }
    
    enum Roles { Provider, Creator }
    
    struct Shareholder {
        address id;
        uint32 share_millipercent;
        Roles role;
    }
    
    mapping(address => Shareholder) public Shareholders;
    
    struct Content {
        string contentType;
        string title;
        string url;
        string gesrecId;
    }
    
    struct ContentToken {
        Shareholder[] shareholders;
        Content content;
    }

    //トークンを保管するために定義
    Token[] public tokens;

    //mint関数でトークンを発行
    function mint() external {
        uint256 id = tokens.push(Token('name','description')) - 1;
        super._mint(msg.sender, id);
    }

}