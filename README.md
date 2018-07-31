# loom-docker

A docker container to run a Loom dAppChain

## Getting started

Pre-requiste

1. Write your smart contract into a folder "/workspace/foo/MySideChainContract.sol"

2. 
```
docker run \ 
    -p 46656:46656 -p 46657:46657 -p 46658:46658 -p 9999:9999 \
    -v /workspace/foo:/loom/contracts \
    -e CONTRACT_NAME=MySideChainContract \
     gjeanmart/loom-docker
```


## Samples

Checkout the code in https://github.com/gjeanmart/loom-docker/tree/master/samples

### Simple Storage

```
docker run \ 
    -p 46656:46656 -p 46657:46657 -p 46658:46658 -p 9999:9999 \
    -v /path/to/loom-docker/samples/simple:/loom/contracts \
    -e CONTRACT_NAME=SimpleStorage \
     gjeanmart/loom-docker
```


### Simple Social Network
TODO



## TODO List

- Manage multi-file contracts
- Manage peers