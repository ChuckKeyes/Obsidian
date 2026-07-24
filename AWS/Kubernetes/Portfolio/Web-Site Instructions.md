
# 🚀 Recommended Setup (FOR YOUR PROJECTS)

## Step 1 — Create repo

Name it:

keyescloudsolutions.com

OR

portfolio-site

---

## Step 2 — Enable GitHub Pages

Go to:

- Settings → Pages
- Source → `main branch`

---

## Step 3 — Add your domain

In GitHub Pages settings:

Custom domain: keyescloudsolutions.com

---

## Step 4 — Update DNS (Route 53)

In Amazon Web Services Route 53:

### Add:

Type: A  
Name: keyescloudsolutions.com  
Value:  
185.199.108.153  
185.199.109.153  
185.199.110.153  
185.199.111.153

---

### Optional (www)

Type: CNAME  
Name: www  
Value: your-github-username.github.io

---

# 🔥 What you get

Once done:

👉 `https://keyescloudsolutions.com`  
➡️ loads your GitHub-hosted site

---

# 🧠 When WOULD you need AWS hosting?

Only if you want:

- Dynamic backend (APIs, DB)
- Authentication
- Real applications

👉 Your portfolio = static → GitHub is perfect

---

# ⚔️ GitHub vs AWS (for YOU)

|Feature|GitHub Pages|AWS S3|
|---|---|---|
|Cost|FREE|Paid|
|Setup|Easy|Medium|
|CI/CD|Built-in (git push)|Needs setup|
|Best for|Portfolio|Production apps|

---

# 🎯 My Recommendation

👉 Use:

## ✅ GitHub Pages + keyescloudsolutions.com

And later (advanced):

👉 You can **front it with CloudFront** for Lab-style architecture

---

# 🏁 Final Answer

👉 You do NOT need to rent hosting  
👉 Yes, your site can (and should) be hosted on GitHub