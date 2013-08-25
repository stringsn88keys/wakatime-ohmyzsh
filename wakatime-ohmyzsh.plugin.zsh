if [ ! -f "$HOME/.wakatime.conf" ]
then
  key=""
  vared -p input("Enter your WakaTi.me api key: ") key
  if [ "$key" != "" ]
  then
    echo "api_key=$key" > "$HOME/.wakatime.conf"
  fi
fi

wakatime_ActionFrequency = 5 # minimum number of seconds between postings
timeout_time = 60 # max time to count between precmd and postcmd

# [begin_time, last_action_time]

function wakatime_precmd() {
  # executed before each prompt
  # TODO count the difference between postcmd time and precmd as "working time"

  # if current_time - begin_time < 5
  #   update last_action_time = current_time
  #
  # if current_time - begin_time > 5 post data [current_time - begin_time]
  #   update begin_time = last_action_time = current_time
  #
}

function wakatime_postcmd() {
  # executed just after a command is read
  #
  # if current_time - begin_time < 5
  #   update last_action_time = current_time
  #
  # if current_time - begin_time > 5 post data
  #   time is last_action_time - begin_time (+ min(timeout_time, current_time - last_action_time))
  #
}

precmd_functions += wakatime_precmd
preexec_functions += wakatime_preexec
