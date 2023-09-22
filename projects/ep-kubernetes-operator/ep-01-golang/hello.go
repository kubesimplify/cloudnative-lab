package main

import (
	"fmt"
	"sync"

	"github.com/kubesimplify/cloudnative-lab/projects/ep-kubernetes-operator/ep-01-golang/kubesimplify"
)

var (
	amount int
)

func BankExampleForCounter() {
	amount++
	fmt.Println(amount)
}

func BasicTypes() {
	var i int64 = 0xff
	fmt.Printf("%d, %x, %s, %o, %v\n", i, i, i, i, i)

	hsMap := make(map[string]any, 0)
	hsMap["hello"] = func() any {
		type Data struct {
			Data string
		}
		return Data{Data: "nice"}
	}()

	fmt.Println(hsMap)
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
			BankExampleForCounter()
		}()
	}

	wg.Wait()
	fmt.Println("DONE")

	fmt.Println(kubesimplify.Add(5, 6))

	BasicTypes()

	var server Discord = &Kubernetes{Url: "kubernetes.io"}
	_ = server.Meeting("Hello from demo!!")
}
