# <img src="https://github.com/kubesimplify/cloudnative-lab/assets/72245772/de679a18-a457-43c0-9cb8-e75d6b87b348" alt="poster" width=50px height=50px align="center"> Episode - Building a Kubernetes Operator

## Aim

To learn the concepts involved and build a **Kubernetes Operator** from scratch!

## Technologies being used

- Go
- Kubernetes API
- [Kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)

## Project Breakdown/Milestones

### Day 1 - Basics of Go
- [x] Basic data types
- [x] Structs
- [x] Pointers
- [x] Interfaces
- [x] Basic overview for packages and exports 
- [x] Go-routine (optional)

### Day 2 - Kubernetes Concepts 

**Why Build a Kubernetes Operator?**

- [ ] What is a Kubernetes Operator (Resource + controller)
- [ ] Explain kubernetes as a platform.
- [ ] Explain Resources as “Core blocks” of the platform (use examples).
- [ ] Explain Controller as “Driver of Core blocks” of the platform 
- [ ] Explain “Extending Kubernetes without changing main code”.

**Pre-requisites (Kubernetes API server)**

- [ ] Kubectl under the hood.
- [ ] Explain API conventions.
- [ ] Explain Group, Version, Resource and Kinds.
- [ ] Kind v/s Resource **(IMP)**
- [ ] Analogy of Kinds as classes and Resources as Instance
- [ ] How the URLs work when talking to Kubernetes API server.

**Recap of main takeaways**

### Day 3 - Building the Operator

**Intro to kubebuilder**
- [ ] Documentation overview

**Getting Started:**

- [ ] Define a Project
- Concepts:
    - [ ] Manager
    - [ ] Schemes (with an example)
    - [ ] Main file for manager

**Defining a new API - Some important Concepts**

- [ ] TypeMeta
- [ ] ObjectMeta
- [ ] Spec
- [ ] Status
- [ ] Briefly touch
- [ ] DeepCopy funcs
- [ ] GroupVersion
- [ ] Controller
- [ ] Reconcile struct
- [ ] Reconcile function

**Make it work 🎉**


## Resources


