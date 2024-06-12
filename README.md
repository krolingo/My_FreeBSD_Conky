<p align="center"><img width="300" src="../data/logo/conky-logotype-horizontal-violet.png"></p>

## My FreeBSD Conky Setup

### My desktop view

<p align="center"><img width="1900" src="../data/configs/full_config.png"></p>

### The full configuration, organized in folders

![Dolphin Screenshot](../data/tee/folders_screen_large.png)


**Launcher**

![](../data/launcher/menu_bar.png)

![](../data/launcher/icon/preferences-desktop-text-to-speech.png)
Menu bar face icon used to call ~/bin/__openbox_restart_system_monitor.sh

![](../data/launcher/icon/preferences-desktop-text-to-speech.png)
Menu bar face icon now calls ~.config/conky/organized/__conky_restart_system_dashboard.sh

**F9 - toggle kills it**

F9 script kills all that is running and toggle again launches the Vermaden Dashboard.

***
**Conky Scripts**


✳ [conky_beastie](conky_beastie/README.md)

✳ [conky_moon](conky_moon/README.md)

✳ [conky_moon_phase](conky_moon_phase/README.md)

✳ [conky_openweather](conky_openweather/README.md)

✳ [conky_ping](conky_ping/README.md)

✳ [conky_wpa0](conky_wpa0/README.md)


**Launch Scripts**

+ [restart dashboard](__conky_restart_system_dashboard.sh)
+ [toggle on/off](__conky_toggle.sh)

### Compile Conky

In order for conky to render images and display emojis, it has to be recompiled with additional options enabled.

screen:

![](../data/conky/compile_screen.png)

- [X] - IMLIB2 : Imlib 2 image library support
- [X] - LUA_IMLIB2 : Lua-Imlib2 binding