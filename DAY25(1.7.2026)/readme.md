# 🚀 Azure DevOps Notes

A beginner-friendly guide to understanding **DevOps**, **CI/CD**, and **Azure DevOps Pipelines**.

---

# 📚 Table of Contents

- [What is DevOps?](#-what-is-devops)
- [Traditional Software Development vs DevOps](#-traditional-software-development-vs-devops)
- [Azure DevOps Perspective](#-azure-devops-perspective)
- [What is CI/CD?](#-what-is-cicd)
- [Continuous Integration (CI)](#-continuous-integration-ci)
- [Continuous Delivery (CD)](#-continuous-delivery-cd)
- [Continuous Deployment](#-continuous-deployment)
- [CI vs Continuous Delivery vs Continuous Deployment](#-ci-vs-continuous-delivery-vs-continuous-deployment)
- [What is a CI/CD Pipeline?](#-what-is-a-cicd-pipeline)
- [Advantages of CI/CD Pipelines](#-advantages-of-cicd-pipelines)
- [Azure DevOps CI/CD Workflow](#-azure-devops-cicd-workflow)
- [Key Takeaways](#-key-takeaways)

---

# 🚀 What is DevOps?

**DevOps** is a combination of two words:

- **Dev** → Development
- **Ops** → Operations

DevOps is a **culture, set of practices, and collection of tools** that enables Development and Operations teams to work together throughout the software development lifecycle.

Instead of working in isolated teams, everyone collaborates to build, test, deploy, and maintain applications efficiently.

## 🎯 Goals of DevOps

- Deliver software faster
- Improve collaboration between teams
- Automate repetitive tasks
- Reduce deployment failures
- Improve software quality
- Enable continuous feedback
- Deliver value to customers more frequently

---

# 🔄 Traditional Software Development vs DevOps

## Before DevOps

```text
Developer writes code
        │
        ▼
Testing Team tests manually
        │
        ▼
Operations Team deploys
        │
        ▼
Issues found in Production
        │
        ▼
Developer fixes issues
        │
        ▼
Repeat
```

### Problems

- ❌ Manual deployments
- ❌ Slow releases
- ❌ Communication gaps
- ❌ Human errors
- ❌ Difficult rollbacks
- ❌ Delayed feedback

---

## With DevOps

```text
Developer writes code
        │
        ▼
Push to Git Repository
        │
        ▼
CI Pipeline
(Build + Test)
        │
        ▼
CD Pipeline
(Deploy)
        │
        ▼
Application
        │
        ▼
Monitoring
        │
        ▼
Feedback
        │
        ▼
Next Release
```

### Benefits

- ✅ Automated deployments
- ✅ Faster releases
- ✅ Better collaboration
- ✅ Continuous feedback
- ✅ Higher quality software
- ✅ Reliable deployments

---

# ☁️ Azure DevOps Perspective

**Azure DevOps** is Microsoft's cloud-based platform that provides tools for planning, developing, testing, deploying, and monitoring software.

It supports the complete **DevOps lifecycle**.

## Azure DevOps Services

| Service | Purpose |
|----------|----------|
| Azure Boards | Agile Planning and Work Item Tracking |
| Azure Repos | Git Repository for Source Code |
| Azure Pipelines | Build and Release Automation |
| Azure Test Plans | Manual and Exploratory Testing |
| Azure Artifacts | Package Management |

---

## Azure DevOps Workflow

```text
Azure Boards
      │
      ▼
Developer picks User Story
      │
      ▼
Writes Code
      │
      ▼
Pushes to Azure Repos
      │
      ▼
Azure Pipelines Triggered
      │
      ├── Build
      ├── Unit Tests
      ├── Code Analysis
      ├── Package Artifact
      ▼
Deploy to Development
      │
      ▼
Deploy to Testing
      │
      ▼
Deploy to Staging
      │
      ▼
Deploy to Production
```

---

# 🔁 What is CI/CD?

**CI/CD** stands for:

- **CI** → Continuous Integration
- **CD** → Continuous Delivery / Continuous Deployment

CI/CD is a practice that automates the process of:

- Building applications
- Testing applications
- Packaging applications
- Deploying applications

This allows teams to release software faster and more reliably.

---

# ⚙️ Continuous Integration (CI)

Continuous Integration is the practice of **frequently merging code changes into a shared repository**.

Whenever a developer pushes code, an automated pipeline starts.

## CI Workflow

```text
Developer commits code
        │
        ▼
Azure Repos
        │
        ▼
Pipeline Triggered
        │
        ├── Restore Dependencies
        ├── Compile Code
        ├── Run Unit Tests
        ├── Code Quality Checks
        ▼
Generate Build Artifact
```

## Advantages of CI

- Early bug detection
- Automated builds
- Automated testing
- Fast developer feedback
- Better code quality
- Easier collaboration

---

# 🚀 Continuous Delivery (CD)

Continuous Delivery automatically prepares software for deployment.

Applications are automatically deployed to environments like:

- Development
- Testing
- Staging

Production deployment usually requires **manual approval**.

## Workflow

```text
Successful Build
        │
        ▼
Deploy to Development
        │
        ▼
Run Tests
        │
        ▼
Deploy to Testing
        │
        ▼
Approval
        │
        ▼
Production
```

---

# ⚡ Continuous Deployment

Continuous Deployment goes one step further.

If every automated test passes, the application is automatically deployed to Production.

No manual approval is required.

```text
Commit Code
      │
      ▼
Build
      │
      ▼
Test
      │
      ▼
Deploy to Production
```

---

# 📊 CI vs Continuous Delivery vs Continuous Deployment

| Feature | CI | Continuous Delivery | Continuous Deployment |
|----------|:--:|:------------------:|:---------------------:|
| Build Automation | ✅ | ✅ | ✅ |
| Automated Testing | ✅ | ✅ | ✅ |
| Deploy to Test Environment | ❌ | ✅ | ✅ |
| Manual Approval | ❌ | ✅ | ❌ |
| Automatic Production Deployment | ❌ | ❌ | ✅ |

---

# 🔧 What is a CI/CD Pipeline?

A **CI/CD Pipeline** is a sequence of automated stages that transforms source code into a deployed application.

Instead of manually performing each step, Azure Pipelines automates the entire process.

## Pipeline Flow

```text
Source Code
      │
      ▼
Build
      │
      ▼
Unit Testing
      │
      ▼
Static Code Analysis
      │
      ▼
Package Artifact
      │
      ▼
Deploy to Development
      │
      ▼
Deploy to Testing
      │
      ▼
Approval
      │
      ▼
Deploy to Production
```

---

# 🌟 Advantages of CI/CD Pipelines

## 🚀 Faster Software Delivery

Automates the entire release process, enabling frequent and faster deployments.

---

## 🐞 Early Bug Detection

Builds and tests are executed automatically after every code commit, helping detect issues early.

---

## 🤖 Reduced Human Errors

Automation minimizes manual deployment mistakes and ensures consistent releases.

---

## ✅ Improved Code Quality

Only code that passes automated tests and quality checks moves to the next stage.

---

## ⚡ Faster Feedback

Developers immediately know whether their code builds successfully or contains errors.

---

## 🔄 Consistent Deployments

The same deployment process is used across:

- Development
- Testing
- Staging
- Production

This eliminates environment-specific issues.

---

## 🤝 Better Collaboration

Developers, testers, and operations teams work together using the same automated workflow.

---

## 🔙 Easier Rollbacks

Previous application versions can be restored quickly if deployment issues occur.

---

## 📈 Higher Productivity

Engineers spend less time on manual deployment tasks and more time developing features.

---

## 🚀 Reliable Releases

Smaller, frequent releases reduce deployment risks and improve customer satisfaction.

---

# ☁️ Azure DevOps CI/CD Workflow

```text
Developer
     │
     ▼
Azure Repos
     │
     ▼
Azure Pipelines
     │
     ├── Restore Packages
     ├── Build
     ├── Unit Tests
     ├── Code Analysis
     ├── Generate Artifact
     ▼
Development Environment
     │
     ▼
QA Testing
     │
     ▼
Approval
     │
     ▼
Production
     │
     ▼
Monitoring & Feedback
```

---

# 🎯 Key Takeaways

- DevOps is a culture that brings **Development** and **Operations** together.
- Azure DevOps provides an end-to-end platform for planning, coding, testing, and deploying applications.
- **Continuous Integration (CI)** automates building and testing whenever code is committed.
- **Continuous Delivery (CD)** keeps applications deployment-ready with optional approval before production.
- **Continuous Deployment** automatically deploys validated code to production.
- **CI/CD Pipelines** automate software delivery, reduce manual effort, improve quality, and enable faster, more reliable releases.

---

## 📌 Summary

> **DevOps + Azure DevOps + CI/CD = Faster Development + Better Collaboration + Reliable Deployments + High-Quality Software**
