# Plugin to re-execute the last command after a specified number of empty prompts

# Function to initialize variables
function _reexec_init() {
  export EMPTY_PROMPT_COUNT=0
  export LAST_COMMAND=""

  # Set default value for REEXEC_PROMPT_COUNT if not already set
  : ${REEXEC_PROMPT_COUNT:=3}
}

# Function to be called before each prompt
function _reexec_preexec() {
  export EMPTY_PROMPT_COUNT=0
  if [[ -n $1 ]]; then
    export LAST_COMMAND=$1
  fi
}

# Function to be called after each command
function _reexec_precmd() {
  if [[ $EMPTY_PROMPT_COUNT -eq $REEXEC_PROMPT_COUNT && -n $LAST_COMMAND ]]; then
    echo "Executing: $LAST_COMMAND"
    eval "$LAST_COMMAND"
    export EMPTY_PROMPT_COUNT=0
  elif [[ -z $BUFFER ]]; then
    export EMPTY_PROMPT_COUNT=$((EMPTY_PROMPT_COUNT + 1))
  else
    export EMPTY_PROMPT_COUNT=0
  fi
}

# Set up the hooks
function _reexec_setup_hooks() {
  autoload -Uz add-zsh-hook
  add-zsh-hook preexec _reexec_preexec
  add-zsh-hook precmd _reexec_precmd
}

# Initialize and set up hooks when the plugin is loaded
_reexec_init
_reexec_setup_hooks
