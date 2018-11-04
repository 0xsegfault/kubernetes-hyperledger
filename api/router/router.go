package router

import (
	"net/http"

	"github.com/gorilla/mux"
)

const (
	staticDir = "/static/"
)

// Health - health check
func Health() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("System is alive!"))
	}
}

// Middleware - Main Middleware Func for the whole application
func Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		next.ServeHTTP(w, r)
	})
}

// NewRouter - returns a new instance of router
func NewRouter() *mux.Router {
	r := mux.NewRouter().StrictSlash(true)

	r.PathPrefix(staticDir).Handler(http.StripPrefix(staticDir, http.FileServer(http.Dir("."+staticDir))))
	r.Methods("GET").Path("/health").Name("Health").Handler(Health())
	r.Use(Middleware)

	return r
}
