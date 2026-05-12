
**Google Cloud Professional Cloud Architect focus: choose the best solution, justify it like an architect.**

---

# 1. Startup wants chatbot live in 2 weeks

### Best Answer:

Use Vertex AI managed foundation model + Cloud Run frontend.

### Why:

- Fastest time to market
- No GPU management
- Low ops burden

---

# 2. Hospital wants AI assistant using internal policy docs

### Best Answer:

Use RAG with:

- Docs in Cloud Storage
- Embeddings / vector search
- Vertex AI responses
- IAM controls

### Why:

Avoid hallucinations + protect PHI.

---

# 3. Retailer wants demand forecasting

### Best Answer:

Use BigQuery historical sales + Vertex AI forecasting model.

### Why:

Retail data already lives in analytics systems.

---

# 4. Customer wants cheapest GenAI option

### Best Answer:

Use smaller managed model, prompt engineering first.

### Why:

Don’t overpay for large models if not needed.

---

# 5. Global users need low-latency AI responses

### Best Answer:

Use regionalized endpoints + CDN frontend + multi-region architecture.

### Why:

Latency matters more than raw model size.

---

# 6. Legal firm needs document Q&A with citations

### Best Answer:

RAG architecture with chunked documents + source references.

### Why:

Legal requires traceable answers.

---

# 7. Company wants AI but no ML engineers

### Best Answer:

Use Vertex AI managed models and prebuilt pipelines.

### Why:

Reduce staffing complexity.

---

# 8. Bank wants fraud detection

### Best Answer:

Use BigQuery pipelines + custom Vertex AI model + IAM separation.

### Why:

Needs structured predictions + security.

---

# 9. Marketing team wants image generation

### Best Answer:

Use Vertex AI generative media models with approval workflow.

### Why:

Fast content creation with governance.

---

# 10. Executives want weekly summaries from data

### Best Answer:

BigQuery scheduled queries + Vertex AI summarization.

### Why:

Combine analytics + narrative output.

---

# 11. Customer data cannot leave country

### Best Answer:

Choose regional processing, regional storage, compliant model endpoints.

### Why:

Data residency requirement.

---

# 12. Users complain AI gives wrong answers

### Best Answer:

Implement RAG + prompt refinement + grounding.

### Why:

Most errors come from lack of enterprise context.

---

# 13. AI costs doubled unexpectedly

### Best Answer:

Monitor token usage, caching, smaller models, batch requests.

### Why:

Architects control spend.

---

# 14. Internal HR chatbot must only show employee policy data

### Best Answer:

RAG + IAM + separate HR datastore.

### Why:

Prevent leakage of unrelated company data.

---

# 15. Existing SQL team wants AI insights

### Best Answer:

Use BigQuery + SQL workflows + AI integrations.

### Why:

Use existing team strengths.

---

# 16. Need 99.9% uptime AI API

### Best Answer:

Multi-zone frontend + retry logic + regional failover.

### Why:

Model alone doesn’t guarantee availability.

---

# 17. Customer wants model customized to their tone

### Best Answer:

Start with prompting / templates, then fine-tune only if needed.

### Why:

Fine-tuning costs more.

---

# 18. School system wants tutoring assistant

### Best Answer:

RAG using curriculum docs + student-safe moderation.

### Why:

Needs accurate educational grounding.

---

# 19. Call center wants faster agents

### Best Answer:

Real-time assist tool:

- transcript input
- suggested responses
- CRM integration

### Why:

Human-in-loop lowers risk.

---

# 20. CEO says “build our own LLM”

### Best Answer:

Challenge requirement. Use managed model first.

### Why:

Owning models is expensive and slow.

---

# 21. Need audit trail of AI usage

### Best Answer:

Enable logging, IAM identities, request tracing.

### Why:

Compliance + accountability.

---

# 22. Finance wants sensitive spreadsheet analysis

### Best Answer:

Store in BigQuery, governed access, AI summaries from authorized views.

### Why:

Don’t expose raw files broadly.

---

# 23. Millions of support tickets need categorization

### Best Answer:

Batch pipeline with BigQuery + Vertex AI classification.

### Why:

Cheap scalable async processing.

---

# 24. Developers need code assistant

### Best Answer:

Managed coding model with repo permission boundaries.

### Why:

Boost productivity securely.

---

# 25. Customer asks “Which AI service should we use?”

### Best Architect Answer:

```
Need chat? → Vertex AI GenAINeed company-doc answers? → RAGNeed analytics? → BigQuery + AINeed prediction model? → Vertex custom MLNeed cheap fast MVP? → Managed model + Cloud Run
```

---

# PCA Exam Secret Pattern

Most questions reduce to:

```
Fastest?Cheapest?Most secure?Least operations?Most scalable?Compliant?
```

Pick the answer that satisfies business goals **with managed services first**.

---

# What Google Usually Wants You To Choose

### Prefer:

- Managed services
- Serverless where practical
- IAM least privilege
- Scalable storage
- Monitoring/logging
- Cost efficiency
- Regional compliance

### Avoid:

- Self-managed GPUs too early
- Overengineering
- Custom models when managed works
- Ignoring governance