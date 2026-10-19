# ==============================================================================
# Script: onboarding.ps1
# Description: Automates Microsoft Entra ID user provisioning using Microsoft Graph API
# ==============================================================================

# Ensure Microsoft Graph module is installed
# Install-Module Microsoft.Graph -Scope CurrentUser

# Connect to Microsoft Entra ID with required scopes
Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

# Define New User Parameters
$displayName = "Jane Doe"
$mailNickname = "jdoe"
$userPrincipalName = "jdoe@yourtenant.onmicrosoft.com" # Replace with your actual domain name
$temporaryPassword = "SecureTempPassword#2026!"

$passwordProfile = @{
    Password = $temporaryPassword
    ForceChangePasswordNextSignIn = $true
}

$userParams = @{
    AccountEnabled    = $true
    DisplayName       = $displayName
    MailNickname      = $mailNickname
    UserPrincipalName = $userPrincipalName
    PasswordProfile   = $passwordProfile
    Department        = "Information Technology"
    JobTitle          = "Cloud Engineer Intern"
}

# Execute User Creation
try {
    $newUser = New-MgGraphUser @userParams
    Write-Host "Successfully created user: $($newUser.UserPrincipalName)" -ForegroundColor Green
}
catch {
    Write-Error "Failed to create user: $_"
}
