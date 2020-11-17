# set up macos full disk encryption
sudo fdesetup enable
sudo pmset -a destroyfvkeyonstandby 1
sudo pmset -a hibernatemode 25

sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a standbydelay 0
sudo pmset -a autopoweroff 0

# setup firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# prevent software being whitelisted automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# set firmware password
sudo firmwarepasswd -setpasswd

# turnoff ipv6
sudo networksetup -setv6off "MiFi 6620L"

# turn bluetooth off
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0

# create local non-admin user
sudo dscl . -create /Users/quota
sudo dscl . -create /Users/quota UserShell /bin/bash
sudo dscl . -create /Users/quota RealName "Lucius Q. User"
sudo dscl . -create /Users/quota UniqueID "1010"
sudo dscl . -create /Users/quota PrimaryGroupID 80
sudo dscl . -create /Users/quota NFSHomeDirectory /Users/quota

sudo dscl . -read /Users/quota GeneratedUID
