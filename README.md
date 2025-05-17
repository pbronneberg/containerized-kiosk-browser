# Containerized Kiosk Browser

Explorations on creating a kiosk device, based on an embedded browser
executed on a kubernetes based edge device.

## Expected user experience

A device will boot directly into the browser. The browser will show a landing page. From this page, 
the user can navigate a web environment using either touch, or keyboard/mouse interaction.
The webpages opened should support acceleration for advanced webpages or streaming.

In case of issues, the browser should restart automatically.

## Target environment

* Linux without graphical desktop environment (no X11 / XOrg)
* K3s
* Nvidia GPU

## Technologies

* [Cage wayland compositor](https://github.com/cage-kiosk/cage): Create a Kiosk to run a single application
* [Chromium Embedded](https://github.com/chromiumembedded/cef): Fully featured chrome without windows & toolbars
