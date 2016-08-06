To change the default location where screen shots are saved when you take them by pressing cmd+shift+3 or cmd+shift+4

`defaults write com.apple.screencapture location /Users/sumittada/Desktop/Screenshots/`

`killall SystemUIServer`

Note: do **NOT** use sudo, as this is a user specific preference, or it won't have effect for your user.
