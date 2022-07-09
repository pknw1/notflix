#!/bin/bash
curl 'https://status.pknw1.co.uk/api/getMonitorList/58xvoS0A9p?page=1&&_=$(date +%s)' > /home/docker/compose/config/docker-proxy/www/images.pknw1.co.uk/api.json
exit 0
