cd ~
git init
git remote add origin git@github.com:oleksandrh324110/dotfiles.git
git fetch origin
git reset --hard origin/master
rm -rf .git
