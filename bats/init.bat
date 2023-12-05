git checkout --orphan latest_branch
git add -A
git commit -am "init"
git branch -D ta
git branch -m ta
git push -f origin ta
git push -u origin ta
