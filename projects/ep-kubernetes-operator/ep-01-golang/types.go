package main

import "fmt"

type Discord interface {
	Meeting(string) error
}

type Kubesimplify struct {
	Url string
}

type Kubernetes struct {
	Url string
}

func (this *Kubernetes) Meeting(text string) error {
	fmt.Println("Kubernetes msg", text)
	return nil
}

func (this *Kubesimplify) Meeting(text string) error {
	fmt.Println("Kubesimplify msg", text)
	return nil
}
