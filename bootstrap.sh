#!/bin/bash
start_daemon(){
  /opt/logmein-hamachi/bin/hamachid -c /config
  while [ 1 ]; do
    out=$(hamachi)
    [[ $out =~ *version* ]] && sleep 1 || break
  done
}

check_login(){
  # IFS=$'\n';
  # regex_status="status: (.*?)"
  # regex_account="lmi account:(.*?)"
  # for line in $(hamachi); do
  #   if [[ $line =~ $regex_status ]]; then
  #     if [[ ${BASH_REMATCH[1]} == offline ]]; then
  #       while [ 1 ]; do
  #         echo "do login"
  #         out=$(hamachi login)
  #         [[ $out =~ ok ]] && break || sleep 1
  #       done
  #     fi
  #   fi
  # done

  while [ 1 ]; do
    out=$(hamachi)
    echo $out
    [[ $out =~ "Hamachi does not seem to be running" ]] && sleep 1
    [[ $out =~ "status" ]] && break
  done

  echo "start login"
  echo $(hamachi login)

  while [ 1 ]; do
    out=$(hamachi)
    echo $out
    [[ $out =~ "Logging in" ]] && sleep 1
    [[ $out =~ "logged in" ]] && break
  done
}

cd /logmein-hamachi-2.1.0.139-x64
./install.sh
start_daemon
check_login
hamachi join $HAMACHI_NET_ACC $HAMACHI_NET_PASS
socat $LOACL_HOST $REMOTE_HOST
