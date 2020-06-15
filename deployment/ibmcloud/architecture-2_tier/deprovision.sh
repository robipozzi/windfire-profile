source ../../../setenv.sh

###### Variable section - START
SCRIPT=deprovision.sh
###### Variable section - END

####################
## Run Terraform  ##
####################
runTerraform()
{
	echo "######################################################"
	echo "############## Run Terraform automation ##############"
	echo "######################################################"
    echo ${cyn}Running Terraform destroy command ...${end}
    terraform destroy -auto-approve 
}

RUN_FUNCTION=runTerraform
$RUN_FUNCTION