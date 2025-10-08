# Git Project Workflow

This README documents the complete Git workflow for the `ai-startup-website` project, including user credential setup, repository cloning, branch management, and merging. Each step includes instructions and placeholders for actual screenshots to ensure the workflow is validated and reproducible.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [User Credentials Setup](#user-credentials-setup)
3. [Repository Cloning](#repository-cloning)
4. [Initial Commit](#initial-commit)
5. [Branching and Feature Updates](#branching-and-feature-updates)
6. [Merging Branches](#merging-branches)
7. [Screenshots](#screenshots)

---

## Project Structure

```
02.git-project/
├── README.md
└── ai-startup-website/
    ├── index.html
    └── images/
        ├── credentials-setup.png
        ├── repo-clone.png
        ├── initial-commit.png
        ├── branch-creation.png
        ├── feature-update-commit.png
        ├── merged-branches.png
        └── merging-branches.png
```

---

## User Credentials Setup

Before making commits, configure your Git user credentials:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Screenshot:**  
![User Credentials Setup](./ai-startup-website/images/credentials-setup.png)

---

## Repository Cloning

Clone the repository from GitHub:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

**Screenshot:**  
![Repository Cloning](./ai-startup-website/images/repo-clone.png)

---

## Initial Commit

```bash
git add index.html
git add ai-startup-website/index.html
git commit -m "This is my first commit"
git push origin main
```

**Screenshot:**  
![Initial Commit](./ai-startup-website/images/initial-commit.png)

---

## Branching and Feature Updates

Create and switch branches for new features or updates:

```bash
git checkout -b update-navigation
git add ai-startup-website/index.html
git commit -m "Update navigation bar"
git push origin update-navigation
```

**Screenshot:**  
![Branch Creation](./ai-startup-website/images/branch-creation.png)

**Screenshot:**  
![Feature Update Commit](./ai-startup-website/images/feature-update-commit.png)

---

## Merging Branches

Switch to the main branch, pull updates, and merge feature branches:

```bash
git checkout main
git pull origin update-navigation
git merge update-navigation
```

**Screenshot:**  
![Merged Branches](./ai-startup-website/images/merged-branches.png)

---

## Screenshots

> Replace the placeholders above with actual screenshots for each step to fully validate and reproduce the workflow.

- **User Credentials Setup:**  
  ![User Credentials Setup](./ai-startup-website/images/credentials-setup.png)

- **Repository Cloning:**  
  ![Repository Cloning](./ai-startup-website/images/repo-clone.png)

- **Initial Commit:**  
  ![Initial Commit](./ai-startup-website/images/initial-commit.png)

- **Branch Creation:**  
  ![Branch Creation](./ai-startup-website/images/branch-creation.png)

- **Feature Update Commit:**  
  ![Feature Update Commit](./ai-startup-website/images/feature-update-commit.png)

- **Merged Branches:**  
  ![Merged Branches](./ai-startup-website/images/merged-branches.png)

- **Merging Branches:**  
  ![Merging Branches](./ai-startup-website/images/merging-branches.png)

---