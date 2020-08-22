#!/bin/bash

# =========== 變數區 ===========
Variable(){
    # 資料夾
    local_folder=
    develop_folder=
    product_folder=

    # IP位址\主機
    ssh_develop_user=
    ssh_product_user=
    ssh_develop_ip=
    ssh_product_ip=

    # Key位置
    ssh_develop_key=
    ssh_product_key=

    # git連線密碼
    git_user=
    git_psw=

    # 資料庫設定
    sql_database=
    # 資料庫密碼(有$要加'單引號')
    sql_local_user=
    sql_local_psw=
    sql_develop_user=
    sql_develop_psw=
    sql_product_user=
    sql_product_psw=
    # 資料庫安裝位置
    mysql_local=/Applications/MAMP/Library/bin/mysql
    mysql_develop=mysql
    mysql_product=mysql

    # 其他設定
    log="\n[Auto Script]: (${env}->${task})"
}
setVariable(){
    Variable
    if [[ $env = 'Local' ]]; then
        isac_folder=${local_folder}
        ssh_user=''
        ssh_ip=''
        ssh_key=''
        sql_user=${sql_local_user}
        sql_psw=${sql_local_psw}
        mysql=${mysql_local}

    elif [[ ${env} = 'Dev' ]]; then
        isac_folder=${develop_folder}
        ssh_user=${ssh_develop_user}
        ssh_ip=${ssh_develop_ip}
        ssh_key=${ssh_develop_key}
        sql_user=${sql_develop_user}
        sql_psw=${sql_develop_psw}
        mysql=${mysql_develop}

    elif [[ ${env} = 'Prod' ]]; then
        isac_folder=${product_folder}
        ssh_user=${ssh_product_user}
        ssh_ip=${ssh_product_ip}
        ssh_key=${ssh_product_key}
        sql_user=${sql_product_user}
        sql_psw=${sql_product_psw}
        mysql=${mysql_product}
    fi
}
