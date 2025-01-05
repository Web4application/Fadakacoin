import React, { useState } from 'react';
import connectMetaMask from './metamask';
import getBinanceMarketData from './binance';
import getBlockNumber from './infura';

function AIFunctions() {
  const [account, setAccount] = useState('');
  const [marketData, setMarketData] = useState([]);

  const handleConnectMetaMask = async () => {
    await connectMetaMask();
    const accounts = await web3.eth.getAccounts();
    setAccount(accounts[0]);
  };

  const handleGetBinanceMarketData = async () => {
    const data = await getBinanceMarketData();
    setMarketData(data);
  };

  const handleGetBlockNumber = async () => {
    await getBlockNumber();
  };

  return (
    <div>
      <h1>Web4asset Integrations</h1>
      <button onClick={handleConnectMetaMask}>Connect MetaMask</button>
      <p>Connected Account: {account}</p>
      <button onClick={handleGetBinanceMarketData}>Get Market Data</button>
      <ul>
        {marketData.map((data, index) => (
          <li key={index}>{data.symbol}: {data.price}</li>
        ))}
      </ul>
      <button onClick={handleGetBlockNumber}>Get Block Number</button>
    </div>
  );
}

export default AIFunctions;
