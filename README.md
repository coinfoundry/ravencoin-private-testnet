## Ravencoin three-node private network in regtest mode

**NOTE:** For some unknown reason getblocktemplate always returns "Dash Core is syncing with network..."

- Node Pool
  - RPC Port 16001, Username: user, Password: pass
- Node Bob
  - RPC Port 16002, Username: user, Password: pass
- Node Alice
  - RPC Port 16003, Username: user, Password: pass

### Addresses

- Pool:
- Bob:
- Alice:

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 17001:16001 -p 17002:16002 -p 17003:16003 coinfoundry/dash-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/dash-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16001/
```
