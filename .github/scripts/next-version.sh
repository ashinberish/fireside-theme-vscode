#!/usr/bin/env bash
# Decide the version to release and write it to package.json.
#
# If package.json holds a version that has no tag yet, release it as is.
# This covers the first release and lets you set a version by hand.
# Otherwise bump from the current version, based on commit messages since
# its tag: "type!:" or "BREAKING CHANGE" -> major, "feat:" -> minor,
# anything else -> patch.
set -euo pipefail

current="$(node -p "require('./package.json').version")"

if ! git rev-parse -q --verify "refs/tags/v$current" >/dev/null; then
  version="$current"
  echo "v$current is not tagged yet; releasing it as is."
else
  log="$(git log --format='%s%n%b' "v$current..HEAD")"
  if grep -qE '^[a-z]+(\([^)]*\))?!:|BREAKING CHANGE' <<<"$log"; then
    bump=major
  elif grep -qE '^feat(\([^)]*\))?:' <<<"$log"; then
    bump=minor
  else
    bump=patch
  fi
  version="$(npm version "$bump" --no-git-tag-version | sed 's/^v//')"
  echo "Bumped $current -> $version ($bump)."
fi

echo "version=$version" >> "${GITHUB_OUTPUT:-/dev/stdout}"
