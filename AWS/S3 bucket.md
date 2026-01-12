
Get static assets

create bucket

Make it publically accessible

Remove the  [block public access] setting
	add a bucket policy
Enable static hosting
https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-policy-language-overview.html

https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-policy-actions.html

set the index and error pages

https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-policy-actions.html

[Tutorial: Configuring a static website on Amazon S3 - Amazon Simple Storage Service](https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)

aws s3 cp s3:[//test](https://test/ "//test")-1256099743/lab-example/ ~/documents/TheoWAF/s3-lab-example/ --recursive

# ✅ **Write-Up: Terraform-Deployed S3 Static Website & Why ACLs Failed**

## **1. Objective**

We built a **static website hosted entirely on Amazon S3**, deployed automatically using **Terraform** — no AWS Console steps.

The site contains:

- An `index.html` page (inline in Terraform)
    
- A background image
    
- A gallery of several Dominican Republic photos
    
- Layout/styling controlled by CSS
    

All website objects (HTML + images) are uploaded using Terraform’s `aws_s3_object` resources.

---

# **2. What We Built (Architecture Overview)**

### **A. S3 Bucket (Terraform-created)**

- Name: `ck-lab-static-site-chuck-001`
    
- Website hosting enabled (`index.html`)
    
- Fully public read access via bucket policy (but **only if your AWS account allows public policies**)
    
- Ownership mode: `BucketOwnerEnforced`
    

### **B. Static Website Endpoint**

S3 generates a site URL like:

`http://ck-lab-static-site-chuck-001.s3-website-us-east-1.amazonaws.com`

The website loads:

- A background image (`images/background1.jpg`)
    
- A gallery of images (`images/dominican1.jpg` … `dominican7.jpg`)
    

### **C. Terraform-managed static objects**

Terraform uploads:

- `index.html`
    
- Multiple images stored in an `images/` folder
    

Each object is stored with:

`content_type = "image/jpeg" source       = "${path.module}/images/...jpg"`

---

# **3. Why Photos Didn’t Upload at First**

You originally had this problem:

> “Only one photo is uploaded and no background.”

Root cause:

### **A. All objects used the SAME S3 key**

Example of the original broken code:

`key = "images/dominican1.jpg"`

You repeated that key for **every image**:

- dominican2
    
- dominican3
    
- dominican4  
    … all overwrote the same object `images/dominican1.jpg`.
    

➡️ Only ONE image survived.

### **B. Background image was never uploaded at all**

There was **no** `aws_s3_object` for:

`images/background1.jpg`

HTML referenced it, but S3 didn’t contain it.  
➡️ No background displayed.

### **C. File extension mismatch (.jpg vs .jpeg)**

If you had `.jpeg` files locally but `.jpg` keys in Terraform/HTML:

➡️ S3 returned 404  
➡️ Browser shows nothing

### **D. Missing local files**

Terraform errors like:

`open ./images/dominican4.jpg: no such file or directory`

Will silently prevent objects from being created.

---

# **4. Why ACLs Do NOT Work (Very Important)**

Your S3 bucket rejected all Terraform attempts to set:

`acl = "public-read"`

with this error:

`AccessControlListNotSupported: The bucket does not allow ACLs`

This is because your bucket is operating in **Object Ownership: BucketOwnerEnforced** mode.

### ❗ What BucketOwnerEnforced does:

1. **Disables all ACLs on the bucket**
    
2. **Disables all ACLs on objects**
    
3. All objects automatically belong to the **bucket owner**
    
4. You **must** use bucket policies for access control
    
5. Any attempt to use ACLs returns a 400 error
    

### This mode exists because:

AWS is pushing everyone to **policy-based access**, NOT legacy ACLs.  
ACLs are considered outdated and insecure.

### Expected behavior:

When or if you try this:

`acl = "public-read"`

you ALWAYS get:

`AccessControlListNotSupported`

because ACLs are fully turned OFF by design.

---

# **5. Why Your Bucket Policy Also Failed at First**

The earlier error:

`blocked by BlockPublicPolicy`

means your **AWS account** was preventing public bucket policies.

Even though Terraform set:

`block_public_policy = false`

that only disables blocking **at the bucket level**.

Your AWS **ACCOUNT** still had:

✔ Block public bucket policies = ON  
✔ Block public access = ON

This prevented:

`Principal = "*" Action = "s3:GetObject"`

from being applied.

➡️ Terraform could not apply your public-read bucket policy  
➡️ S3 website endpoint returned **403 AccessDenied**

Eventually you changed the settings or used a bucket where public policy is allowed.

---

# **6. Final Working Design**

### To get the site functional, these were fixed:

✔ Each image got a unique key  
✔ Background got its own object  
✔ All ACLs removed  
✔ Content type corrected to `image/jpeg`  
✔ Matching source paths (`./images/...`) ensured  
✔ Matching HTML image paths ensured  
✔ Public-read bucket policy applied (when allowed)

Terraform now successfully uploads:

- `index.html`
    
- `/images/background1.jpg`
    
- `/images/dominican1.jpg` through `/images/dominican7.jpg`
    

Your website renders correctly.

---

# **7. Summary (What You Learned)**

### **Terraform Lessons**

- Each S3 object must have a **unique key**
    
- Local source files must **exist and match exactly**
    
- Terraform will not upload multiple objects if their keys match
    
- `content_type` must be correct
    
- Public-read must be implemented with **bucket policies**, not ACLs
    

### **S3 Lessons**

- `BucketOwnerEnforced` = **ACLs disabled forever**
    
- Public access via ACL does **not** work in this mode
    
- Public access via bucket policy works **only if the account allows public policies**
    

---

# **8. If You Want, I Can Generate**

✅ A professionally formatted PDF of this write-up  
✅ A polished README.md for your GitHub / Obsidian notes  
✅ A Terraform module version of this site  
✅ A version using CloudFront + OAC (more secure, no public S3)

Just tell me what you want next.