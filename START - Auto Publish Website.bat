@echo off
title Clearwell Water Filtration - Auto-Publisher
echo.
echo  ============================================
echo   Clearwell Water Filtration Auto-Publisher
echo   Any file you save will go live instantly
echo  ============================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0auto-push.ps1"
pause
