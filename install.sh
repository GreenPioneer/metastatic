sudo apt update
sudo apt upgrade

sudo apt install libgpiod-dev libyaml-cpp-dev libbluetooth-dev openssl libssl-dev libulfius-dev liborcania-dev libulfius2.7

wget https://github.com/meshtastic/firmware/releases/download/v2.5.18.89ebafc/meshtasticd_2.5.18.89ebafc_arm64.deb

sudo raspi-config nonint set_config_var dtparam=spi on /boot/firmware/config.txt

sudo raspi-config nonint set_config_var dtparam=i2c_arm on /boot/firmware/config.txt

sudo sed -i -e '/^\s*#\?\s*dtoverlay\s*=\s*vc4-kms-v3d/! s/^\s*#\?\s*(dtoverlay|dtparam\s*=\s*uart0)\s*=.*/dtoverlay=spi0-0cs/' /boot/firmware/config.txt

if ! sudo grep -q '^\s*dtoverlay=spi0-0cs' /boot/firmware/config.txt; then
    sudo sed -i '/^\s*dtparam=spi=on/a dtoverlay=spi0-0cs' /boot/firmware/config.txt
fi

sudo raspi-config nonint do_serial_hw 0

sudo raspi-config nonint do_serial_cons 1

sudo reboot

sudo apt install ./meshtasticd_2.5.18.89ebafc_arm64.deb


