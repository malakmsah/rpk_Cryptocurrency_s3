import web3 from "./web3";

const address = "FILL_ME_IN"; // address of my token

const abi = "FILL_ME_IN"; //


export default new web3.eth.Contract(abi, address);