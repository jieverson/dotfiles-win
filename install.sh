echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install zsh git
echo "✔ base packeges are installed"

git pull
echo "✔ dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "✔ zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# synlink oh-my-zsh theme
mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
ln -sf $(pwd)/oh-my-zsh/themes/lambda_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/lambda_robbyrussell.zsh-theme
ln -sf $(pwd)/oh-my-zsh/themes/emoji_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/emoji_robbyrussell.zsh-theme
echo "✔ oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

mkdir -p ~/.config
mkdir -p ~/.config/ranger
ln -sf $(pwd)/config/ranger/rc.conf ~/.config/ranger/rc.conf
echo "✔ other configs symlinked"

mkdir -p ~/.bin
ln -sf $(pwd)/bin/start ~/.bin/start
ln -sf /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe ~/.bin/chrome
ln -sf /mnt/c/Program\ Files/MPC-HC/mpc-hc64.exe ~/.bin/mpchc
echo "✔ alias for windows programs"

mkdir -p ~/.scripts
cp $(pwd)/scripts/* ~/.scripts/

rm -f ~/c
ln -sf /mnt/c ~/c
rm -f ~/projects
ln -sf /mnt/c/Projects ~/projects
rm -f ~/downloads
ln -sf /mnt/c/Users/jieverson/Downloads ~/downloads
rm -f ~/pictures
ln -sf /mnt/c/Users/jieverson/Pictures ~/pictures
echo "✔ alias for windows folders"

curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt -qq install nodejs
sudo apt -qq install npm
sudo apt -qq install python-pip
echo "✔ apt dev tools installed"

sudo npm install -g bower gulp grunt yo less mdpdf
echo "✔ npm -g dev tools installed"

sudo apt -qq install caca-utils ranger cowsay fortune screenfetch lolcat figlet sl cmatrix
echo "✔ other cool stuff installed"
