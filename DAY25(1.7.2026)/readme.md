Azure DevOps Notes
What is DevOps?

DevOps is a software development culture that combines Development (Dev) and Operations (Ops) to deliver applications faster, more reliably, and with higher quality.

Instead of developers writing code and handing it over to the operations team at the end, DevOps encourages both teams to collaborate throughout the entire software lifecycle.

The primary goals of DevOps are to:

Deliver software faster
Improve collaboration between teams
Automate repetitive tasks
Reduce deployment failures
Continuously improve applications
Traditional Software Development vs DevOps
Before DevOps
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
Developer fixes and repeats the cycle

Problems:

Slow releases
Manual deployments
Communication gaps
Higher chances of human errors
Difficult rollbacks
Longer feedback cycles
With DevOps
Developer writes code
        │
        ▼
Code pushed to Git Repository
        │
        ▼
CI Pipeline builds and tests
        │
        ▼
CD Pipeline deploys automatically
        │
        ▼
Application reaches users
        │
        ▼
Continuous Monitoring
        │
        ▼
Feedback → Next Release

This creates a continuous cycle of development, testing, deployment, and monitoring.

Azure DevOps Perspective

Azure DevOps is Microsoft's cloud platform that provides everything required for modern software development.

It supports the complete DevOps lifecycle through integrated services.

Azure DevOps Service	Purpose
Azure Repos	Source Code Management (Git Repositories)
Azure Boards	Agile Planning (Epics, Features, User Stories, Tasks, Bugs)
Azure Pipelines	CI/CD Automation
Azure Test Plans	Manual and Exploratory Testing
Azure Artifacts	Package Management
Typical Azure DevOps Workflow
Azure Boards
      │
      ▼
Developer starts User Story
      │
      ▼
Code pushed to Azure Repos
      │
      ▼
Azure Pipelines triggered
      │
      ├── Build
      ├── Unit Tests
      ├── Code Quality Checks
      ├── Package Application
      ▼
Deploy to Development
      │
      ▼
Deploy to Test
      │
      ▼
Deploy to Staging
      │
      ▼
Deploy to Production

Everything is automated once the pipeline is configured.

What is CI/CD?

CI/CD stands for:

CI → Continuous Integration
CD → Continuous Delivery / Continuous Deployment

It is an automated process that helps developers integrate, test, build, and deploy software continuously.

Instead of waiting weeks or months to release software, CI/CD allows teams to release updates multiple times a day.

Continuous Integration (CI)

Continuous Integration is the practice of frequently merging code changes into a shared repository.

Every code commit automatically triggers a build pipeline.

Typical CI steps include:

Developer commits code
        │
        ▼
Azure Repos
        │
        ▼
Pipeline Triggered
        │
        ▼
Restore Dependencies
        │
        ▼
Compile Code
        │
        ▼
Run Unit Tests
        │
        ▼
Code Quality Checks
        │
        ▼
Build Artifact Generated
CI ensures
Every code change is validated automatically.
Bugs are detected early.
Build failures are identified immediately.
Teams integrate code frequently.
Developers receive fast feedback.
Continuous Delivery (CD)

Continuous Delivery automatically prepares the application for deployment.

The application is deployed to environments like:

Development
Testing
Staging

Before Production deployment, a manual approval may be required.

Example:

Build Successful
        │
        ▼
Deploy to Development
        │
        ▼
Run Automated Tests
        │
        ▼
Deploy to Testing
        │
        ▼
Approval Required
        │
        ▼
Production

The software is always in a deployable state.

Continuous Deployment

Continuous Deployment goes one step further.

Once all tests pass, the application is automatically deployed to Production without manual intervention.

Developer Pushes Code
        │
        ▼
Build
        │
        ▼
Testing
        │
        ▼
Production Deployment

Every successful commit reaches production automatically.

CI vs Continuous Delivery vs Continuous Deployment
Feature	Continuous Integration	Continuous Delivery	Continuous Deployment
Build Automation	✅	✅	✅
Automated Testing	✅	✅	✅
Deployment to Test	❌	✅	✅
Manual Approval	❌	Usually Yes	No
Automatic Production Deployment	❌	No	Yes
What is a CI/CD Pipeline?

A pipeline is a sequence of automated steps that transforms source code into a deployed application.

Instead of manually performing each task, Azure Pipelines executes them automatically.

Example pipeline:

Code Commit
      │
      ▼
Build
      │
      ▼
Run Unit Tests
      │
      ▼
Security Scan
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
Production
Advantages of CI/CD Pipelines
1. Faster Software Delivery

Automates the entire release process, enabling quicker and more frequent deployments.

2. Early Bug Detection

Automated builds and tests identify issues soon after code is committed, reducing the cost of fixing bugs.

3. Reduced Human Errors

Manual deployment steps are minimized, resulting in more consistent and reliable releases.

4. Improved Code Quality

Automated testing and code quality checks ensure that only validated code progresses through the pipeline.

5. Faster Feedback

Developers receive immediate feedback on build failures or test results, allowing them to resolve issues quickly.

6. Consistent Deployments

The same deployment process is used across Development, Testing, Staging, and Production environments, reducing configuration differences.

7. Better Team Collaboration

Developers, testers, and operations teams work together using a shared automated workflow, improving communication and efficiency.

8. Easier Rollbacks

If a deployment introduces issues, previous application versions can often be restored quickly using pipeline artifacts or deployment history.

9. Higher Productivity

Engineers spend less time on repetitive manual tasks and more time building new features and improving applications.

10. Reliable and Frequent Releases

Organizations can release smaller, incremental changes more often, reducing deployment risk and enabling faster delivery of value to users.

Real-World Azure DevOps CI/CD Example
Developer writes code
        │
        ▼
Pushes code to Azure Repos
        │
        ▼
Azure Pipeline starts automatically
        │
        ├── Restore packages
        ├── Build application
        ├── Run unit tests
        ├── Static code analysis
        ├── Create build artifact
        ▼
Deploy to Development
        │
        ▼
QA Testing
        │
        ▼
Approval
        │
        ▼
Deploy to Production
        │
        ▼
Monitor application health
Key Takeaways
DevOps is a culture that promotes collaboration between Development and Operations to deliver software faster and more reliably.
Azure DevOps provides integrated services such as Azure Boards, Azure Repos, Azure Pipelines, Azure Test Plans, and Azure Artifacts to support the complete DevOps lifecycle.
Continuous Integration (CI) automatically builds and tests code whenever changes are committed.
Continuous Delivery (CD) ensures applications are always ready for deployment, often with an approval step before production.
Continuous Deployment automatically releases validated code to production without manual intervention.
CI/CD Pipelines automate building, testing, packaging, and deployment, improving software quality, reducing errors, accelerating releases, and enabling continuous feedback.
