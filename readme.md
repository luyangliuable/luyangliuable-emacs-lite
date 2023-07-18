# Emacs Lite Configuration

This is a lightweight Emacs configuration that provides essential functionality with a minimal setup. It includes packages for Evil mode, Treemacs, Which Key, and some custom keybindings.

This editor is as lightweight and minimalistic as possible by sticking as close to the orignal emacs while providing maximum utility.

It is:
* highly customizable
* highly efficient


## Installation
Make sure you have Emacs installed on your system.

Clone this repository to your preferred location:

```
$ git clone https://github.com/your-username/emacs-lite.git
Copy the provided configuration code to your Emacs configuration file. The configuration file is typically located at ~/.emacs or ~/.emacs.d/init.el.
```

Open Emacs, and the configuration will be applied automatically.

## Features
Evil mode: Enables Vim-like keybindings in Emacs.

Treemacs: Provides a file tree explorer for easy navigation.

Which Key: Displays available keybindings in a popup.

## Custom Keybindings:

<leader> f: Key prefix for file-related commands.
<leader> f t: Toggle Treemacs.
<leader> TAB: Switch to the previous buffer.
<leader> w V: Split window vertically.
<leader> w l: Move cursor to the window on the right.
<leader> w h: Move cursor to the window on the left.
<leader> w k: Move cursor to the window above.
<leader> w j: Move cursor to the window below.
Custom Functions
switch-to-previous-buffer: Switch to the previous buffer and set the current buffer as the "other buffer".
split-window-right: Split the selected window into two side-by-side windows.
Contributing
Contributions to this Emacs Lite configuration are welcome! If you have any improvements, bug fixes, or additional features to suggest, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License.


## Roadmap
  * [ ] Set up shell
  * [ ] Optimise editor speed
  * [ ] Set up magit
  * [ ] Set up modeline
  * [ ] Add more packages
  * [ ] Setup metasploit
  * [ ] Add own packages

You can customize this README template as per your requirements, adding additional sections or information if needed.
