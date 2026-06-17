Cloud Computing Foundations — Virtualization, VMs & Hypervisors
Introduction
Before learning Cloud Computing platforms like Microsoft Azure, Amazon Web Services, or Google Cloud, it is important to understand the core infrastructure concepts behind the cloud.
This guide explains:
•	Servers 
•	Virtualization 
•	Virtual Machines (VMs) 
•	Hypervisors 
•	Networking Basics 
•	Storage Basics 
•	Containers 
•	How Cloud Works Internally 
________________________________________
1. What is a Server?
A server is a powerful computer that provides services to other computers over a network.
Examples
•	Hosting websites 
•	Running databases 
•	File storage 
•	Email services 
________________________________________
2. Traditional Physical Infrastructure
Earlier systems followed:
1 Physical Server = 1 Application
Example:
•	One server for database 
•	One server for email 
•	One server for web hosting 
Problems
•	High cost 
•	Resource wastage 
•	Difficult maintenance 
•	Poor scalability 
________________________________________
3. What is Virtualization?
Virtualization is the process of creating multiple virtual computers inside a single physical server.
Definition
Virtualization allows one physical machine to run multiple virtual machines independently.
________________________________________
4. What is a Virtual Machine (VM)?
A Virtual Machine (VM) is a software-based computer that behaves like a real computer.
A VM Includes
•	Virtual CPU 
•	Virtual RAM 
•	Virtual Storage 
•	Operating System 
Example
A laptop running:
•	Windows as Host OS 
•	Ubuntu inside VirtualBox as VM 
________________________________________
5. Advantages of Virtual Machines
•	Better resource utilization 
•	Reduced hardware cost 
•	Isolation between applications 
•	Easy backup and recovery 
•	Scalability 
________________________________________
6. What is a Hypervisor?
A Hypervisor is software that creates and manages Virtual Machines.
Architecture
Physical Hardware
       ↓
   Hypervisor
       ↓
 Multiple VMs
The hypervisor allocates:
•	CPU 
•	RAM 
•	Storage 
•	Networking 
to each VM.
________________________________________
7. Types of Hypervisors
Type 1 Hypervisor (Bare Metal)
Runs directly on hardware.
Examples
•	VMware ESXi 
•	Microsoft Hyper-V 
Used In
•	Data centers 
•	Enterprise environments 
•	Cloud providers 
________________________________________
Type 2 Hypervisor
Runs on top of an operating system.
Examples
•	Oracle VM VirtualBox 
•	VMware Workstation 
Used For
•	Personal labs 
•	Learning virtualization 
________________________________________
8. How Cloud Computing Uses Virtualization
Cloud providers own massive data centers with:
•	Thousands of physical servers 
•	Hypervisors installed 
•	Millions of virtual machines 
When users create cloud resources, the provider dynamically creates VMs using virtualization technology.
________________________________________
9. Networking Basics for Cloud
Important networking concepts:
•	IP Address 
•	Public IP 
•	Private IP 
•	DNS 
•	Routers 
•	Switches 
•	Ports 
Networking is essential because cloud systems communicate over networks.
________________________________________
10. Storage Basics
Types of Storage
Block Storage
Used for:
•	Virtual machine disks 
•	Databases 
File Storage
Used for:
•	Shared file systems 
Object Storage
Used for:
•	Images 
•	Videos 
•	Backups 
________________________________________
11. What are Containers?
Containers are lightweight environments used to run applications.
Popular Container Technologies
•	Docker 
•	Kubernetes 
________________________________________
12. VM vs Container
Virtual Machine	Container
Includes full OS	Shares host OS
Heavyweight	Lightweight
Slower startup	Faster startup
More resource usage	Less resource usage
________________________________________
13. Scalability and Elasticity
Scalability
Ability to increase system capacity by adding resources.
Example:
2 Servers → 5 Servers
________________________________________
Elasticity
Ability to automatically increase or decrease resources based on demand.
Example:
Auto scale during high traffic
Auto reduce during low traffic
________________________________________
14. On-Premises vs Cloud Infrastructure
On-Premises	Cloud
Physical hardware purchase	Virtual resources
Manual scaling	Auto scaling
High maintenance	Managed services
Slow deployment	Fast deployment
Expensive upfront cost	Pay-as-you-go
________________________________________
15. Azure Cloud Example
Using Microsoft Azure:
•	Create VMs instantly 
•	Scale clusters automatically 
•	Use virtual networking 
•	Store data in cloud storage 
Cloud platforms use virtualization internally to provide resources quickly.

