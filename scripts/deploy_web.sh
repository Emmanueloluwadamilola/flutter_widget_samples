#!/usr/bin/env bash
#
# Manual GitHub Pages deploy for the Flutter Widget Catalog.
#
# Builds the web release from your current working tree and force-pushes the
# output to the `gh-pages` branch. This keeps deployment a maintainer-only,
# local action — there is no CI workflow, so contributors who clone or fork
# the repo cannot (accidentally or otherwise) deploy.
#
# One-time GitHub setup (Settings -> Pages):
#   Source: "Deploy from a branch"
#   Branch: gh-pages   Folder: / (root)
#
# Requirements: Flutter on PATH, and push access to the repo (your existing
# `git` HTTPS credentials are reused).
#
# Usage:
#   ./scripts/deploy_web.sh
#
set -euo pipefail

REPO_URL="https://github.com/Emmanueloluwadamilola/flutter_widget_samples.git"
BASE_HREF="/flutter_widget_samples/"
BUILD_DIR="build/web"
LIVE_URL="https://emmanueloluwadamilola.github.io/flutter_widget_samples/"

# Run from the repo root regardless of where the script is invoked from.
cd "$(dirname "$0")/.."

echo "==> Building web release (base-href $BASE_HREF)..."
flutter build web --release --base-href "$BASE_HREF"

# Prevent GitHub Pages from running Jekyll, which would strip files/dirs whose
# names start with an underscore or dot.
touch "$BUILD_DIR/.nojekyll"

echo "==> Publishing $BUILD_DIR to the gh-pages branch..."
# Use a disposable git repo inside the build output so we never commit build
# artifacts to the source branch.
pushd "$BUILD_DIR" >/dev/null
rm -rf .git
git init -q
git checkout -qb gh-pages
git add -A
git -c user.name="deploy" -c user.email="deploy@local" commit -qm "Deploy web build"
git push -f "$REPO_URL" gh-pages
rm -rf .git
popd >/dev/null

echo "==> Done. Live at: $LIVE_URL"
echo "    (first-time deploys can take a minute or two to appear)"
