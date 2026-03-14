# ☁️ Cloud-Native Weather Microservice 
### From Python Code to Kubernetes Orchestration
## 1. The Goal
I wanted to build more than just a website. I built a resilient microservice designed for the cloud. The goal was to create an application that can be packaged (Docker), managed (Kubernetes), and scale automatically.

## 2. What I Built
* The App: A Python/Flask API that serves weather data in both HTML (for humans) and JSON (for other machines).

* The Container: A Docker image that packages the code, libraries, and OS settings into one "shipping container."

* The Cluster: A Kubernetes environment where I deployed 2 replicas of the app for high availability.

## 3. Challenges I Faced (and how I solved them)
* The "Local Image" Trap:
   * Challenge: When I first moved to Kubernetes, the pods failed because they were looking for my image on the internet            (Docker Hub).
  * Solution: I learned about the imagePullPolicy: Never setting and how to load local images directly into the Minikube node.
 
* YAML Indentation Errors:
   * Challenge: I faced "unknown field" errors because my YAML structure was slightly off.
  * Solution: I mastered the hierarchy of Kubernetes objects—understanding that containers must live inside a template,          which lives inside a spec.
  
* Network Isolation:
   * Challenge: The app was running inside the cluster, but I couldn't see it in my browser.
   * Solution: I implemented a NodePort Service to map internal ports to my local machine, using minikube service to create       a secure tunnel.
 
## 4. Technical Achievements

* Self-Healing: Verified that if a pod is deleted, the Deployment controller automatically restores the "desired state" by     spinning up a new pod.

*  Load Balancing: Configured a Service to distribute traffic across multiple pod replicas.

*  Containerization: Optimized the Dockerfile to ensure a lightweight and portable environment.

## 5. How to Run This

## Build the image
docker build -t my-app:v1 .

## Load into Minikube
minikube image load my-app:v1

## Deploy
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## Access the app
minikube service weather-service --url
