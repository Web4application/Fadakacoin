import WalletConnect from "@trustwallet/walletconnect";
import QRCodeModal from "@walletconnect/qrcode-modal";

async function connectTrustWallet() {
  const walletConnector = new WalletConnect({
    bridge: "https://bridge.walletconnect.org", // Required
    qrcodeModal: QRCodeModal,
  });

  // Check if connection is already established
  if (!walletConnector.connected) {
    // Create a new session
    await walletConnector.createSession();
  }

  // Subscribe to connection events
  walletConnector.on("connect", (error, payload) => {
    if (error) {
      throw error;
    }

    // Get provided accounts and chainId
    const { accounts, chainId } = payload.params[0];
    console.log(accounts, chainId);
  });

  walletConnector.on("session_update", (error, payload) => {
    if (error) {
      throw error;
    }

    // Get updated accounts and chainId
    const { accounts, chainId } = payload.params[0];
    console.log(accounts, chainId);
  });

  walletConnector.on("disconnect", (error, payload) => {
    if (error) {
      throw error;
    }

    // Delete walletConnector
    console.log("Disconnected");
  });
}

export default connectTrustWallet;
