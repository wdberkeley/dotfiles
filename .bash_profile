# wdberkeley's .bash_profile
# Remember, .bash_profile is run for a login shell.

if [ -r "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
else
  echo "unable to find .bashrc"
fi
