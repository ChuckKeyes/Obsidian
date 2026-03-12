
## What the Lab Is Actually Breaking

The instructor (or autograder) breaks **state**, not code.

Examples:

### 1️⃣ Secret Drift

- Your app code is fine
    
- Terraform is fine
    
- Secrets Manager now has the _wrong password_
    

**Result:**  
App fails even though everything “looks deployed”

---

### 2️⃣ Network Isolation

- EC2 still running
    
- RDS still running
    
- One inbound rule removed
    

**Result:**  
Timeouts and connection errors

---

### 3️⃣ Database Interruption

- Code untouched
    
- Infrastructure untouched
    
- Dependency unavailable
    

**Result:**  
App fails even though EC2 is healthy

---

## Why Redeploying Would Be a Failure

If you redeployed:

- You might “accidentally” fix the issue
    
- You would destroy evidence
    
- You would mask the real root cause
    

That’s why the lab says:

> ❌ Do NOT recreate EC2  
> ❌ Do NOT recreate RDS  
> ❌ Do NOT redeploy infrastructure

Because **real on-call engineers don’t do that either**.

---

## What You Are Being Graded On Instead

You are graded on whether you can answer **these questions**:

1. **Is the alert real?**  
    (Alarm → ALARM)
    
2. **What do the logs say?**  
    (Credential error vs timeout vs unavailable)
    
3. **Which category is this failure?**
    
    - Auth
        
    - Network
        
    - Availability
        
4. **Which system is the source of truth?**
    
    - Parameter Store
        
    - Secrets Manager
        
    - Security Groups
        
    - RDS state
        
5. **Can you recover without guessing?**
    

None of those involve “fixing code”.

---

## This Is Why This Lab Is Important

Most students panic because:

> “Nothing is wrong with my Terraform”

That panic is the lesson.

This lab teaches:

- **Operational maturity**
    
- **On-call discipline**
    
- **Evidence-based debugging**
    
- **Respect for running systems**
    

It is training you to be trusted with production.