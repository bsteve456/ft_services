#! bin/bash

ls -l /home/steve && ls -l /home/
rc-service vsftpd restart && tail -f /dev/null
