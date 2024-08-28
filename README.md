# ZSH REEXEC PLUGIN

A ZSH Plugin which will re-execute the last command you entered after so many empty commands.
The plugin uses an ENV variable named REEXEC_PROMPT_COUNT to determine how many empty commands to execute before re-executing the last command which was not empty.
Be default it is set to 3. Starting at 0, hitting enter 4 times should rexecute the last command you typed.

I find this super helpful for when I am remoting into a server from a phone for example and need to continuously re-run the last command but do not want to go and hunt down the up arrow or control-r to search history.

To customize the number of empty lines required before the last command will be exectured just export the ENV variable REEXEC_PROMPT_COUNT.

For example, setting:

```zsh
export REEXEC_PROMPT_COUNT=10
```

Will change the plugin so that it takes 10 empty lines before the last command will be re-executed.

Usage:

I keep a copy in my $HOME/.config directory and then source it in my .zshrc file.

So my $HOME/.zshrc file contains the line:

```zsh
source $HOME/.config/reexec_plugin.zsh
```
