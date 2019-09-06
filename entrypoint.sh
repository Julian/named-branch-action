#!/bin/sh -l
GIT_AUTHOR_NAME='Named Branches GitHub Action'
GIT_COMMITTER_NAME='Named Branches GitHub Action'
git notes --ref "$3" add -m "$2"
git remote set-url origin "$1"
git push origin "$3:$3"
