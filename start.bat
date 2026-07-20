@echo off
title NEXUS - Servidor Local
echo.
echo ============================================
echo   NEXUS VISUAL ENGINE - SERVIDOR LOCAL
echo ============================================
echo.
echo Abriendo http://localhost:5544 ...
echo (Pulsa Ctrl + C para parar)
echo.
start http://localhost:5544
node "%~dp0server.mjs"
pause
