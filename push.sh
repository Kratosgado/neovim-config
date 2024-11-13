-- push.sh
-- script to push configs to git repo

cp ~/.bashrc ~/.config/nvim/terminal/. -rf
cp ~/.config/startship.toml ~/.config/nvim/terminal/startship.toml
cp ~/.profile ~/.config/nvim/terminal/.
cp ~/.config/starship.toml ~/.config/nvim/terminal/. -rf

git add .
git commit -m "update configs"
git push
