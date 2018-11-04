package main

import (
	"github.com/0xsegfault/kubernetes-hyperledger/api/server"
)

func main() {
	s := server.NewServer(8000)

	s.Start()
}
