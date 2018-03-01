#!/bin/bash

if [ "$TRAVIS_EVENT_TYPE" != "cron" ]; then
    echo "Not Cron. Skipping deploy..."
    exit 0
fi

git remote set-url origin https://lex111:${GITHUB_TOKEN}@github.com/lex111/php-doc-ru
git update-ref refs/remotes/git-svn refs/remotes/origin/master
git svn rebase
git push origin --all
