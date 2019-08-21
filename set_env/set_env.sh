#!/bin/sh
# Create by Leo
# 1. Receive server type
# 2. Remove old environment variables on bashrc
# 3. Write new environment variables on bashrc
# 4. Ask if it should be applied now
# 4-1. [y] -> source ~/.bashrc
# 4-2. [n] -> Tells you which commands you can perform at a later time, and then exits.
_ISENV="localhost DBUser DBPassword nodePort walletPort NNA2NNA_Srv NNA2NNA_Cli NNA2ISA_Srv CN2NNA_Cli"
_NNENV="SCA2CLI_IP1 SCA2CLI_IP2 SCA2CLI_Port1 SCA2CLI_Port2 ISA2IS_Cli ISServer NNA2ISA_Srv ISA2CLI_Srv DBURL DBUser DBPassword SCAPort ISAPort SCADB SCADBHost BEServer SCA2BE_Srv SCA2BE_Cli BEPath_TX BEPath_Block"
_CNENV="SCA2CLI_Srv ISA2IS_Cli ISServer NNA2ISA_Srv ISA2CLI_Srv DBURL DBUser DBPassword"
echo "Enter Server Type [IS / NN / CN]"
read _kind
echo "Enter Index Server's IP Address"
read _ISIP
echo "Enter MariaDB User"
read _DBUser
echo "Enter MariaDB Password (If \"\$\" in password, please insert \"\\\\\" in front of \"\$\" .)"
read _DBPasswd

if [ $_kind = "IS" ];
then
	echo "[info] [IS] Remove old environment variables ..."
	for n in $_ISENV
		do	
			sed -i "/$n/d" ~/.bashrc
			if [ $? == 0 ];
			then
				echo "ENV $n Delete OK !"
				echo " "
			else
				echo "ENV $n Delete Failure.."
				echo " "
			fi
		done
	echo "[info] [IS] Remove old environment variables OK"
	echo "[info] [IS] New environment variables Write Start"
	echo "export localhost=127.0.0.1;">>~/.bashrc
	echo "export DBUser=$_DBUser;">>~/.bashrc
	echo "export DBPassword=$_DBPasswd;">>~/.bashrc
	echo "export nodePort=12079;">>~/.bashrc
	echo "export walletPort=42079;">>~/.bashrc
	echo "export NNA2NNA_Srv=11879;">>~/.bashrc
	echo "export NNA2NNA_Cli=21879;">>~/.bashrc
	echo "export NNA2ISA_Srv=18279;">>~/.bashrc
	echo "export CN2NNA_Cli=28279;">>~/.bashrc
	echo "[info] [IS] New environment variables Write OK"
	echo "apply the entered environment variables now? [y / n]"
	read _Apply

	if [ $_Apply = "y" ];
	then
		source ~/.bashrc
		echo "Successful Completion"
	
	else
		echo "Apply directly through the \"source ~/.bashrc\" command."
	fi

elif [ $_kind = "NN" ];
then
	echo "[info] [NN] Remove old environment variables ..."
	for n in $_NNENV
		do	
			sed -i "/$n/d" ~/.bashrc
			if [ $? == 0 ];
			then
				echo "ENV $n Delete OK !"
				echo " "
			else
				echo "ENV $n Delete Failure.."
				echo " "
			fi
		done
	echo "[info] [NN] Remove old environment variables OK"
	echo "[info] [NN] New environment variables Write Start"
	echo "export SCA2CLI_IP1=192.168.0.222;">>~/.bashrc
	echo "export SCA2CLI_IP2=192.168.0.225;">>~/.bashrc
	echo "export SCA2CLI_Port1=11979;">>~/.bashrc
	echo "export SCA2CLI_Port2=11879;">>~/.bashrc
	echo "export ISA2IS_Cli=12079;">>~/.bashrc
	echo "export ISServer=192.168.0.211;">>~/.bashrc
	echo "export NNA2ISA_Srv=18279;">>~/.bashrc
	echo "export ISA2CLI_Srv=42879;">>~/.bashrc
	echo "export DBURL=jdbc:mysql://localhost:3306/?serverTimezone=UTC\&autoReconnect=true\&validationQuery=\"select 1\";">>~/.bashrc
	echo "export DBUser=$_DBUser;">>~/.bashrc
	echo "export DBPassword=$_DBPasswd;">>~/.bashrc
	echo "export SCAPort=32879;">>~/.bashrc
	echo "export ISAPort=42879;">>~/.bashrc
	echo "export SCADB=SCA;">>~/.bashrc
	echo "export SCADBHost=localhost;">>~/.bashrc
	echo "export BEServer=gmbplatform.io;">>~/.bashrc
	echo "export SCA2BE_Srv=21979;">>~/.bashrc
	echo "export SCA2BE_Cli=31979;">>~/.bashrc
	echo "export BEPath_TX=/blockexplorer/scheduler/transaction;">>~/.bashrc
	echo "export BEPath_Block=/blockexplorer/scheduler/block;">>~/.bashrc

	echo "[info] [NN] New environment variables Write OK"
	echo "apply the entered environment variables now? [y / n]"
	read _Apply
	if [ $_Apply = "y" ];
	then
		source ~/.bashrc
		echo "Successful Completion"	
	else
		echo "Apply directly through the \"source ~/.bashrc\" command."
	fi
	
elif [ $_kind = "CN" ];
then
	echo "[info] Remove old environment variables ..."
	for n in $_CNENV
		do	
			sed -i "/$n/d" ~/.bashrc
			if [ $? == 0 ];
			then
				echo "ENV $n Delete OK !"
				echo " "
			else
				echo "ENV $n Delete Failure.."
				echo " "
			fi
		done
	echo "[info] Remove old environment variables OK"
	echo "[info] [CN] New environment variables Write Start"
	echo "export DBURL=jdbc:mysql://localhost:3306/?serverTimezone=UTC\&autoReconnect=true\&validationQuery=\"select 1\";">>~/.bashrc
	echo "export DBUser=$_DBUser;">>~/.bashrc
	echo "export DBPassword=$_DBPasswd;">>~/.bashrc
	echo "export SCA2CLI_Srv=11979;">>~/.bashrc
	echo "export ISA2IS_Cli=12079;">>~/.bashrc
	echo "export ISServer=192.168.0.211;">>~/.bashrc
	echo "export NNA2ISA_Srv=18279;">>~/.bashrc
	echo "export ISA2CLI_Srv=42879;">>~/.bashrc

	echo "[info] [CN] New environment variables Write OK"
	echo "apply the entered environment variables now? [y / n]"
	read _Apply
	if [ $_Apply = "y" ];
	then
		source ~/.bashrc
		echo "Successful Completion"	
	else
		echo "Apply directly through the \"source ~/.bashrc\" command."
	fi
	
else
	echo "[Error] Invalid Server type."
	echo "Please enter it only in the view. [IS / NN / CN]"
fi