#!/usr/bin/env bash

# profile wont be sourced if ~/.bash_profile exists
[ -e "$HOME/.profile" ] && source "$HOME/.profile"

# work related profile
[ -e "$HOME/.work_profile" ] && source "$HOME/.work_profile"
