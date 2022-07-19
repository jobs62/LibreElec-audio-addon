# LibreElec-audio-addon

Collection of packages to deal with some anyence with audio on my libreelev setup.

```sh
systemctl set-environment LADSPA_PATH=$LADSPA_PATH:"/storage/.kodi/addons/service.system.ladspa/lib/ladspa/"    
systemctl daemon-restart
systemctl restart pulseaudio.service
pactl load-module module-alsa-sink device=plughw:2,0 tsched=0
pactl load-module module-ladspa-sink sink_name=compressor plugin=sc4m_1916 label=sc4�m control=1,1.5,401,-30,20,5,12
pactl set-default-sink compressor
```
