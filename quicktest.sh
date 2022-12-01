#!/usr/bin/env bash

function _() {
    local SH=$(cd `dirname $BASH_SOURCE` && pwd)
    local AH=$(cd "$SH/.." && pwd)
    cd $SH
    # prepare :pipenv binary
    if [[ $OSTYPE == 'darwin'* ]]; then
      pipenv="pipenv"
    else
      [ -x pipenv ] && pipenv='pipenv' || pipenv="$HOME/.pyenv/shims/pipenv"
    fi

    PYTHONPATH=`pwd` $pipenv run pytest  -p no:warnings  --tb=short --lf   2>&1 | tee "$SH/$(basename $BASH_SOURCE).log"
}
  eval _