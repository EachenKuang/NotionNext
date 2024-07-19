#!/bin/bash

sudo kill $(sudo lsof -t -i:3000)

# 查找yarn start进程的PID
pid=$(ps aux | grep 'yarn start' | grep -v grep | awk '{print $2}')

# 如果找到了进程，就杀死它
if [ -n "$pid" ]; then
  echo "Killing process $pid"
  kill $pid
else
  echo "No process found"
fi

# 设置日志文件名为当前时间
log_file="logs/notionnext-$(date +%Y%m%d-%H%M%S).log"

# 执行yarn build命令
yarn build

# 启动yarn start命令，并将输出重定向到日志文件
nohup yarn start > "$log_file" 2>&1 &

# 输出日志文件名
echo "Log file: $log_file"