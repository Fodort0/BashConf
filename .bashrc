export PATH="$PATH:/c/Users/ftama/AppData/Roaming/npm"
export PATH=$PATH:/c/Program\ Files/Neovim/bin
alias vimconf='cd /c/Users/ftama/AppData/Local/nvim'
export PATH=$PATH:/c/Users/ftama/scoop/shims
alias conf='nvim ~/.bashrc'
alias srconf='source ~/.bashrc'
alias info="fastfetch --logo 'C:/Users/ftama/Documents/AsciiArt/art.txt'"
alias vim="nvim"
alias ds="cd /c/Users/ftama/Desktop"
alias ..="cd .."

# Variable to store the Windows path from the custom pwd command
LAST_WIN_PATH=""

# Custom pwd function to display the Windows path format and store it for copying
function pwd() {
    LAST_WIN_PATH=$(cygpath -w "$(command pwd)")
    echo "$LAST_WIN_PATH"
}

# Function to copy the output of the last command to the clipboard
function c() {
    # Check if the last command was 'pwd'
    last_command=$(history 2 | head -n 1 | awk '{$1=""; print $0}' | xargs)
    
    if [[ "$last_command" == "pwd" ]]; then
        # Copy the stored Windows path if 'pwd' was the last command
        echo -n "$LAST_WIN_PATH" | clip.exe
        echo "Windows path copied to clipboard."
    else
        # Otherwise, copy the output of the last command as usual
        last_command_output=$(fc -ln -2 | head -n 1 | bash)
        echo -n "$last_command_output" | clip.exe
        echo "Output copied to clipboard."
    fi
}
