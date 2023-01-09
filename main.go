package main

import (
	"fmt"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world")

}

func main() {
	fmt.Println("Server is starting on port 8080...")
	http.HandleFunc("/", indexHandler)
	http.ListenAndServe(":8080", nil)
}
