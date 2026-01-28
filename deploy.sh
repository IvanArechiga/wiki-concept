#!/bin/bash

################################################################################
# Script de Despliegue Automático para Wiki SICAR X
# Automatiza: git add -> commit -> push -> mkdocs gh-deploy
# Basado en documentación oficial de MkDocs
################################################################################

set -e  # Exit on error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funciones de utilidad
print_header() {
    echo -e "\n${BLUE}════════════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

# Verificar que estamos en el directorio correcto
if [ ! -f "mkdocs.yml" ]; then
    print_error "mkdocs.yml no encontrado. Ejecuta este script desde la raíz del proyecto."
    exit 1
fi

print_header "🚀 DESPLIEGUE DE WIKI SICAR X"

# Paso 1: Verificar estado de git
print_info "Verificando estado de Git..."
if [ -z "$(git status --porcelain)" ]; then
    print_warning "No hay cambios para desplegar."
    echo "¿Deseas continuar de todas formas? (s/n)"
    read -r response
    if [[ ! "$response" =~ ^[sS]$ ]]; then
        print_info "Despliegue cancelado."
        exit 0
    fi
else
    print_success "Se encontraron cambios pendientes"
fi

# Paso 2: Mostrar cambios
print_info "Cambios pendientes:"
git status --short
echo ""

# Paso 3: Agregar todos los cambios
print_info "Agregando cambios..."
git add .
print_success "Cambios agregados"

# Paso 4: Solicitar mensaje de commit
echo ""
print_info "Ingresa el mensaje de commit:"
echo -e "${YELLOW}(Ejemplos: 'docs: actualizar home' o 'feat: agregar nuevo documento')${NC}"
read -p "> " commit_message

# Validar que se ingresó un mensaje
if [ -z "$commit_message" ]; then
    print_error "El mensaje de commit no puede estar vacío."
    git reset HEAD .
    exit 1
fi

# Paso 5: Realizar commit
print_info "Realizando commit..."
git commit -m "$commit_message"
print_success "Commit realizado: '$commit_message'"

# Paso 6: Obtener rama actual
current_branch=$(git rev-parse --abbrev-ref HEAD)
print_info "Rama actual: $current_branch"

# Paso 7: Hacer push
print_info "Haciendo push a $current_branch..."
git push origin "$current_branch"
print_success "Push completado"

# Paso 8: Compilar documentación
print_info "Compilando documentación..."
mkdocs build --clean
print_success "Documentación compilada"

# Paso 9: Desplegar a gh-pages
print_header "📢 DESPLEGANDO A GITHUB PAGES"

print_info "Desplegando a gh-pages..."
mkdocs gh-deploy --clean
print_success "Despliegue a gh-pages completado"

# Paso 10: Resumen final
print_header "✅ DESPLIEGUE COMPLETADO"

print_success "Todos los pasos completados exitosamente"
echo ""
print_info "Resumen:"
echo "  • Cambios: Agregados y comiteados"
echo "  • Mensaje: $commit_message"
echo "  • Push: Enviado a rama '$current_branch'"
echo "  • GitHub Pages: Publicado"
echo ""

# Obtener URL del repositorio
repo_url=$(git config --get remote.origin.url | sed 's/.git$//')
if [[ $repo_url == git@github.com:* ]]; then
    # Convertir SSH URL a HTTPS
    repo_url=$(echo $repo_url | sed 's/git@github.com:/https:\/\/github.com\//')
fi

# Extraer usuario y repositorio
username=$(echo $repo_url | grep -oP 'github\.com/\K[^/]+')
repo_name=$(echo $repo_url | grep -oP 'github\.com/[^/]+/\K[^/]+')

if [ ! -z "$username" ] && [ ! -z "$repo_name" ]; then
    pages_url="https://${username}.github.io/${repo_name}/"
    print_info "Tu Wiki está disponible en:"
    echo -e "${GREEN}${pages_url}${NC}"
fi

echo ""
print_success "¡Listo!"
