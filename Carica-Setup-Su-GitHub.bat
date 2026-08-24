@echo off
title Carica Setup su GitHub
chcp 65001 >nul
cls
echo =======================================================
echo   PUBBLICAZIONE REPOSITORY SETUP SU GITHUB
echo =======================================================
echo.
echo 1. Apri https://github.com/new nel browser.
echo 2. Dai un nome al repository (es. MentyTweaker-Setup).
echo 3. Assicurati che sia selezionato "PUBLIC".
echo 4. Clicca su "Create repository".
echo.
set /p REPO_URL="Incolla qui l'URL del tuo repository (es. https://github.com/MattyPap3r/MentyTweaker-Setup): "
if "%REPO_URL%"=="" (
    echo [ERRORE] URL non inserito.
    pause
    exit /b 1
)

echo.
echo [*] Inizializzazione Git per MentyTweaker-Setup...
git init
git branch -M main
git add .
git commit -m "Initial commit: MentyTweaker Setup and Downloader"
git remote remove origin 2>nul
git remote add origin %REPO_URL%
echo.
echo [*] Caricamento su GitHub in corso...
git push -u origin main -f

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================================
    echo   [OK] SETUP PUBBLICATO CON SUCCESSO SU GITHUB!
    echo.
    echo   Il tuo amico puo scaricarlo direttamente da:
    echo   %REPO_URL%
    echo =======================================================
) else (
    echo.
    echo [!] Errore durante il caricamento. Verifica i permessi o la connessione.
)
echo.
pause
