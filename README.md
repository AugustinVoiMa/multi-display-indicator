# multi-display-indicator
A simple indicator to switch between display configurations (mainly for mono/dual screen to extend desktop quickly)

## Compatibility
- Unix Systems
- xdg required for autostart at desktop session opening

## Dependancies
- gir1.2-appindicator3-0.1

## Installation
` git clone https://github.com/AugustinVoiMa/multi-display-indicator.git`  
`cd multi-display-indicator`  
`make`  
You will be asked to configure display modes.  
A dialog will be prompt, you can do basic configuration with.  
It will print a list of connected screens.  
Default configuration is to let current main screen and add the second display for dual-screen mode.
If you want to keep this configuration, you can type Enter. In other cases, simply enter the display identifier you want.

Then, `commands` file will be generated.  
For advanced configuration, just edit this file.
There is one command by line:  
`Label || <command>`  
The Label will be displayed in the indicator while the command is to be executed when selecting the label.
You can add several new lines.   
This indicator can thus be used for any other purpose than multi display management.

`sudo make install` will install the indicator in `/usr/local/share`
and a desktop entry will be added in `/etc/xdg/autostart`
