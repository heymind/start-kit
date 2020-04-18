package main

import (
	"net/http"

	"app/services"

	"github.com/gorilla/rpc/v2"
	"github.com/gorilla/rpc/v2/json"
)

func main() {
	s := rpc.NewServer()
	s.RegisterCodec(json.NewCodec(), "application/json")
	s.RegisterService(new(services.HelloService), "")
	http.Handle("/gateway", s)
	http.ListenAndServe(":8080", nil)
}
