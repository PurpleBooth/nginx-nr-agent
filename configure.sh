#!/usr/bin/env bash
# global settings

cat > /etc/nginx-nr-agent/nginx-nr-agent.ini <<- EOM
[global]
newrelic_license_key=${NEW_RELIC_LICENSE_KEY}
poll_interval=60

# logging settings

[loggers]
keys=root

[handlers]
keys=consoleHandler,fileHandler

[formatters]
keys=simpleFormatter

[logger_root]
level=DEBUG
handlers=consoleHandler,fileHandler

[handler_consoleHandler]
class=StreamHandler
level=DEBUG
formatter=simpleFormatter
args=(sys.stdout,)

[handler_fileHandler]
class=FileHandler
level=DEBUG
formatter=simpleFormatter
args=('/var/log/nginx-nr-agent.log','a',)

[formatter_simpleFormatter]
format=%(asctime)s %(name)s [%(levelname)s]: %(message)s
datefmt=

# data sources settings

[source1]
name=${NEW_RELIC_APP_NAME}
url=${NGINX_STATUS_URL}

#[source2]
#name=examplecom
#url=http://example.com/status
#http_user=testuser
#http_pass=testpass
EOM