#!/bin/bash

assert() {
    expected="$1"
    input="$2"

    # アセンブリを出力。
    ./c2 "$input" > tmp.s
    # コンパイル
    cc -o tmp tmp.s
    # 実行して結果を取得
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

assert 0 0
assert 42 42

echo OK
