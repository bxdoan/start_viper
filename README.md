# start_viper
[![Build Status](https://github.com/bxdoan/start_viper/workflows/Test/badge.svg)](https://github.com/bxdoan/start_viper/actions)

all code in this repo is for learning vyper framework only, not for production

ref. https://vyper.readthedocs.io/en/stable/vyper-by-example.html

ref. https://github.com/vyperlang/vyper

1. install vyper
```shell
pipenv sync
```

2. compile vyper to abi
```shell
./build.sh FILENAME

./build.sh simple_open_aution
```

The result of build will be in `gen` folder
3. tests
```shell
./quicktest.sh
```

The result of build will be in `tmp` folder
