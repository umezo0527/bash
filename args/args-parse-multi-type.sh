#!/bin/bash

#################################################################	
#								#
# コマンドライン解析サンプル					#
# @date 2022/06/25						#
#								#
# 下記の引数指定を可能にします					#
# ./args-parse-multi-type.sh -f ./home/ec2-user/.profile 	#
# ./args-parse-multi-type.sh --file ./home/ec2-suer/.profile	#
# ./args-parse-multi-type.sh --file=./home/ec2-user/.profile	#
#								#
#################################################################

while (( $# > 0 ))
do
  case $1 in
    -f | --file | --file=*)
      # --file指定時 
      if [[ "$1" =~ ^--file= ]]; then
        # 引数指定(--file=)をsedを用いて切り取る
        FILE_OPTION=$(echo $1 | sed -e 's/^--file=//')
      elif [[ -z $2 ]] || [[ $2 =~ ^- ]]; then
        echo "invalid option file" 1>&2
        exit 1
      else 
        echo "else $1"
        shift
        FILE_OPTION="$1"
      fi
      ;;
    -b)
      # 引数の位置パラメータをシフトする
      shift
      # 変数に格納
      OPTION_B_VAL=$1
      ;;
    # -f,--file, --file=*, -b以外は不正なオプション
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

echo "option -f value: $FILE_OPTION"
echo "option -b value: $OPTION_B_VAL"
 
