#!/bin/bash

# =========== 指令區 ===========
# --- Shell ---
_ssh(){
    print_step "ssh 連線 -> ${env}"
    ssh -i "${ssh_key}" ${ssh_user}@${ssh_ip} -t "$(typeset -f); env=${1}; task=${2}; testMode=${3}; setVariable; ${4}; echo;"
}
cd_isac(){
    print_log "cd ${isac_folder}"
    cd "${isac_folder}"
}
edit_env(){
    vim .env
}

# Git
git_pull(){
    print_log "git pull (from bitbucket.org)"
    _testMode $(_check "sudo git pull https://${git_user}:${git_psw}@bitbucket.org/arcranmaster/isac.tw.git")
    server_restart
    print_step "完成部署"
    git_log
}
git_log(){
    echo
    git --no-pager log -1
}

# --- Server ---
# 重新刷新資料表 (暫略)
server_login(){
    print_step "SQL Login -> ${env}"
    ${mysql} -u${sql_user} -p${sql_psw} ${sql_database} #.sql
}
server_restart(){
    print_log "Restart Apache"
    sudo /etc/init.d/apache2 restart
}
server_clear(){
    php artisan config:cache
    php artisan config:clear
}
server_queue(){
    server_clear
    php artisan queue:restart
    php artisan queue:work --tries=3 &
}
server_migrate(){
    php artisan migrate
}

# --- Mongo ---
mongo_login(){
    mongo
}

# --- Commend ---
print_step(){
    echo -e "\n=============================================================="
    echo -e "Auto Script: ${1}"
    echo -e "=============================================================="
}
print_log(){
    echo -e $log ${1}
}
_path(){
    nowPath=$(pwd)
    echo -n "${nowPath##*/}"
}
_check(){
    read -n 1 -p "Sure? (y/n) " chk
    if [[ ${chk} = 'y' ]]; then
        ${1}
    fi
}
_testMode(){
    if [[ ${testMode} = '0' ]]; then
        ${1}
    fi
}
