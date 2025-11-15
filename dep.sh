#!/bin/bash

# chmod +x dep.sh

# ===================== CONFIGURATION =====================
TOMCAT_HOME="/opt/apache-tomcat-10.1.48"
TOMCAT_WEBAPPS="$TOMCAT_HOME/webapps"

# Récupérer le dossier du script et son nom
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEBAPP_NAME="$(basename "$SCRIPT_DIR")"
PROJECT_ROOT="$SCRIPT_DIR"

BUILD_DIR="$PROJECT_ROOT/build"
CLASSES_DIR="$BUILD_DIR/WEB-INF/classes"
LIB_DIR="$BUILD_DIR/WEB-INF/lib"
VIEWS_DIR="$BUILD_DIR/WEB-INF/views"

# ===================== NETTOYAGE BUILD =====================
echo "=== Nettoyage des anciens builds ==="
rm -rf "$BUILD_DIR"
mkdir -p "$CLASSES_DIR" "$LIB_DIR" "$VIEWS_DIR"

# ===================== COMPILATION =====================
echo "=== Compilation des fichiers Java ==="
find "$PROJECT_ROOT/src" -name "*.java" > sources.txt
      javac -d "$CLASSES_DIR" -cp "$PROJECT_ROOT/lib/*:$CLASSPATH" @sources.txt
rm sources.txt

# ===================== COPIE DES LIBS =====================
echo "=== Copie des librairies ==="
cp -r "$PROJECT_ROOT/lib/"*.jar "$LIB_DIR" 2>/dev/null

# Supprimer servlet-api.jar s'il existe (Tomcat l'a déjà)
if [ -f "$LIB_DIR/servlet-api.jar" ]; then
  rm "$LIB_DIR/servlet-api.jar"
fi

# ===================== COPIE RESSOURCES =====================
echo "=== Copie de web.xml ==="
mkdir -p "$BUILD_DIR/WEB-INF"
cp "$PROJECT_ROOT/WEB-INF/web.xml" "$BUILD_DIR/WEB-INF/"

# Copier les fichiers JSP (facultatif)
echo "=== Copie des fichiers JSP ==="
cp -r "$PROJECT_ROOT/WEB-INF/views/"* "$VIEWS_DIR" 2>/dev/null

# Copier les fichiers statiques de l'appli vers la racine du WAR
# 1) À partir de WEB-INF/webapp (convention de ce projet)
if [ -d "$PROJECT_ROOT/WEB-INF/webapp" ]; then
  cp -r "$PROJECT_ROOT/WEB-INF/webapp/"* "$BUILD_DIR/" 2>/dev/null
fi
# 2) Également un dossier 'static' à la racine si présent
if [ -d "$PROJECT_ROOT/static" ]; then
  cp -r "$PROJECT_ROOT/static/"* "$BUILD_DIR/" 2>/dev/null
fi

# ===================== CREATION DU WAR =====================
echo "=== Création du WAR ==="
cd "$BUILD_DIR" || exit
jar -cvf "$WEBAPP_NAME.war" *

# ===================== DEPLOIEMENT =====================
echo "=== Déploiement sur Tomcat ==="
rm -rf "$TOMCAT_WEBAPPS/$WEBAPP_NAME" "$TOMCAT_WEBAPPS/$WEBAPP_NAME.war"
cp "$WEBAPP_NAME.war" "$TOMCAT_WEBAPPS/"

echo "=== Déploiement terminé === ✅"
cd "$PROJECT_ROOT"
