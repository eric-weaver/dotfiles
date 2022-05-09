#!/usr/bin/env bash

# profile wont be sourced if ~/.bash_profile exists
[ -e "$HOME/.profile" ] && source "$HOME/.profile"
