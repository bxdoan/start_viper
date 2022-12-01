#!/usr/bin/env bash

function _() {
    local SH=$(cd `dirname $BASH_SOURCE` && pwd)
    local AH=$(cd "$SH/.." && pwd)
    cd $AH
    # prepare :pipenv binary
    if [[ $OSTYPE == 'darwin'* ]]; then
      pipenv="pipenv"
    else
      [ -x pipenv ] && pipenv='pipenv' || pipenv="$HOME/.pyenv/shims/pipenv"
    fi

    if [[ $1 ]]; then
      file_name=$1
    else
      file_name='simple_open_auction'  # default file name
    fi
    # make sure path dump json exit
    mkdir -p "$SH/out"
    input_file="$SH/contract/$file_name.vy"
    dump_file="$SH/out/$file_name.json"
    PYTHONPATH=`pwd` $pipenv run vyper -p "$SH" -f combined_json "$input_file" | jq > "$dump_file"
    #                                    root      format json   input file         dump output

}
  _ $1

# Path: ./build.sh