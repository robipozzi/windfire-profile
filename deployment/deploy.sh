source ../setenv.sh

## Remove Angular distribution folder
echo ${cyn}Removing Angular dist folder $ANGULAR_DIST_DIR ...${end}
rm -rf $ANGULAR_DIST_DIR
echo ${cyn}Angular dist folder removed${end}
echo

## Build Angular app for production environment
echo ${cyn}Building Angular app ...${end}
ng build --prod
echo ${cyn}Angular app built${end}
echo

## Deploy Angular application to remote Raaspberry box
echo ${cyn}Deploy app on Raspberry Pi ...${end}
ansible-playbook -u pi deploy.yaml
echo ${cyn}Done${end}
echo

## Remove Angular distribution folder
echo ${cyn}Removing Angular dist folder $ANGULAR_DIST_DIR ...${end}
rm -rf $ANGULAR_DIST_DIR
echo ${cyn}Angular dist folder removed${end}