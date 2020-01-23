source ../../../setenv.sh

###### Variable section - START
SCRIPT=provision.sh
###### Variable section - END

###############
## printHelp ##
###############
printHelp()
{
    printf "${red}Missing arguments !!!${end}\n"
	printf "\n${yel}Usage:${end}\n"
  	printf "${cyn}$SCRIPT${end}\n"
}

####################
## Run Terraform  ##
####################
runTerraform()
{
	echo "######################################################"
	echo "############## Run Terraform automation ##############"
	echo "######################################################"
    echo ${cyn}Running Terraform plan ...${end}
    terraform plan
}

RUN_FUNCTION=runTerraform
$RUN_FUNCTION