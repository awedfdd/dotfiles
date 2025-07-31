cd ~
git init
git remote add origin git@github.com:oleksandrh324110/dotfiles.git
git add .zshrc .zshenv .gitconfig .config/tmux/tmux.conf .config/nvim/ load_dotfiles.sh save_dotfiles.sh
git commit -m "Update dotfiles"
git push --force
rm -rf .git
