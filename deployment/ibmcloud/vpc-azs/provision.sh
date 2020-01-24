source ../../../setenv.sh

###### Variable section - START
SCRIPT=provision.sh
COMMAND=$1
###### Variable section - END

###############
## printHelp ##
###############
printHelp()
{
    printf "${red}Missing arguments !!!${end}\n"
	printf "\n${yel}Usage:${end}\n"
  	printf "$SCRIPT [COMMAND]\n"
	printf "where COMMAND is one of the following:\n"
	printf "	plan - execute 'terraform plan' command\n"
	printf "	apply - execute 'terraform apply' command\n"
}

####################
## Run Terraform  ##
####################
runTerraform()
{
	echo "######################################################"
	echo "############## Run Terraform automation ##############"
	echo "######################################################"
    echo ${cyn}Running Terraform $COMMAND command ...${end}
    terraform $COMMAND
}

if [ -z $COMMAND ]; then 
	printHelp
else
	RUN_FUNCTION=runTerraform
	$RUN_FUNCTION
fi