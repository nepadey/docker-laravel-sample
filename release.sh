#! /bin/bash
set -eu

# set repo url
repo=$(git remote get-url origin)
repo=${repo#*:}
repo=${repo%.*}
repo_url=https://github.com/${repo}

# fetch and bump up version
git checkout master
git pull origin master
git fetch
release_type=${1:-patch}
if [[ $release_type == "patch" ]]; then
  version_num=$(git describe --abbrev=0 --tags | awk  -F . '{ printf "%s.%s.%s", $1, $2, ($3+1); }')
elif [[ $release_type == "minor" ]]; then
  version_num=$(git describe --abbrev=0 --tags | awk  -F . '{ printf "%s.%s.%s", $1, ($2+1), 0; }')
elif [[ $release_type == "major" ]]; then
  version_num=$(git describe --abbrev=0 --tags | sed 's/^v//' | awk  -F . '{ printf "v%s.%s.%s", ($1+1), 0, 0; }')
fi

# branch off to release and push
git checkout develop
git pull origin develop
echo -n "Is '${version_num}' the correct name for that ${version_num} version (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  git checkout -b release/$version_num
  git push origin release/$version_num
  echo PR url: $repo_url/compare/master...release/$version_num?template=release.md
fi
