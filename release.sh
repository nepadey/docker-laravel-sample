#! /bin/bash
set -eu

# set repo url
repo=$(git remote get-url origin)
repo=${repo#*:}
repo=${repo%.*}
repo_url=https://github.com/${repo}

# fetch and bump up version
git fetch

main_base=$(git ls-remote origin main)
master_base=$(git ls-remote origin master)

if [[ $main_base == "" ]] && [[ $master_base == "" ]]; then
  echo Base branch main or master not found.
  echo "Please create either one of the branch."
  exit 1
elif [[ $main_base != "" ]] && [[ $master_base != "" ]]; then
  echo "Both main and master were found. It is not recommended to have both branch in the repo."
  echo "Please continue manually."
  exit 1
elif [[ $main_base != "" ]]; then
  git checkout main
  git pull origin main
  base="main"
elif [[ $master_base != "" ]]; then
  git checkout master
  git pull origin master
  base="master"
fi

release_type=${1:-patch}
if [[ $release_type == "patch" ]]; then
  last_version=$(git describe --abbrev=0 --tags 2>/dev/null || true)
  valid_last_version=${last_version:-"v0.0.0"}
  version_num=$(echo $valid_last_version | awk  -F . '{ printf "%s.%s.%s", $1, $2, ($3+1); }')
elif [[ $release_type == "minor" ]]; then
  last_version=$(git describe --abbrev=0 --tags 2>/dev/null || true)
  valid_last_version=${last_version:-"v0.0.0"}
  version_num=$(echo $valid_last_version | awk  -F . '{ printf "%s.%s.%s", $1, ($2+1), 0; }')
elif [[ $release_type == "major" ]]; then
  last_version=$(git describe --abbrev=0 --tags 2>/dev/null || true)
  valid_last_version=${last_version:-"v0.0.0"}
  version_num=$(echo $valid_last_version | sed 's/^v//' | awk  -F . '{ printf "v%s.%s.%s", ($1+1), 0, 0; }')
fi

# branch off to release and push
git checkout develop
git pull origin develop
echo -n "Is '${version_num}' the correct name for that ${version_num} version (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  git checkout -b release/$version_num
  git push origin release/$version_num
  echo PR url: $repo_url/compare/${base}...release/$version_num?template=release.md
fi
