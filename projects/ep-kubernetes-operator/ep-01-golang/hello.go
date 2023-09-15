package main

import (
	"fmt"
	"sync"

	"github.com/kubesimplify/cloudnative-lab/projects/ep-kubernetes-operator/ep-01-golang/kubesimplify"
)

var (
	amount int
)

func Add() {
	amount++
	fmt.Println(amount)
}

func main() {
	wg := &sync.WaitGroup{}
	mux := sync.Mutex{}
	wg.Add(10)
	for i := 0; i < 10; i++ {
		go func() {
			defer wg.Done()

			mux.Lock()
			defer mux.Unlock()
			Add()
		}()
	}

	wg.Wait()
	fmt.Println("DONE")

	fmt.Println(kubesimplify.Add(5, 6))
}
