# Azure Entra ID & User Onboarding Lab

## 📌 Overview
This project demonstrates identity management, automated user provisioning, Multi-Factor Authentication (MFA), and Conditional Access setup using **Microsoft Entra ID** (formerly Azure AD) and **PowerShell**.

## 🏗️ Architecture & Lab Components
- **Identity Provider**: Microsoft Entra ID
- **Security & Access Policies**:
  - Enforced Multi-Factor Authentication (MFA)
  - Created Conditional Access (CA) policy to block untrusted logins / require MFA
- **Automation**: PowerShell script leveraging Microsoft Graph API for bulk/single user onboarding.

## 🛠️ Onboarding Automation Script
The onboarding script (`scripts/onboarding.ps1`) automates:
1. Connecting securely to Microsoft Graph API.
2. Generating user attributes (UPN, Display Name, Department).
3. Assigning secure temporary credentials and requiring a password change on first sign-in.

## 🔒 Conditional Access Policy
- **Policy Name**: `CA01-Require-MFA-All-Users`
- **Scope**: All Users (excluding Emergency Admin)
- **Target**: Cloud Apps
- **Grant Control**: Require Multi-Factor Authentication
