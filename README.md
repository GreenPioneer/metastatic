# metastatic


links
* [Native Install](https://meshtastic.org/docs/hardware/devices/linux-native-hardware/#installing-meshtasticd)
* [The Meshtastic CRC Problem](https://www.youtube.com/watch?v=PND1GlMSrEM)




Follow install then

```shell
sudo nano /etc/meshtasticd/config.yaml

(file is space sensitive - leave alone)
# Uncomment sx1262 lines
# Uncomment serial path line for gps
##Change required loglevel setting to "debug"
# Uncomment webserver lines

sudo systemctl enable meshtasticd --now

journalctl -u meshtasticd -f           (to monitor debug info)

# point webbrowser to url of pi:    https://raspi
# (ip address doesn't work - you must use the hostname)

```
