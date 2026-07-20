@echo off
setlocal
title NEXUS - Publicar en GitHub
echo.
echo =====================================================
echo   NEXUS VISUAL ENGINE - PUBLICAR EN GITHUB (PAGES)
echo =====================================================
echo.
echo Este asistente sube el proyecto a tu GitHub y activa
echo GitHub Pages (web publica con HTTPS, microfono OK).
echo.

where gh >nul 2>nul
if errorlevel 1 (
    echo [1/4] GitHub CLI no esta instalado. Instalando con winget...
    winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements
    echo.
    echo Cierra esta ventana y vuelve a hacer doble clic en este archivo.
    pause
    exit /b
)

echo [1/4] GitHub CLI OK.
gh auth status >nul 2>nul
if errorlevel 1 (
    echo [2/4] Inicia sesion en GitHub (se abrira el navegador)...
    gh auth login --web --git-protocol https
    if errorlevel 1 ( echo Error de login. & pause & exit /b )
) else (
    echo [2/4] Sesion GitHub OK.
)

cd /d "%~dp0"
echo [3/4] Creando repositorio "nexus-visual-engine" y subiendo...
git branch -M main
gh repo create nexus-visual-engine --public --source . --remote origin --push
if errorlevel 1 (
    echo El repo puede existir ya. Intentando push directo...
    git push -u origin main
)

echo [4/4] Activando GitHub Pages...
for /f "delims=" %%u in ('gh api user --jq .login') do set GHUSER=%%u
gh api -X POST repos/%GHUSER%/nexus-visual-engine/pages -f "source[branch]=main" -f "source[path]=/" >nul 2>nul
if errorlevel 1 gh api -X PUT repos/%GHUSER%/nexus-visual-engine/pages -f "source[branch]=main" -f "source[path]=/" >nul 2>nul

echo.
echo =====================================================
echo   LISTO. Tu web (tarda 1-2 min en estar activa):
echo   https://%GHUSER%.github.io/nexus-visual-engine/
echo =====================================================
echo.
start https://%GHUSER%.github.io/nexus-visual-engine/
pause
