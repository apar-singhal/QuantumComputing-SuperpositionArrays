#!/bin/bash

SERVER[0]=ldap
SERVER[1]=dns
SERVER[2]=emailserver
SERVER[3]=webserver
SERVER[4]=hmi
SERVER[5]=db
SERVER[6]=monitor
SERVER[7]=helpdesk
SERVER[8]=extra

function getAll() {
  echo ${SERVER[*]}
}

function getAddr(){
    user=blueteam
    serverName=$1
    case $serverName in
	  ${SERVER[0]})
#   	   ldap)
                ip=19
                ;;
	  ${SERVER[1]}) 
#	   dns)
                ip=9
                ;;
	  ${SERVER[2]})
#       emailserver)
                ip=24
                ;;
	  ${SERVER[3]})
#          webserver)
                ip=5
                ;;
	  ${SERVER[4]})
#          hmi)
                ip=6
                ;;
	  ${SERVER[5]})
#          db)
                ip=4
                ;;
	  ${SERVER[6]})
#       monitor)
                ip=8
                ;;
	  ${SERVER[7]})
#	   helpdesk)
				ip=27
				;;
	  ${SERVER[8]})
#          extra)
                ip=14
                ;;
          *)
                echo "YOU HAVE A TYPO. Check this list:"
				echo ${SERVER[*]}
                ;;
    esac

    echo $user@10.0.26.$ip
}
