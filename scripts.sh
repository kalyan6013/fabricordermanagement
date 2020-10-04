docker exec -it cli bash

# peer channel create -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/AB_Channel.tx -c abchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

peer channel create -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/AM_Channel.tx -c amchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

# peer channel join -b abchannel.block

peer channel join -b amchannel.block

# peer channel update -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/BuyerMSPAB_Channelanchors.tx -c abchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

peer channel update -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/BuyerMSPAM_Channelanchors.tx -c amchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

peer chaincode install -l node -n ordercc -v 1.0 -p /opt/gopath/src/github.com/chaincode/order/javascript

export CORE_PEER_ADDRESS=peer1.buyer.orderermanagement.com:8051
export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/peers/peer1.buyer.orderermanagement.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/peers/peer1.buyer.orderermanagement.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/peers/peer1.buyer.orderermanagement.com/tls/ca.crt

peer channel join -b abchannel.block

peer channel join -b amchannel.block

peer chaincode install -n mycc -v 1.0 -p /opt/gopath/src/github.com/chaincode/chaincode_example02/go/

export CORE_PEER_ADDRESS=peer0.seller.orderermanagement.com:11051
export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer0.seller.orderermanagement.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer0.seller.orderermanagement.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer0.seller.orderermanagement.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/users/Admin@seller.orderermanagement.com/msp
export CORE_PEER_LOCALMSPID=sellerMSP

peer channel join -b amchannel.block

peer channel update -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/sellerMSPAM_Channelanchors.tx -c amchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

peer chaincode install -n mycc -v 1.0 -p /opt/gopath/src/github.com/chaincode/chaincode_example02/go/

export CORE_PEER_ADDRESS=peer1.seller.orderermanagement.com:12051
export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer1.seller.orderermanagement.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer1.seller.orderermanagement.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer1.seller.orderermanagement.com/tls/ca.crt

# peer channel join -b amchannel.block

# peer chaincode install -n mycc -v 1.0 -p /opt/gopath/src/github.com/chaincode/chaincode_example02/go/

# export CORE_PEER_ADDRESS=peer0.bridgestone.orderermanagement.com:9051
# export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/server.crt
# export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/server.key
# export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/users/Admin@bridgestone.orderermanagement.com/msp
# export CORE_PEER_LOCALMSPID=BridgestoneMSP

# peer channel join -b amchannel.block

# peer channel update -o orderer.orderermanagement.com:7050 -f ./channel-artifacts/BridgestoneMSPAB_Channelanchors.tx -c abchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem

# peer chaincode install -n mycc -v 1.0 -p /opt/gopath/src/github.com/chaincode/chaincode_example02/go/

# export CORE_PEER_ADDRESS=peer1.bridgestone.orderermanagement.com:10051
# export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer1.bridgestone.orderermanagement.com/tls/server.crt
# export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer1.bridgestone.orderermanagement.com/tls/server.key
# export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer1.bridgestone.orderermanagement.com/tls/ca.crt

# peer channel join -b amchannel.block

# peer chaincode install -n mycc -v 1.0 -p /opt/gopath/src/github.com/chaincode/chaincode_example02/go/

# export CORE_PEER_ADDRESS=peer0.bridgestone.orderermanagement.com:9051
# export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/server.crt
# export CORE_PEER_TLS_KEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/seller.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/server.key
# export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/peers/peer0.bridgestone.orderermanagement.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bridgestone.orderermanagement.com/users/Admin@bridgestone.orderermanagement.com/msp
# export CORE_PEER_LOCALMSPID=BridgestoneMSP


export CORE_PEER_ADDRESS=peer0.buyer.orderermanagement.com:7051
export CORE_PEER_LOCALMSPID=BuyerMSP
export CORE_PEER_TLS_CERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/peers/peer0.buyer.orderermanagement.com/tls/server.crt
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/peers/peer0.buyer.orderermanagement.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/buyer.orderermanagement.com/users/Admin@buyer.orderermanagement.com/msp

peer chaincode instantiate -o orderer.orderermanagement.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem -C abchannel -n order -v 1.0 -c ‘{“Args”:[“init”,“a”,“100”,“b”,“200”]}’ -P “AND (BuyerMSP.peer’,BridgestoneMSP.peer’)”

peer chaincode instantiate -o orderer.orderermanagement.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderermanagement.com/orderers/orderer.orderermanagement.com/msp/tlscacerts/tlsca.orderermanagement.com-cert.pem -C amchannel -n order -v 1.0 -c '{"Args":[]}' -P "AND ('BuyerMSP.peer','sellerMSP.peer')"

# peer chaincode query -n mycc -c '{"Args":["query","a"]}'