@echo off
setlocal

rem Define the source paths for settings.json, keybindings.json, and snippets folder
set "source_settings=%cd%\settings.json"
set "source_keybindings=%cd%\keybindings.json"
set "source_snippets=%cd%\snippets"

rem Define the destination paths for settings.json, keybindings.json, and snippets folder
set "destination_settings=%APPDATA%\Code\User\settings.json"
set "destination_keybindings=%APPDATA%\Code\User\keybindings.json"
set "destination_snippets=%APPDATA%\Code\User\snippets"

rem Copy settings.json to its destination, replacing if it exists
copy /Y "%source_settings%" "%destination_settings%"

rem Copy keybindings.json to its destination, replacing if it exists
copy /Y "%source_keybindings%" "%destination_keybindings%"

rem Remove the existing snippets folder and its contents if it exists
rmdir /S /Q "%destination_snippets%"

rem Copy the snippets folder to its destination
xcopy /E /I /Q /Y "%source_snippets%" "%destination_snippets%"

rem Define the source and destination paths for the extensions folder
set "source_extensions=%cd%\extensions"
set "destination_extensions=%USERPROFILE%\.vscode\extensions"

rem Remove the existing extensions folder and its contents if it exists
rmdir /S /Q "%destination_extensions%"

rem Copy the extensions folder to its destination
xcopy /E /I /Q /Y "%source_extensions%" "%destination_extensions%"

echo settings.json, keybindings.json, snippets folder, and extensions folder copied to their respective destinations, replacing existing files and folders.
pause
