## Shyft Ring

Implementation of a wallet app https://github.com/ShyftNetwork/shyft_wallet_app_node.

### Running Locally

Requires multiple modules in geth as a dependencies, if run from within the geth repo the dependencies will be available.

`go run app.go`

This will run using the test certificates included in the repo and binding to localhost. This is suitable for testing the server and client on a local environment.

For running on a remote server with proper TLS certs, view below.

### Creating TLS Certs On Remote Server and Running on Remote Server

Copy ./example_openssl_config/openssl_env.cnf to the server and run

```
openssl genrsa -out server.key 2048
openssl ecparam -genkey -name secp384r1 -out server.key
SUBJECTALTNAME="IP.1:<ring_public_ip>" openssl req -new -x509 -sha256 -key server.key -out server.crt -days 3650 -config openssl_env.cnf ## these fields can be empty
```

Run with the `ring-certificate`, `ring-key`, and `host` flags:

`go run app.go -ring-certificate server.crt   -ring-key server.key   -host <ring_public_ip>`
