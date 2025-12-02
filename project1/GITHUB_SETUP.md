# How to Push to GitHub

## 1. Create a Repository on GitHub
1. Go to [github.com/new](https://github.com/new).
2. Enter a repository name (e.g., `devops-java-project`).
3. Choose **Public** or **Private**.
4. **Do not** initialize with a README, .gitignore, or License (we already have them).
5. Click **Create repository**.

## 2. Push Your Code
Open your terminal (PowerShell or Git Bash) in the `c:\project` folder and run these commands:

```bash
# Initialize Git
git init

# Add all files
git add .

# Commit the files
git commit -m "Initial commit: Java DevOps Project"

# Rename branch to main
git branch -M main

# Link to your GitHub repo (Replace URL with your actual repo URL)
git remote add origin https://github.com/YOUR_USERNAME/devops-java-project.git

# Push to GitHub
git push -u origin main
```

## 3. Verify
Refresh your GitHub repository page. You should see all your files there!
