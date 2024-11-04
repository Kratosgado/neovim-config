-- push.sh
-- script to push configs to git repo

cp ~/.bashrc ~/.config/nvim/terminal/. -rf
cp ~/.profile ~/.config/nvim/terminal/.
cp ~/.config/starship.toml ~/.config/nvim/terminal/. -rf

git add .
git commit -m "update configs"
git push
