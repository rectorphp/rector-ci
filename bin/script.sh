#!/bin/bash

# Real script:
# 1. Clone repository
# 2. cd to new repo
# 3. composer require rector
# 4. composer install
# 5. run rector with some config
# 6. git add all except rector
# 7. commit
# 8. push
# 9. open PR

orig_branch=$(git rev-parse --abbrev-ref HEAD)
new_branch=${orig_branch}-rector

# Github API - Check if brach exists
# If fix PR already exists, should it edit existing PR with new commit? or delete it and replace?

git checkout -b ${new_branch}
echo 'Test' > ${1}.txt # For test purposes, argument of bash script
git add .
git commit -m "Test commit"
git push --set-upstream origin ${new_branch}

php open-github-pr.php ${orig_branch} ${new_branch}