package server

import (
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/gorilla/handlers"

	"github.com/0xsegfault/kubernetes-hyperledger/api/router"
)

// Server - server object
type Server struct {
	Port int
	Addr string
}

// Start - start the server
func (s *Server) Start() {
	log.Printf("Starting server on port %d", s.Port)

	r := router.NewRouter()

	handler := handlers.LoggingHandler(os.Stdout, handlers.CORS(
		handlers.AllowedOrigins([]string{"*"}),
		handlers.AllowedMethods([]string{"GET", "PUT", "PATCH", "POST", "DELETE", "OPTIONS"}),
		handlers.AllowedHeaders([]string{"Content-Type", "Origin", "Cache-Control"}),
		handlers.ExposedHeaders([]string{""}),
		handlers.MaxAge(1000),
		handlers.AllowCredentials(),
	)(r))
	handler = handlers.RecoveryHandler(handlers.PrintRecoveryStack(true))(handler)

	serv := &http.Server{
		Addr:           s.Addr,
		Handler:        handler,
		ReadTimeout:    10 * time.Second,
		WriteTimeout:   10 * time.Second,
		MaxHeaderBytes: 1 << 20,
	}

	log.Fatal(serv.ListenAndServe())
}

// NewServer - creates new server
func NewServer(port int) *Server {
	return &Server{
		Port: port,
		Addr: ":" + strconv.Itoa(port),
	}
}
