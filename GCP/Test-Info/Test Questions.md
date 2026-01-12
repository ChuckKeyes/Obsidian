
1) The development team has submitted a ticket for a web application that is crashing due to high CPU utilization. The network admin has suggested creating a Managed Instance Group to handle the load. Which suggested configuration below could solve the problem? 
2) 
	1) A. Create a Managed Instance Group with an autoscaling policy based on load balancing serving capacity. 
	2) B. Create a Managed Instance Group with a cluster autoscaler with a fixed minimum and a maximum number of instances. 
	3) C. Create a Managed Instance Group with an autohealing policy that attempts to recreate the crashed instance. 
	4) D. Create a Managed Instance Group with an autoscaling policy based on CPU utilization.
### Option Review

- **A. MIG with autoscaling policy based on load balancing serving capacity**  
    → This helps scale based on requests handled, but doesn’t directly address **CPU spikes**.
    
- **B. MIG with a cluster autoscaler with min/max instances**  
    → Cluster autoscaler is for **GKE (Kubernetes Engine)**, not Compute Engine MIGs. Wrong scope.
    
- **C. MIG with an autohealing policy**  
    → Autohealing **recreates failed/crashed instances**, but doesn’t solve the CPU load problem (just replaces unhealthy VMs).
    
- **D. MIG with an autoscaling policy based on CPU utilization** ✅  
    → **Correct.** This directly addresses high CPU load by scaling VM instances horizontally when utilization exceeds a threshold.
    
    **Chapter 6: [[Managing Single Virtual Machine]]
- **Page 138–140**  
    Explains how **managed instance groups support autoscaling and load balancing**, including autoscaling policies that can be triggered by CPU utilization, Stackdriver metrics, or load balancing capacity