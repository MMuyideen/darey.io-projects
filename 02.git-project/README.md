# Git Project Workflow

This README documents the basic Git workflow used for the `ai-startup-website` project. Follow the steps below to manage your code using Git branches and commits.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [Initial Commit](#initial-commit)
3. [Branching and Feature Updates](#branching-and-feature-updates)
4. [Merging and Pulling Changes](#merging-and-pulling-changes)
5. [Screenshots](#screenshots)

---

## Project Structure

```
02.git-project/
├── README.md
└── ai-startup-website/
    ├── index.html
    └── images/
        ├── initial-commit.png
        ├── branch-creation.png
        ├── feature-update-commit.png
        └── merging-branches.png
```

---

## Initial Commit

```bash
cd 02.git-project
git add index.html
git add ai-startup-website/index.html
git commit -m "This is my first commit"
git push origin main
git push
```

---

## Branching and Feature Updates

Create and switch branches for new features or updates:

```bash
git branch
git checkout -b update-navigation
git branch
git add ai-startup-website/index.html
git status
git commit -m "Update navigation bar"
git push origin update-navigation
```

---

## Merging and Pulling Changes

Switch between branches and pull updates:

```bash
git checkout master
git pull origin update-navigation
git checkout -b add-contact-info
git add ai-startup-website/index.html
git commit -m "Add contact information"
git push origin add-contact-info
```

---

## Screenshots

> see screenshots of terminal or GitHub UI for each step below.

- **Initial Commit:**  
  ![Initial Commit](./images/initial-commit.png)

- **Branch Creation:**  
  ![Branch Creation](./images/branch-creation.png)

- **Feature Update Commit:**  
  ![Feature Update Commit](./images/feature-update-commit.png)

- **Merging Branches:**  
  ![Merging Branches](./images/merging-branches.png)

