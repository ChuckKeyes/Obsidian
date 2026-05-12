A **LAMP stack** is a classic web application stack used to host websites and web apps.


![[Pasted image 20260511100826.png]]

![[Pasted image 20260511100916.png]]

![[Pasted image 20260511101113.png]]

---

# 🧱 LAMP = 4 components

|Letter|Component|Purpose|
|---|---|---|
|L|Linux|Operating system|
|A|Apache|Web server|
|M|MySQL|Database|
|P|PHP|Server-side programming|

---

# 🌍 How it works

```
Browser   ↓Apache Web Server   ↓PHP Application   ↓MySQL Database
```

Example:

- User visits website
- Apache receives request
- PHP code runs
- PHP queries MySQL
- Website response returned

---

# 🧠 Real example

```
Ubuntu ServerApache2MySQLPHP
```

Very common for:

- WordPress
- Joomla
- Drupal
- older enterprise apps

---

# 🔥 Modern variations

|Stack|Meaning|
|---|---|
|LAMP|Linux + Apache + MySQL + PHP|
|LEMP|Linux + NGINX + MySQL + PHP|
|MEAN|MongoDB + Express + Angular + Node|
|MERN|MongoDB + Express + React + Node|

---

# ☁️ Cloud version

In AWS/GCP:

```
EC2/VM   ↓Apache or NGINX   ↓PHP app   ↓RDS / Cloud SQL
```

---

# 🧠 Why you should know it

Even though modern apps use:

- Kubernetes
- containers
- microservices

many companies STILL run:

- LAMP apps
- WordPress
- PHP systems
- legacy enterprise software

Cloud engineers often migrate these to AWS/GCP.

---

# 🔥 In your portfolio

You could absolutely build:

```
CloudFront   ↓ALB   ↓Apache/PHP EC2   ↓RDS MySQL
```

That is basically a cloud-native LAMP architecture.

---

# 🧠 Interview definition

> “A LAMP stack is a traditional web application stack consisting of Linux, Apache, MySQL, and PHP, commonly used to host dynamic websites and web applications.”