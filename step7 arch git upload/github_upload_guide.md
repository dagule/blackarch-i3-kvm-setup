# 📤 How to Upload Your Project to GitHub

## 🎯 Prerequisites

Before you start, make sure you have:
- ✅ A GitHub account ([Sign up here](https://github.com/signup))
- ✅ Git installed on your system
- ✅ Your three script files ready

---

## 📋 Method 1: Using GitHub Web Interface (Easiest for Beginners)

### Step 1: Create a New Repository

1. **Go to GitHub** and login
2. Click the **"+"** icon in the top-right corner
3. Select **"New repository"**

4. **Fill in the details:**
   ```
   Repository name: blackarch-i3-kvm-setup
   Description: Automated BlackArch Linux setup with i3WM and KVM virtualization
   ✅ Public (recommended) or Private
   ✅ Add a README file (uncheck this - we have our own)
   ✅ Add .gitignore: None
   ✅ Choose a license: MIT License (recommended)
   ```

5. Click **"Create repository"**

### Step 2: Upload Your Files

1. On your new repository page, click **"uploading an existing file"** or **"Add file" → "Upload files"**

2. **Drag and drop** or click to select these files:
   - `blackarch_i3_setup.sh`
   - `troubleshoot.sh`
   - `README.md`

3. Scroll down to **"Commit changes"**
   ```
   Commit message: Initial commit - Setup scripts and documentation
   ```

4. Click **"Commit changes"**

✅ **Done!** Your repository is now live.

---

## 📋 Method 2: Using Git Command Line (Recommended)

### Step 1: Install Git (if not already installed)

```bash
# On Arch Linux / BlackArch
sudo pacman -S git

# On Ubuntu / Debian
sudo apt install git

# Verify installation
git --version
```

### Step 2: Configure Git

```bash
# Set your name and email (use your GitHub email)
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Verify configuration
git config --list
```

### Step 3: Create a New Repository on GitHub

1. Go to [GitHub](https://github.com) and login
2. Click **"+"** → **"New repository"**
3. Repository name: `blackarch-i3-kvm-setup`
4. Description: `Automated BlackArch Linux setup with i3WM and KVM virtualization`
5. Choose **Public**
6. **DO NOT** check "Add a README file"
7. Click **"Create repository"**

### Step 4: Prepare Your Local Files

```bash
# Create a project directory
mkdir -p ~/blackarch-i3-kvm-setup
cd ~/blackarch-i3-kvm-setup

# Create/move your three files here:
# - blackarch_i3_setup.sh
# - troubleshoot.sh
# - README.md

# Make scripts executable
chmod +x blackarch_i3_setup.sh
chmod +x troubleshoot.sh
```

### Step 5: Initialize Git Repository

```bash
# Initialize git in the directory
git init

# Add all files
git add .

# Make first commit
git commit -m "Initial commit - Setup scripts and documentation"
```

### Step 6: Connect to GitHub and Push

```bash
# Add your GitHub repository as remote
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup.git

# Verify remote is added
git remote -v

# Push to GitHub (main branch)
git branch -M main
git push -u origin main
```

### Step 7: Enter GitHub Credentials

When prompted:
- **Username:** Your GitHub username
- **Password:** Your GitHub **Personal Access Token** (NOT your password)

#### 🔑 How to Create a Personal Access Token:

1. Go to GitHub Settings → [Developer settings](https://github.com/settings/tokens)
2. Click **"Personal access tokens"** → **"Tokens (classic)"**
3. Click **"Generate new token"** → **"Generate new token (classic)"**
4. Give it a name: `Git CLI Access`
5. Select expiration: `90 days` or `No expiration`
6. Check scope: **`repo`** (full control of private repositories)
7. Click **"Generate token"**
8. **⚠️ COPY THE TOKEN IMMEDIATELY** (you won't see it again!)
9. Use this token as your password when pushing

✅ **Done!** Your files are now on GitHub.

---

## 📋 Method 3: Using GitHub CLI (Advanced)

### Step 1: Install GitHub CLI

```bash
# On Arch Linux
sudo pacman -S github-cli

# On Ubuntu/Debian
sudo apt install gh

# Verify installation
gh --version
```

### Step 2: Authenticate

```bash
# Login to GitHub
gh auth login

# Follow the prompts:
# - What account do you want to log into? GitHub.com
# - What is your preferred protocol? HTTPS
# - Authenticate Git with your GitHub credentials? Yes
# - How would you like to authenticate? Login with a web browser
# - Copy the one-time code and press Enter
```

### Step 3: Create and Push Repository

```bash
# Navigate to your project directory
cd ~/blackarch-i3-kvm-setup

# Initialize git
git init
git add .
git commit -m "Initial commit - Setup scripts and documentation"

# Create GitHub repository and push
gh repo create blackarch-i3-kvm-setup --public --source=. --push

# Or for private repository
gh repo create blackarch-i3-kvm-setup --private --source=. --push
```

✅ **Done!** Your repository is created and pushed automatically.

---

## 🔄 Making Changes After Initial Upload

### Adding or Updating Files

```bash
# Navigate to your project
cd ~/blackarch-i3-kvm-setup

# Make your changes to files

# Check what changed
git status

# Add changed files
git add .

# Or add specific files
git add blackarch_i3_setup.sh

# Commit changes
git commit -m "Updated installation script with bug fixes"

# Push to GitHub
git push
```

### Common Git Commands

```bash
# Check status
git status

# View commit history
git log

# View changes
git diff

# Pull latest changes from GitHub
git pull

# Create a new branch
git checkout -b feature-branch

# Switch branches
git checkout main

# Merge branch
git merge feature-branch
```

---

## 📁 Recommended Project Structure

```
blackarch-i3-kvm-setup/
├── README.md                    # Main documentation
├── blackarch_i3_setup.sh       # Main installation script
├── troubleshoot.sh             # Troubleshooting utility
├── LICENSE                      # MIT License (auto-created)
├── .gitignore                  # Files to ignore (optional)
├── screenshots/                # Screenshots folder (optional)
│   ├── desktop.png
│   └── terminal.png
└── docs/                       # Additional documentation (optional)
    ├── INSTALLATION.md
    └── TROUBLESHOOTING.md
```

### Optional: Create .gitignore

```bash
# Create .gitignore file
cat > .gitignore << 'EOF'
# Ignore backup files
*.bak
*.swp
*.tmp
*~

# Ignore log files
*.log

# Ignore OS files
.DS_Store
Thumbs.db

# Ignore IDE files
.vscode/
.idea/
EOF

# Add and commit
git add .gitignore
git commit -m "Add .gitignore"
git push
```

---

## 🎨 Optional: Add Screenshots

```bash
# Create screenshots directory
mkdir screenshots

# Take screenshots (on i3)
# Install scrot if needed
sudo pacman -S scrot

# Take screenshot
scrot ~/blackarch-i3-kvm-setup/screenshots/desktop.png

# Or use flameshot
flameshot gui

# Add to git
git add screenshots/
git commit -m "Add desktop screenshots"
git push
```

### Update README to Include Screenshots

Add this to your README.md:

```markdown
## 📸 Screenshots

### Desktop Environment
![Desktop](screenshots/desktop.png)

### Virt-Manager
![VirtManager](screenshots/virtmanager.png)
```

---

## 🏷️ Creating a Release

### Option 1: Web Interface

1. Go to your repository on GitHub
2. Click **"Releases"** on the right sidebar
3. Click **"Create a new release"**
4. Fill in:
   ```
   Tag version: v1.0.0
   Release title: Initial Release
   Description: First stable release with installation and troubleshooting scripts
   ```
5. Click **"Publish release"**

### Option 2: Command Line

```bash
# Create and push a tag
git tag -a v1.0.0 -m "Initial release"
git push origin v1.0.0

# Create release with GitHub CLI
gh release create v1.0.0 --title "Initial Release" --notes "First stable release"
```

---

## 🔧 Troubleshooting GitHub Upload

### Problem: Permission Denied

```bash
# Solution: Use Personal Access Token instead of password
# Generate token at: https://github.com/settings/tokens
```

### Problem: Fatal: remote origin already exists

```bash
# Solution: Remove and re-add remote
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup.git
```

### Problem: Updates were rejected (non-fast-forward)

```bash
# Solution: Pull first, then push
git pull origin main --rebase
git push origin main
```

### Problem: Large files rejected

```bash
# GitHub has 100MB file limit
# Solution: Use Git LFS for large files
git lfs install
git lfs track "*.iso"
git add .gitattributes
git commit -m "Add Git LFS"
git push
```

---

## ✅ Final Checklist

Before publishing, make sure:

- [ ] All files are uploaded
- [ ] README.md displays correctly
- [ ] Scripts have proper permissions
- [ ] License is added
- [ ] Repository description is set
- [ ] Topics/tags are added (Settings → Topics)
- [ ] Repository is public (if intended)
- [ ] Personal information is removed
- [ ] Links in README work
- [ ] Scripts are tested

### Add Topics to Your Repository

1. Go to your repository on GitHub
2. Click the gear icon ⚙️ next to "About"
3. Add topics:
   ```
   arch-linux, blackarch, i3wm, kvm, virtualization, 
   penetration-testing, security, automation
   ```

---

## 🎉 Share Your Repository

Once uploaded, share your repository link:

```
https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup
```

**Quick install command for users:**

```bash
git clone https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup.git
cd blackarch-i3-kvm-setup
sudo ./blackarch_i3_setup.sh
```

---

## 📚 Additional Resources

- [GitHub Docs](https://docs.github.com)
- [Git Documentation](https://git-scm.com/doc)
- [GitHub CLI Manual](https://cli.github.com/manual)
- [Markdown Guide](https://www.markdownguide.org)

---

**🎊 Congratulations!** Your project is now on GitHub and ready to share with the world!