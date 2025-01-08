#!/bin/bash
#
# Determing the operating system configuration 
#
# Installing GIT and Python --------------------------

os=$(uname) 


if [ "$os" = "Linux" ]; then
	echo "This is a linux machine"
	if [ $pkg_manager="apt" ]; then
		sudo apt install git -y
		sudo apt install python-is-python3 -y 
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

		sudo apt-get install -y gcc build-essential curl pkg-config -y 
		# for the espup
		cargo install espup

		#setting the path
		. $HOME/export-esp.sh
		
		# setting the libudev - dev library . 
		# ready for the cargo install 
		sudo apt install pkg-config
		sudo apt-get install libudev-dev

		# cargo -- 
		cargo install cargo-generate
		cargo install ldproxy
		cargo install espup 
		cargo install espflash 
		cargo install cargo-espflash

		espup install
		. $HOME/export-esp.sh

		## cloning the website: 
		git clone https://github.com/Lifespark-Technologies/walk-rs.git
		cd walk-rs 
		rm -rf .embuild/
		cargo build

		# Esptool 
		sudo apt install esptool
		espefuse set_flash_voltage 3.3V

	fi 

else 
	echo "Unsupported OS"
	exit 1	
fi 

echo "Installed git , python, rustc"

chmod +x downloadDemo.sh 
