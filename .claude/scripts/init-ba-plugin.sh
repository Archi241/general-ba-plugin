#!/bin/bash

# BA Plugin Auto-Initialization Script
# Runs once on first project open to set up context files and settings

# Check if already initialized
if [ -f .claude/.ba-plugin-initialized ]; then
  exit 0
fi

echo "🚀 Initializing BA Plugin..."
echo ""

# Verify Legal Tracker context files exist
if [ ! -f .claude/PROJECT_CONTEXT.md ]; then
  echo "❌ ERROR: PROJECT_CONTEXT.md missing - plugin installation incomplete"
  exit 1
fi

if [ ! -f .claude/ARCHITECTURE.md ]; then
  echo "❌ ERROR: ARCHITECTURE.md missing - plugin installation incomplete"
  exit 1
fi

echo "✅ Legal Tracker context files verified"

# Mark as initialized
touch .claude/.ba-plugin-initialized

echo ""
echo "✅ BA Plugin ready!"
echo ""
echo "Try: /ba"
echo ""
