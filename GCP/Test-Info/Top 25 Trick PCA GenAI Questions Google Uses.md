
## To Fool Candidates

### (Two answers look right… only ONE is architect-best)

The exam often gives:

- One **technical** answer
- One **Google best-practice** answer

Your job = choose the one with:

```
least opsbest scalemanaged servicessecuritycost efficiencyfast delivery
```

---

# 1. Startup wants chatbot fast

### Choices:

A. Build custom model on GPUs  
B. Use Vertex AI managed model

### Correct:

✅ B

### Why:

Managed beats custom unless specific need exists.

---

# 2. Need company-doc chatbot

### Choices:

A. Fine-tune model on documents  
B. Use RAG architecture

### Correct:

✅ B

### Why:

RAG is cheaper, fresher, safer.

---

# 3. Wrong AI answers appearing

### Choices:

A. Use bigger model  
B. Improve grounding / RAG

### Correct:

✅ B

### Why:

Hallucination often solved by better context, not bigger model.

---

# 4. Sensitive HR data chatbot

### Choices:

A. Upload docs publicly to model store  
B. Use private docs + IAM + RAG

### Correct:

✅ B

---

# 5. Need lowest maintenance

### Choices:

A. GKE cluster hosting model APIs  
B. Cloud Run + Vertex APIs

### Correct:

✅ B

### Why:

Serverless usually wins for ops reduction.

---

# 6. Millions of rows analytics + AI

### Choices:

A. Export CSV files nightly  
B. Use BigQuery native integration

### Correct:

✅ B

---

# 7. AI too expensive

### Choices:

A. Buy bigger committed GPU cluster  
B. Use smaller model + caching + batching

### Correct:

✅ B

---

# 8. Need secure API access

### Choices:

A. Shared admin account  
B. Service accounts + least privilege IAM

### Correct:

✅ B

---

# 9. Need global low latency

### Choices:

A. One US region only  
B. Regional architecture + CDN frontend

### Correct:

✅ B

---

# 10. CEO wants “our own LLM”

### Choices:

A. Immediately build custom model  
B. Validate use case with managed model first

### Correct:

✅ B

---

# 11. Need better model accuracy

### Choices:

A. Fine-tune immediately  
B. Improve prompts + RAG first

### Correct:

✅ B

---

# 12. Need logs for compliance

### Choices:

A. Application logs only  
B. Centralized audit + access + API logs

### Correct:

✅ B

---

# 13. Need internal search assistant

### Choices:

A. Rebuild SharePoint manually  
B. Use indexed docs + embeddings + GenAI

### Correct:

✅ B

---

# 14. Developers need code help

### Choices:

A. Allow full repo + prod secrets access  
B. Scoped repo permissions + coding assistant

### Correct:

✅ B

---

# 15. Bank wants fraud detection

### Choices:

A. Chatbot model  
B. Structured ML pipeline + BigQuery + Vertex

### Correct:

✅ B

### Why:

Fraud is prediction/classification, not chatbot.

---

# 16. Need uptime guarantee

### Choices:

A. One zone deployment  
B. Multi-zone resilient frontend

### Correct:

✅ B

---

# 17. Need faster rollout

### Choices:

A. Manual console deployment  
B. CI/CD pipeline

### Correct:

✅ B

---

# 18. Need private network access

### Choices:

A. Public internet calls with API key  
B. Private connectivity + IAM

### Correct:

✅ B

---

# 19. Existing SQL team owns data

### Choices:

A. Replace with NoSQL first  
B. Use BigQuery + SQL workflows

### Correct:

✅ B

---

# 20. AI answers stale

### Choices:

A. Retrain weekly  
B. Use live data retrieval / RAG

### Correct:

✅ B

---

# 21. Small company no engineers

### Choices:

A. Kubernetes + custom serving  
B. Managed AI services

### Correct:

✅ B

---

# 22. Need content moderation

### Choices:

A. Let model answer anything  
B. Add policy filters + approval workflow

### Correct:

✅ B

---

# 23. Need country-only data visibility

### Choices:

A. App logic only  
B. IAM + row/data access controls

### Correct:

✅ B

---

# 24. Need quick proof of concept

### Choices:

A. Six-month platform build  
B. Managed MVP first

### Correct:

✅ B

---

# 25. Need best architecture choice

### Choices:

A. Most advanced tech stack  
B. Simplest design meeting requirements

### Correct:

✅ B

### This is the MOST important PCA rule.

---

# How Google Tricks You

They tempt you with:

```
KubernetesCustom modelsComplex networkingFine-tuningManual control
```

But often correct answer is:

```
ManagedSimplerCheaperFasterSecureScalable
```

---

# PCA GenAI Elimination Method

When stuck:

## Eliminate answers that:

- Require self-managing GPUs unnecessarily
- Ignore IAM/security
- Add ops burden
- Duplicate services
- Use custom when managed exists
- Break compliance

---

# Your Secret Weapon

Because you already know networking + infrastructure:

You can beat many candidates by choosing:

```
secure + scalable + least ops
```

That is Google architect thinking.