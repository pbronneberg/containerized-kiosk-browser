# Containerized Kiosk Browser

Explorations on creating a kiosk device, based on an embedded browser
executed on a kubernetes based edge device.

## Expected user experience

A device will boot directly into the browser. The browser will show a landing page. From this page, 
the user can navigate a web environment using either touch, or keyboard/mouse interaction.
The webpages opened should support acceleration for advanced webpages or streaming.

In case of issues, the browser should restart automatically.

## Target environment

* Linux without graphical desktop environment (no X11 / XOrg preinstalled)
* K3s
* Nvidia GPU

## Technologies

* [Chromium Embedded (CEF)](https://github.com/chromiumembedded/cef): Fully featured chrome without windows & toolbars
* [I3 Window Manager](https://i3wm.org/): Simple, tiled X.Org Window Manager with single config-file configurability

_Note: CEF at this time does not fully support Wayland. Therefore, an X.Org based approach is chosen_

https://faq.i3wm.org/question/4637/solved-how-to-disable-all-default-keybinding.1.html