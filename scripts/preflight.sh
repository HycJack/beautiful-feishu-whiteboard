#!/usr/bin/env bash
# Preflight check for the beautiful-whiteboard skill.
# Verifies the tools needed to render an SVG and export it as PNG.
set -u
ok=1
echo "▶ Checking prerequisites for beautiful-whiteboard…"
echo

# Node ≥ 20
if command -v node >/dev/null 2>&1; then
  echo "  ✓ Node $(node -v)"
else
  echo "  ✗ Node.js not found — install Node ≥ 20  (https://nodejs.org)"
  ok=0
fi

# whiteboard-cli  (run via npx, auto-downloads)
if npx -y @larksuite/whiteboard-cli@^0.2.11 -v >/dev/null 2>&1; then
  echo "  ✓ @larksuite/whiteboard-cli reachable via npx"
else
  echo "  ! could not reach @larksuite/whiteboard-cli via npx (needs network on first run)"
fi

echo
if [ "$ok" = 1 ]; then
  echo "✅ Ready. You can now generate SVG diagrams and export them as PNG images."
else
  echo "❌ Missing prerequisites above. Install them, then re-run this check."
  exit 1
fi
