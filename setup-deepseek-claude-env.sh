#!/bin/bash

# Script para establecer variables de entorno para Claude Code con DeepSeek
# Carga variables desde .env y configura DeepSeek como backend

set -e  # Exit on error

echo "Setting up environment variables for Claude Code..."

# 1. Cargar variables desde .env si el archivo existe
if [ -f ".env" ]; then
    echo "Loading variables from .env file..."
    # Source the .env file (assumes valid shell format: VAR=value)
    set -a  # Automatically export all variables
    source .env
    set +a
    echo "Variables from .env loaded."
else
    echo "Warning: .env file not found. Proceeding without loading .env variables."
fi

# 2. Configurar DeepSeek como backend para Claude Code
echo "Configuring DeepSeek API as Anthropic backend..."
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
export ANTHROPIC_AUTH_TOKEN=${DEEP_SEEK_API_KEY}
export API_TIMEOUT_MS=600000
export ANTHROPIC_MODEL=deepseek-chat
export ANTHROPIC_SMALL_FAST_MODEL=deepseek-chat
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

# 3. Verificar que DEEP_SEEK_API_KEY está definida
if [ -z "${DEEP_SEEK_API_KEY}" ]; then
    echo "Warning: DEEP_SEEK_API_KEY is not set. Please ensure it's defined in .env or environment."
    echo "You can set it with: export DEEP_SEEK_API_KEY=your_key_here"
else
    echo "DEEP_SEEK_API_KEY is set (first 4 chars: ${DEEP_SEEK_API_KEY:0:4}...)"
fi

# 4. Mostrar configuración actual
echo ""
echo "Current environment configuration:"
echo "ANTHROPIC_BASE_URL=$ANTHROPIC_BASE_URL"
echo "ANTHROPIC_AUTH_TOKEN=${ANTHROPIC_AUTH_TOKEN:0:4}..."
echo "API_TIMEOUT_MS=$API_TIMEOUT_MS"
echo "ANTHROPIC_MODEL=$ANTHROPIC_MODEL"
echo "ANTHROPIC_SMALL_FAST_MODEL=$ANTHROPIC_SMALL_FAST_MODEL"
echo "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=$CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC"
echo ""
echo "To apply these variables to your current shell, run: source setup-env.sh"
echo "To run Claude Code with this configuration, execute: claude"