package main

import (
	"log"

	"github.com/DefiantLabs/cosmos-tax-cli-private/cmd"
)

func main() {
	//simplest main as recommended by the Cobra package
	err := cmd.Execute()
	if err != nil {
		log.Fatalf("Failed to exectute. Err: %v", err)
	}
}
