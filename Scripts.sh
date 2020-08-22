#!/bin/bash

# =========== 腳本區_S ===========
# 選擇環境
S_select_env(){
    read -n 1 -p "Select env [1=Local 2=Dev 3=Prod]: " env
    if [[ ${env} = 1 ]]; then
        env=Local
    elif [[ ${env} = 2 ]]; then
        env=Dev
    elif [[ ${env} = 3 ]]; then
        env=Prod
    else
        exit
    fi
    echo -e "\n[Auto Script]: Env ->" ${env} "\n"
}
# 選擇模式
S_select_task(){
    read -n 1 -p "Select task [1=Deploy 2=Folder 3=SQl 4=Mongo]: " task
    if [[ ${task} = 1 ]]; then
        task=Deploy
    elif [[ ${task} = 2 ]]; then
        task=Folder
    elif [[ ${task} = 3 ]]; then
        task=SQl
    elif [[ ${task} = 4 ]]; then
        task=Mongo
    else
        exit
    fi
    echo -e "\n[Auto Script]: Task ->" ${task} "\n"
}
# 部署
S_Deploy(){
    if [[ ${env} = 'Local' ]]; then
        echo "Pass"
    elif [[ ${env} = 'Dev' ]] || [[ ${env} = 'Prod' ]]; then
        _ssh $env $task $testMode F_deploy
    fi
}
# 開啟資料夾（輸入指令or使用常用指令）
S_Folder(){
    if [[ ${env} = 'Local' ]]; then
        F_folder
    elif [[ ${env} = 'Dev' ]] || [[ ${env} = 'Prod' ]]; then
        _ssh $env $task $testMode F_folder
    fi
}
# 連線 MySQL資料庫（輸入指令or使用常用指令）
S_Sql(){
    if [[ ${env} = 'Local' ]]; then
        F_sql
    elif [[ ${env} = 'Dev' ]] || [[ ${env} = 'Prod' ]]; then
        _ssh $env $task $testMode F_sql
    fi
}
# 連線 Mongo資料庫（輸入指令or使用常用指令）
S_Mongo(){
    if [[ ${env} = 'Local' ]]; then
        F_mongo
    elif [[ ${env} = 'Dev' ]] || [[ ${env} = 'Prod' ]]; then
        _ssh $env $task $testMode F_mongo
    fi
}
