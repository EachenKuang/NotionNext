#!/bin/bash

# 查找yarn start进程的PID
pid=$(ps aux | grep 'yarn start' | grep -v grep | awk '{print $2}')

# 如果找到了进程，就杀死它
if [ -n "$pid" ]; then
  echo "Killing process $pid"
  kill $pid
else
  echo "No process found"
fi

sudo kill $(sudo lsof -t -i:3000)