package main

import (
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/rand"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"log"
	"os"
)

// GenerateFadakaWallet generates a wallet for Fadaka blockchain
func GenerateFadakaWallet() (string, string, error) {
	// Generate a new ECDSA private key (you can change the curve if Fadaka uses a different one)
	priv, err := ecdsa.GenerateKey(elliptic.P384(), rand.Reader) // You can change the curve if necessary
	if err != nil {
		return "", "", err
	}

	// Generate the public key
	pub := priv.PublicKey

	// For Fadaka, we'll hash the public key to create the address
	pubKeyBytes := append(pub.X.Bytes(), pub.Y.Bytes()...)
	hashed := sha256.Sum256(pubKeyBytes)

	// For Fadaka, we'll use the last 20 bytes for the address (similar to Ethereum)
	address := hashed[len(hashed)-20:]

	// Convert private key to hexadecimal format
	privateKeyHex := hex.EncodeToString(priv.D.Bytes())

	// Convert address to hexadecimal format (Fadaka's address format)
	addressHex := fmt.Sprintf("0x%s", hex.EncodeToString(address))

	return addressHex, privateKeyHex, nil
}

func saveToFile(address, privateKey string) {
	// Save the wallet information to a file (wallet.txt)
	file, err := os.Create("fadaka_wallet.txt")
	if err != nil {
		log.Fatal("Error creating file:", err)
	}
	defer file.Close()

	// Write the address and private key to the file
	_, err = file.WriteString(fmt.Sprintf("Address: %s\nPrivate Key: %s\n", address, privateKey))
	if err != nil {
		log.Fatal("Error writing to file:", err)
	}

	fmt.Println("Fadaka Wallet saved to fadaka_wallet.txt")
}

func main() {
	// Generate wallet for Fadaka
	address, privateKey, err := GenerateFadakaWallet()
	if err != nil {
		log.Fatal("Error generating wallet:", err)
	}

	// Output wallet details
	fmt.Println("Generated Fadaka Wallet:")
	fmt.Println("Address:", address)
	fmt.Println("Private Key:", privateKey)

	// Save the wallet information to a file
	saveToFile(address, privateKey)
}
