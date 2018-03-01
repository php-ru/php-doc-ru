#!/bin/bash
 
if [ "$TRAVIS_EVENT_TYPE" != "cron" ]; then
    exit 0
fi
 
git clone https://github.com/lex111/php-doc-ru.git doc
cd doc
git config svn.authorsfile "./svn-authors.txt"
git remote set-url origin https://lex111:${GITHUB_TOKEN}@github.com/lex111/php-doc-ru
git svn init https://svn.php.net/repository/phpdoc/ru/trunk
git update-ref refs/remotes/git-svn refs/remotes/origin/master
git svn rebase
git push origin --all
