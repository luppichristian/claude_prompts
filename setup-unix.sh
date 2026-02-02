#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROMPTS_DIR="$SCRIPT_DIR/prompts"
COMMANDS_DIR="$HOME/.claude/commands"

mkdir -p "$COMMANDS_DIR"

for file in "$PROMPTS_DIR"/*.md; do
    filename=$(basename "$file")
    ln -sf "$file" "$COMMANDS_DIR/$filename"
    echo "Linked: $filename"
done

echo "Done. Commands installed to $COMMANDS_DIR"
