function _() {
    local SH=$(cd `dirname $BASH_SOURCE` && pwd)
    local AH=$(cd "$SH/.." && pwd)
    cd $SH
    # prepare :pipenv binary
    if [[ -f "$HOME/.pyenv/shims/pipenv" ]]; then
      [ -x pipenv ] && pipenv='pipenv' || pipenv_pytest="$HOME/.pyenv/shims/pipenv pytest"
    elif [[ -f "/opt/homebrew/bin/pipenv" ]]; then
      pipenv_pytest="/opt/homebrew/bin/pipenv pytest"
    else
      pipenv_pytest='pytest'
    fi
    mkdir -p "$SH/tmp"
    tee_log="$SH/tmp/$(basename $BASH_SOURCE).log"
    PYTHONPATH=`pwd` $pipenv_pytest  -p no:warnings  --tb=short --lf   2>&1 | tee $tee_log
}
  eval _