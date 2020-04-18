package services

import "net/http"

type HelloService struct{}

type HelloRequest struct {
	Name string
}

type HelloResponse struct {
	Msg string
}

func (s *HelloService) Hello(r *http.Request, req *HelloRequest, resp *HelloResponse) error {
	resp.Msg = "hello " + req.Name
	return nil
}
