#!/bin/bash

# 设置日志文件名为当前时间
log_file="notionnext-$(date +%Y%m%d-%H%M%S).log"

# 执行yarn build命令
yarn build

# 启动yarn start命令，并将输出重定向到日志文件
nohup yarn start > "$log_file" 2>&1 &

# 输出日志文件名
echo "Log file: $log_file"