#!/bin/bash
## https://github.com/QuanticoBit
## :D


# Install dependencies for compiling Ruby
yes | sudo apt-get update
yes | sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# Install ASDF if not already installed
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf"
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
    echo 'legacy_version_file = yes' >> ~/.asdfrc
    echo 'export EDITOR="code --wait"' >> ~/.bashrc
    exec $SHELL
fi

# Install ASDF plugins
yes | asdf plugin add ruby
yes | asdf plugin add nodejs

# Install Ruby
yes | asdf install ruby 3.2.2
yes | asdf global ruby 3.2.2
yes | gem update --system

# Install Node.js and Yarn
yes | asdf install nodejs 18.16.1
yes | asdf global nodejs 18.16.1
yes | npm install -g yarn

# Install Rails
yes | gem install rails -v 7.0.6

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

echo "Trust in god!"
echo "Setup complete!"
