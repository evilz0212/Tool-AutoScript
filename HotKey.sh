#!/bin/bash

# =========== 交互區 ===========
# 離開
q(){
    break
}
# 幫助
h(){
    echo
    echo "==== Shell ===="
    echo "q: 離開"
    echo "env: 打開.env檔"
    echo "==== MySQL ===="
    echo "scr: 清除快取"
    echo "srs: 重啟伺服器"
    echo "smi: 建立資料表(migrate)"
    echo "squ: 重啟隊列"
    echo "==== Git ===="
    echo "gv: 目前Commit版本"
    echo
}
# 簡指令區
env(){
    edit_env
}
scr(){
    server_clear
}
srs(){
    server_restart
}
smi(){
    server_migrate
}
squ(){
    server_queue
}
gv(){
    git_log
}
