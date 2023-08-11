#!/bin/bash
## https://github.com/QuanticoBit
## :D


# Install dependencies for compiling Ruby
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# Install ASDF and add it to the shell
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL

# Install ASDF plugins
asdf plugin add ruby
asdf plugin add nodejs

# Install Ruby
asdf install ruby 3.2.2
asdf global ruby 3.2.2
gem update --system

# Install Node.js and Yarn
asdf install nodejs 18.16.1
asdf global nodejs 18.16.1
npm install -g yarn

# Install Rails
gem install rails -v 7.0.6

# Configure VS Code as the default editor
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL

# Display installed versions
echo "Ruby version:"
ruby -v
echo "Node.js version:"
node -v
echo "Rails version:"
rails -v

echo "Setup complete!"
