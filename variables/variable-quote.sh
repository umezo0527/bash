#!/bin/bash

#########################################################################
#									#
#  変数をダブルクォートで囲んだサンプル					#
#									#
#########################################################################

RET=`ls -alt`

# ダブルクォート付きのコマンドを返す
function getResult1() {
  echo "`ls -alt`"
}

function getResult2() {
  echo `ls -alt`
}

echo --- ダブルクォートなし --
echo $RET

echo --- ダブルクォートあり--
echo "$RET"

# 改行省略
echo `getResult1`
# 改行省略なし
echo "`getResult1`"

# 改行省略
echo "`getResult2`"
