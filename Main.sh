#!/bin/bash

# 測試模式(關閉:0 開啟:1)
testMode=0

source "${0%\/*}"/Variables.sh
source "${0%\/*}"/Commends.sh
source "${0%\/*}"/HotKey.sh
source "${0%\/*}"/Functions.sh
source "${0%\/*}"/Scripts.sh

# =========== 主程式區 ===========
# Step.1 選擇環境\任務
S_select_env
S_select_task
setVariable

# Step.2 執行任務
if [[ ${task} = 'Deploy' ]]; then
    S_Deploy
elif [[ ${task} = 'Folder' ]]; then
    S_Folder
elif [[ ${task} = 'SQl' ]]; then
    S_Sql
elif [[ ${task} = 'Mongo' ]]; then
    S_Mongo
fi

# Step.3 完成退出
print_log "Completed task"
read -n 1 -p "Press any key to exit..."



# =========== 備註 ===========
# 待新增功能
# 1. python爬資料（清資料表）
# 2. mysql 自動化指令集
