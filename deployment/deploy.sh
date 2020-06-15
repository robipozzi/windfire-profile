source ../setenv.sh

removeAngularDistFolder()
{
	## Remove Angular distribution folder
    echo ${cyn}Removing Angular dist folder $ANGULAR_DIST_DIR ...${end}
    rm -rf $ANGULAR_DIST_DIR
    echo ${cyn}Angular dist folder removed${end}
}

buildAngularApp()
{
	## Build Angular app for production environment
    echo ${cyn}Building Angular app ...${end}
    ng build --prod
    echo ${cyn}Angular app built${end}
    echo
}

deployToIBMCloud()
{
	## Deploy Angular application to IBM Cloud
    echo ${cyn}Deploy application to IBM Cloud ...${end}
    cd ibmcloud/architecture-single_server
    # TODO: change to 'apply'
    ./provision.sh plan
    echo ${cyn}Done${end}
    echo
}

deployToRaspberry()
{
	## Deploy Angular application to remote Raspberry box
    echo ${cyn}Deploy application to Raspberry Pi ...${end}
    ansible-playbook -u pi raspberry/deploy.yaml 
    echo ${cyn}Done${end}
    echo
}

deploy()
{
    printSelectPlatform
    removeAngularDistFolder
    buildAngularApp
    $DEPLOY_FUNCTION
	removeAngularDistFolder
}

printSelectPlatform()
{
	echo ${grn}Select deployment platform : ${end}
	echo ${grn}1. Raspberry${end}
	echo ${grn}2. IBM Cloud - Single Server${end}
	read PLATFORM_OPTION
	DEPLOY_FUNCTION=
	case $PLATFORM_OPTION in
		1)  DEPLOY_FUNCTION="deployToRaspberry"
			;;
		2)  DEPLOY_FUNCTION="deployToIBMCloud"
			;;
		*) 	printf "\n${red}No valid option selected${end}\n"
			printSelectPlatform
			;;
	esac
}

###### Main section
RUN_FUNCTION=deploy
$RUN_FUNCTION