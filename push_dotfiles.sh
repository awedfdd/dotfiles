cd ~
git init
git remote add origin git@github.com:awedfdd/dotfiles.git
git add .zshrc .zshenv .gitconfig .config/tmux/tmux.conf .config/nvim/ pull_dotfiles.sh push_dotfiles.sh
git commit -m "Update dotfiles"
git push --force
rm -rf .git
