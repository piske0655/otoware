#!/bin/bash
cd `dirname $0`
if [ -e /bin/ffmpeg ]; then
    if [ $1 =  ]; then
        echo "拡張子を入力してください"
        exit 0
    fi
    a="ffmpeg -i music/"
    b=" -af volume="
    c=" music/"
    d=$a"input."$1$b"1000"$c"output."$1
    echo "生成を開始します"
    $d
    if [ $? = "0" ]; then
        echo "生成が完了しました"
        exit 0
    else
        echo "生成に失敗しました"
        exit 0
    fi
else
    echo "必要ツールがインストールされていません"
    echo "インストールしますか？[y/n]"
    read q
    if [ $q = "y" ]; then
        echo "パッケージリストのアップデートを開始します"
        sudo apt -y update
        if [ $? = 0 ]; then
            echo "アップデートが完了しました"
        else
            echo "アップデートに失敗しました"
            echo "インストールを中断します"
            exit 0
        fi
        echo "必要ツールのインストールを開始します"
        sudo apt -y install ffmpeg
        if [ $? = 0 ]; then
            echo "インストールが完了しました"
        else
            echo "インストールに失敗しました"
            echo "インストールを中断します"
            exit 0
    fi
    else
        echo "インストールを中断しました"
        exit 0
    fi
fi