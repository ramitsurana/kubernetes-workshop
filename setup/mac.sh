#!/bin/bash

##############################################################
# Installing and Configuring Minikube on Mac
##############################################################

# Default Variables
HOMEBREW_PATH="/usr/local/bin/brew"
VIRTUALBOX_PATH="/usr/local/bin/virtualbox"
RUBY_PATH="/usr/bin/ruby"
DOCKER_PATH="/usr/local/bin/docker"
HOMEBREW_INSTALL_PATH="https://raw.githubusercontent.com/Homebrew/install/master/install"
MINIKUBE_PATH="/usr/local/bin/minikube"
STDOUT="> /dev/null 2>&1"

function install_minikube() {
    echo "Checking if docker is installed or not ..."
    if [[ $(which docker) == "$DOCKER_PATH" ]]; then
         echo "Found docker on the system ..."
    else
         echo "Could not find docker on the system. Installing ..."
         $HOMEBREW_PATH install docker $STDOUT
    fi;
    echo "Checking if virtualbox is installed or not ..."
    if [[ $(which virtualbox) == $VIRTUALBOX_PATH ]]; then
       echo "Found virtualbox on the system ..."
       $HOMEBREW_PATH cask install minikube $STDOUT
    else
       echo "Could not find virtualbox on the system. Installing ..."
       $HOMEBREW_PATH cask install virtualbox $STDOUT
       echo "Starting to install Minikube ..."
       $HOMEBREW_PATH cask install minikube $STDOUT
    fi;
}

function install_homebrew() {
    echo "Starting to install Homebrew ..."
    $RUBY_PATH -e "$(curl -fsSL $HOMEBREW_INSTALL_PATH)" $STDOUT
}

function install_helm() {
    if [[ $helm_check == "yes" ]]; then
        echo "Starting to install Helm ..."
        $HOMEBREW_PATH install kubernetes-helm $STDOUT
    fi;
}

function install_kubeless() {
    if [[ $kubeless_check == "yes" ]]; then
        echo "Starting to install Kubeless ..."
        $HOMEBREW_PATH install kubeless $STDOUT
    fi;

}

function start_minikube() {
    echo "Starting to Minikube in background ..."
    $MINIKUBE_PATH start $STDOUT
}

function check_homebrew () {
    echo"Checking if homebrew is installed or not .."
    if [[ $(which brew) == $HOMEBREW_PATH ]]; then
       install_minikube
    else
       install_homebrew
       install_minikube
    fi;
}

function check_minikube ()  {
    echo "Starting Application ..."
    echo "Checking if minikube is installed or not ..."
    if [[ $(which minikube) == $MINIKUBE_PATH ]]; then
       echo "Minikube is already installed on the system."
    else
       echo "Minikube is not installed on the system. Installing ...."
       check_homebrew
    fi;
}

check_minikube
read -p 'Would you like to install Helm (type yes or no): ' helm_check
install_helm
read -p 'Would you like to install Kubeless (type yes or no): ' kubeless_check
install_kubeless
# start_minikube
echo "Thanks for running the script."