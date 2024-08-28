# ZSH REEXEC PLUGIN

A ZSH Plugin which will re-execute the last command you entered after so many empty commands.
The plugin uses an ENV variable named REEXEC_PROMPT_COUNT to determine how many empty commands to execute before re-executing the last command which was not empty.
Be default it is set to 3. Starting at 0, hitting enter 4 times should rexecute the last command you typed.


## Usage
I find this super helpful for when I am remoting into a server from a phone for example and need to continuously re-run the last command but do not want to go and hunt down the up arrow or control-r to search history.

To customize the number of empty lines required before the last command will be exectured just export the ENV variable REEXEC_PROMPT_COUNT.

For example, setting:

```zsh
export REEXEC_PROMPT_COUNT=10
```

Will change the plugin so that it takes 10 empty lines before the last command will be re-executed.

## Installation

I keep a copy in my $HOME/.config directory and then source it in my .zshrc file.

So my $HOME/.zshrc file contains the line:

```zsh
export REEXEC_PROMPT_COUNT=3 # Set this to change how many enters to hit before last command is run
source $HOME/.config/reexec_plugin.zsh
```

So to install this plugin, simple download the zsh file somewhere and then source it in your .zshrc file with a line like the one above.
So for me on my MacBook I could add the line above to my .zshrc file and then run the commands:
````zsh
pushd $HOME/.config
curl -O https://raw.githubusercontent.com/bebrws/zsh_reexec/main/reexec_plugin.zsh
popd
```

REMEMBER: It's always a good idea to review content before just downloading it blindly from some Git repo and running it.

You could view the actual script with:
````zsh
curl -O https://raw.githubusercontent.com/bebrws/zsh_reexec/main/reexec_plugin.zsh
```

Just to see the file contents before going and adding it to your .zshrc file (which means it will run everytime you open a new login terminal).

