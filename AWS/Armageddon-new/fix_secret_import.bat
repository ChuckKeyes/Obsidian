@echo off
setlocal ENABLEDELAYEDEXPANSION

REM ============================
REM KCS Secrets Fix + Import
REM ============================

set REGION=us-east-1
set SECRET_NAME=kcs-keyescloudsolutions/rds/mysql
set SECRET_ARN=arn:aws:secretsmanager:us-east-1:557690581423:secret:kcs-keyescloudsolutions/rds/mysql-QkrX6R
set TF_ADDR=aws_secretsmanager_secret.kcs_db_secret01

echo.
echo === 1) Describe secret (before) ===
aws secretsmanager describe-secret --secret-id "%SECRET_NAME%" --region "%REGION%"
if errorlevel 1 (
  echo.
  echo ERROR: Could not describe secret "%SECRET_NAME%". Check name/region/AWS profile.
  exit /b 1
)

echo.
echo === 2) Attempt restore-secret (safe if not scheduled for deletion) ===
aws secretsmanager restore-secret --secret-id "%SECRET_NAME%" --region "%REGION%"
if errorlevel 1 (
  echo (restore-secret returned non-zero. This can be normal if secret is not scheduled for deletion.)
)

echo.
echo === 3) Describe secret (after restore attempt) ===
aws secretsmanager describe-secret --secret-id "%SECRET_NAME%" --region "%REGION%"
if errorlevel 1 (
  echo.
  echo ERROR: Could not describe secret after restore attempt.
  exit /b 1
)

echo.
echo === 4) Terraform import secret into state ===
terraform import "%TF_ADDR%" "%SECRET_ARN%"
if errorlevel 1 (
  echo.
  echo ERROR: terraform import failed. Make sure you are in the correct Terraform folder and the resource exists in code.
  exit /b 1
)

echo.
echo ✅ Done. Next steps:
echo   - Run: terraform plan
echo   - If it wants to recreate the secret, your resource "name" may not match exactly or other arguments differ.
echo.
endlocal
