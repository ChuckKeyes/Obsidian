
# 🧠 1. GenAI (Generative AI)

## What it is

Generative AI = AI that **creates content**

- text (chatbots, summaries)
- images
- code
- search answers

---

## When to use

- Chatbots
- Document summarization
- Knowledge assistants
- Code generation

---

## Architect view

```
GenAI = capabilityNOT a specific product
```

---

# 🤖 2. Gemini

## What it is

Gemini = Google’s **foundation model (LLM)**

It powers:

- chat
- reasoning
- code
- multimodal AI (text + images)

---

## When to use

- Need AI responses
- Need chat capability
- Need reasoning over data
- Build GenAI apps quickly

---

## Architect view

```
Gemini = the brain (model)
```

---

# 🧩 3. Dialogflow ES (Essentials)

## What it is

Dialogflow ES = **older/simple chatbot platform**

- intent-based
- rule-driven
- easier setup

---

## When to use

- simple chatbots
- FAQ bots
- IVR systems
- small apps

---

## Limitations

- not great for complex flows
- limited scalability
- less flexible than CX

---

## Architect view

```
Dialogflow ES = basic chatbot
```

---

# 🧠 4. Dialogflow CX

## What it is

Dialogflow CX = **enterprise conversational AI**

- state machine design
- multi-step conversations
- complex workflows

---

## When to use

- call centers
- customer support bots
- multi-step interactions
- enterprise apps

---

## Architect view

```
Dialogflow CX = structured conversation engine
```

---

# 🧠 5. Vertex AI

## What it is

Vertex AI = **AI platform**

- models (Gemini)
- training
- deployment
- pipelines
- ML lifecycle

---

## When to use

- any AI/ML workload
- GenAI apps
- custom models
- enterprise AI platform

---

## Architect view

```
Vertex AI = AI factory + platform
```

---

# 🤖 6. Vertex AI Agent Builder

## What it is

Vertex AI Agent Builder = **tool to build AI agents**

Agents can:

- answer questions
- search company data
- automate tasks
- use RAG

---

## When to use

- AI assistants using company data
- search bots
- customer service agents
- internal knowledge systems

---

## Architect view

```
Agent Builder = glue between data + Gemini + app
```

---

# 🧠 How They Fit Together

```
Gemini = model (brain)Vertex AI = platformAgent Builder = builds AI agentsDialogflow CX = structured conversation flowDialogflow ES = simple chatbot (legacy/basic)GenAI = overall capability
```

---

# 🔥 Real Architecture Example (PCA Style)

```
User (web / mobile / chatbot)        ↓Dialogflow CX (conversation flow)        ↓Vertex AI Agent Builder (RAG + logic)        ↓Gemini (AI response)        ↓BigQuery / Firestore / APIs
```

---

# 🎯 When to Choose What (THIS IS EXAM GOLD)

## Need simple chatbot

👉 Dialogflow ES

## Need complex conversation flows

👉 Dialogflow CX

## Need AI-powered answers

👉 Gemini via Vertex AI

## Need AI over company documents

👉 Vertex AI Agent Builder (RAG)

## Need full AI platform

👉 Vertex AI

---

# ⚠️ Common Exam Traps

## Trap 1:

Use Dialogflow ES for enterprise workflows  
❌ Wrong → use CX

---

## Trap 2:

Use custom model instead of Gemini  
❌ Wrong → use managed model first

---

## Trap 3:

Use BigQuery for chatbot  
❌ Wrong → use Agent Builder / Gemini

---

## Trap 4:

Confuse Agent Builder with Dialogflow  
👉 They can work together

---

# 🏁 Simple Memory Trick

```
Gemini = brainVertex AI = platformAgent Builder = smart assistantDialogflow CX = conversation flowDialogflow ES = basic chatbotGenAI = category
```

---

# 💡 For YOUR Portfolio

If you build this:

```
Global Certification Platform   ↓Chatbot (Dialogflow CX)   ↓Agent Builder (RAG)   ↓Gemini   ↓BigQuery / Firestore
```

That is **very high-level architecture**.