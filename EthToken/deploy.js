// your code here
const HDWalletProvider = require("truffle-hdwallet-provider");

const Web3 = require("web3");
const { interface, bytecode } = require("./compile");

const provider = new HDWalletProvider("<phrase>", "https://rinkeby.infura.io/<id>");

    const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();

    console.log("Attempting to deploy from account", accounts[0]); // address of the deployer

    const result // your code here
        = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({ data: "0x" + bytecode ,  arguments: [100000000000000000000, "BCCoin", 0, "BCC" , 100]  })
.send({ gas: "1000000", from: accounts[0] });

    console.log("Contract deployed to", result.options.address); //address of the deployed contract
};
deploy(); // npm start // run
