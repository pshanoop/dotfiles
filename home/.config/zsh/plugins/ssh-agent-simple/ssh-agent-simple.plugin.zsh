local _pluging_env_file

function _plugin__start_agent()
{
  # start ssh-agent and setup environment
  /usr/bin/env ssh-agent | sed '/^echo/D' > ${_pluging_env_file}
  chmod 600 ${_pluging_env_file}
  . ${_pluging_env_file} > /dev/null
}

_pluging_env_file="$HOME/.cache/ssh-environment-$HOST"

if [ -f "${_pluging_env_file}" ]; then
  . ${_pluging_env_file} > /dev/null
  ps x | grep ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || _plugin__start_agent;
else
  _plugin__start_agent;
fi

unfunction _plugin__start_agent
unset _pluging_env_file
