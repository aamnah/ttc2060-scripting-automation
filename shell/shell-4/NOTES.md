# Debugging and error tracing

`set` sets or unset values of shell options and positional parameters.

- `-x` = print commands and their arguments as they are executed
- `-e` = exit immediately if a command exits with a non-zero status
- `-v` = print shell input lines as they are read

- `set -x` at the beginning of the script enable tracing. It prints commands and their arguments as they are executed
- `set -x` enables it and `set +x` disables it

You can combine multiple options 

# Logging

Severity levels are: 
1. `emergency`
2. `alert`
3. `critical`
4. `error`
5. `warning`
6. `notice`
7. `info` 
8. `debug`

- the `logger` command generates syslog messages and by default, it creates messages using the `user` facility and the `notice` severity (`user.notice`).


```bash
# simplest form
logger "message"

# specify priority
logger -p local3.info "message"

# specify tag
logger -t "script_name" "Message"

# include the PID
logger -i "Message"

logger -i -t "my_script" -p local0.info "message with a custom tag, PID and custom priority"
#MONTH DAY TIME <hostname> my_script[<PID>]: message with a custom tag, PID and custom priority
```