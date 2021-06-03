pragma solidity 0.6.6;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol';

contract nft_sample is ERC721 {
  constructor (string memory name, string memory symbol, string memory baseURI) public ERC721 (name, symbol) {
      _setBaseURI(baseURI);
  }

  struct NFTAtr {
    string copyrightholder;
  }

  NFTAtr[] nftAtrs;

  function mintNFT(string memory _copyrightholder,string memory tokenURI) public returns(uint) {
    NFTAtr memory _nftAtr = NFTAtr(_copyrightholder);
    nftAtrs.push(_nftAtr);
    uint _id = nftAtrs.length - 1;
    _safeMint(msg.sender, _id);
    _setTokenURI(_id, tokenURI);
    return _id;
  }

  function getNFTAtrFromId(uint id) public view returns(string memory) {
    return (nftAtrs[id].copyrightholder);
  }
}