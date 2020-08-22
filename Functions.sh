#!/bin/bash

# =========== 函式區_F ===========
# 部署
F_deploy(){
    cd_isac
    git_pull
}

# 前往 isac 資料夾
F_folder(){
    cd_isac
    F_interactive
}

# 連線 MySQL資料庫
F_sql(){
    server_login
    # F_interactive
}

# 連線 Mongo資料庫
F_mongo(){
    mongo_login
    F_interactive
}

# 交互模式
F_interactive(){
    # bash -l
    cmd=''
    while [[ ${cmd} != "q" ]]; do
        echo
        read -p "[${env}] $(_path) > " cmd
        ${cmd}
    done
}
