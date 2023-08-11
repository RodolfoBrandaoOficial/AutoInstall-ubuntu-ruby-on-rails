#!/bin/bash
## https://github.com/QuanticoBit
## :D


# Set the log file path
LOG_FILE="installation_log.txt"

# Function to log commands and their output
log_command() {
    echo "Running: $1" >> "$LOG_FILE"
    eval "$1" >> "$LOG_FILE" 2>&1
}

# Install dependencies for compiling Ruby
log_command "yes | sudo apt-get update"
log_command "yes | sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev"

# Install ASDF if not already installed
if [ ! -d "$HOME/.asdf" ]; then
    log_command "git clone https://github.com/asdf-vm/asdf.git \"$HOME/.asdf\""
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
    echo 'legacy_version_file = yes' >> ~/.asdfrc
    echo 'export EDITOR="code --wait"' >> ~/.bashrc
    exec $SHELL
fi

# Install ASDF plugins
log_command "yes | asdf plugin add ruby"
log_command "yes | asdf plugin add nodejs"

# Install Ruby
log_command "yes | asdf install ruby 3.2.2"
log_command "yes | asdf global ruby 3.2.2"
log_command "yes | gem update --system"

# Install Node.js and Yarn
log_command "yes | asdf install nodejs 18.16.1"
log_command "yes | asdf global nodejs 18.16.1"
log_command "yes | npm install -g yarn"

# Install Rails
log_command "yes | gem install rails -v 7.0.6"

# Configure VS Code as the default editor
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL

# Display installed versions
log_command "echo \"Ruby version:\""
log_command "ruby -v"
log_command "echo \"Node.js version:\""
log_command "node -v"
log_command "echo \"Rails version:\""
log_command "rails -v"

echo "Setup complete!" | tee -a "$LOG_FILE"
echo "Trust in god!"

