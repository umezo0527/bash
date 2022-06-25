#!/bin/bash

#################################################################	
#								#
# コマンドライン解析サンプル					#
# @date 2022/06/25						#
#								#
# ./args-parse-simple.sh -a a_value -b b_value other_val  	#
#								#
# 								#
#################################################################

while (( $# > 0 ))
do
  case $1 in
    -a)
      # 引数の位置パラメータをシフトする
      shift
      # 変数に格納
      OPTION_A_VAL=$1
      ;;
    -b)
      # 引数の位置パラメータをシフトする
      shift
      # 変数に格納
      OPTION_B_VAL=$1
      ;;
    # -a, -b以外は不正なオプション
    -*)
      echo "invalid option"
      exit 1
      ;;
    *)
      echo "default case arg $1"
      ;;
  esac
  shift
done

echo "option -a value: $OPTION_A_VAL"
echo "option -b value: $OPTION_B_VAL"
 
