@echo off
setlocal EnableDelayedExpansion


:: Récupère le chemin complet du dossier où se trouve le script
set "currentPath=%~dp0"

:: Supprime le "\" final
set "currentPath=%currentPath:~0,-1%"

:: Extrait uniquement le nom du dossier
for %%A in ("%currentPath%") do set "folderName=%%~nA"

echo Nom du dossier : %folderName%

:: ===================== CONFIGURATION =====================
set "PROJECT_ROOT=%CD%"
set "WEBAPP_NAME=%folderName%"
set "TOMCAT_HOME=C:\xampp\tomcat"
set "TOMCAT_WEBAPPS=%TOMCAT_HOME%\webapps"

:: ===================== BUILD DIRECTORIES =====================
set "BUILD_DIR=%PROJECT_ROOT%\build"
set "CLASSES_DIR=%BUILD_DIR%\WEB-INF\classes"
set "LIB_DIR=%BUILD_DIR%\WEB-INF\lib"
set "VIEWS_DIR=%BUILD_DIR%\WEB-INF\views"

echo === Nettoyage des anciens builds ===
if exist "%BUILD_DIR%" rd /s /q "%BUILD_DIR%"
mkdir "%CLASSES_DIR%"
mkdir "%LIB_DIR%"
mkdir "%VIEWS_DIR%"

:: ===================== SYNC FRAMEWORK JAR =====================
@REM set "FRAMEWORK_JAR=%PROJECT_ROOT%\lib\myframework.jar"
@REM if exist "%FRAMEWORK_JAR%" (
@REM     if not exist "%PROJECT_ROOT%\lib" mkdir "%PROJECT_ROOT%\lib"
@REM     copy /Y "%FRAMEWORK_JAR%" "%PROJECT_ROOT%\lib\"
@REM     echo Framework JAR synchronized to application/lib.
@REM ) else (
@REM     echo Warning: Framework JAR not found at %FRAMEWORK_JAR%. Build the framework first.
@REM )

:: ===================== COMPILATION =====================
echo === Compilation des fichiers Java ===

:: Création du CLASSPATH
@REM set "CLASSPATH="
@REM for %%i in ("%PROJECT_ROOT%\lib\*.jar") do (
@REM     if "!CLASSPATH!"=="" (
@REM         set "CLASSPATH=%%i"
@REM     ) else (
@REM         set "CLASSPATH=!CLASSPATH!;%%i"
@REM     )
@REM )

@REM :: Compilation
@REM if exist "%PROJECT_ROOT%\src\main\java" (
@REM     dir /s /b "%PROJECT_ROOT%\src\main\java\*.java" > sources.txt 2>nul
@REM ) else (
@REM     > sources.txt echo.
@REM )
@REM for /f %%A in ('type sources.txt ^| find /c /v ""') do set "SRC_COUNT=%%A"
@REM if "%SRC_COUNT%"=="0" (
@REM     echo No Java sources found, skipping compilation.
@REM ) else (
@REM     javac -cp "%CLASSPATH%" -d "%CLASSES_DIR%" @sources.txt
@REM     if errorlevel 1 (
@REM         echo Erreur lors de la compilation
@REM         del sources.txt
@REM         exit /b 1
@REM     )
@REM )
@REM del sources.txt

:: ===================== COPIE DES LIBS =====================
if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"
xcopy /E /I /Y "%PROJECT_ROOT%\lib\*.jar" "%LIB_DIR%\"
:: Supprimer servlet-api.jar si présent
if exist "%LIB_DIR%\servlet-api.jar" del "%LIB_DIR%\servlet-api.jar"

:: ===================== COPIE DES JSP =====================
@REM if exist "%PROJECT_ROOT%\src\main\webapp\WEB-INF\views" (
@REM     xcopy /E /I /Y "%PROJECT_ROOT%\src\main\webapp\WEB-INF\views\*" "%VIEWS_DIR%"
@REM ) else if exist "%PROJECT_ROOT%\WEB-INF\views" (
@REM     xcopy /E /I /Y "%PROJECT_ROOT%\WEB-INF\views\*" "%VIEWS_DIR%"
@REM ) else (
@REM     echo No JSP views directory found, skipping.
@REM )

:: ===================== COPIE AUTRES RESSOURCES =====================
:: Copie des autres fichiers statiques (html, css, js) à la racine du WAR
@REM if exist "%PROJECT_ROOT%\src\main\webapp" (
@REM     :: Utiliser robocopy et exclure WEB-INF/views
@REM     robocopy "%PROJECT_ROOT%\src\main\webapp" "%BUILD_DIR%" /E /XD "WEB-INF\views" >nul
@REM     set "RC=%ERRORLEVEL%"
@REM     if !RC! GEQ 8 (
@REM         echo Robocopy failed with code %RC%.
@REM         exit /b 1
@REM     )
@REM ) else (
@REM     :: Pas de src/main/webapp: copier depuis la racine du projet, exclure dossiers internes et ce script
@REM     robocopy "%PROJECT_ROOT%" "%BUILD_DIR%" /E /XD "WEB-INF" "build" "lib" /XF "deploy.bat" >nul
@REM     set "RC=%ERRORLEVEL%"
@REM     if !RC! GEQ 8 (
@REM         echo Robocopy failed with code %RC%.
@REM         exit /b 1
@REM     )
@REM )

:: ===================== COPIE WEB-INF/web.xml =====================
@REM if not exist "%PROJECT_ROOT%\WEB-INF\web.xml" (
xcopy /E /I /Y "%PROJECT_ROOT%\WEB-INF\web.xml" "%BUILD_DIR%\WEB-INF\"
echo web.xml copied.
@REM ) else if exist "WEB-INF\web.xml" (
@REM     xcopy /Y "WEB-INF\web.xml" "%BUILD_DIR%\WEB-INF\"
@REM     echo web.xml copied.
@REM ) else (
@REM     echo No web.xml found, proceeding without it (framework auto-registration).
@REM )

:: ===================== CREATION DU WAR =====================
cd "%BUILD_DIR%"
jar -cvf "%WEBAPP_NAME%.war" *

:: ===================== DEPLOIEMENT =====================
echo === Déploiement vers Tomcat ===
if exist "%TOMCAT_WEBAPPS%\%WEBAPP_NAME%.war" del "%TOMCAT_WEBAPPS%\%WEBAPP_NAME%.war"
if exist "%TOMCAT_WEBAPPS%\%WEBAPP_NAME%" rd /s /q "%TOMCAT_WEBAPPS%\%WEBAPP_NAME%"

copy "%WEBAPP_NAME%.war" "%TOMCAT_WEBAPPS%"

echo === Déploiement terminé ===
cd "%PROJECT_ROOT%"
pause