@echo off
setlocal

rem Define the source paths for settings.json, keybindings.json, snippets folder, and the extensions folder
set "source_settings=%APPDATA%\Code\User\settings.json"
set "source_keybindings=%APPDATA%\Code\User\keybindings.json"
set "source_snippets=%APPDATA%\Code\User\snippets"
set "source_extensions=%USERPROFILE%\.vscode\extensions"

rem Copy the settings.json file to the current directory (replace if it exists)
copy /Y "%source_settings%" "%cd%"

rem Copy the keybindings.json file to the current directory (replace if it exists)
copy /Y "%source_keybindings%" "%cd%"

rem Copy the entire snippets folder (including subfolders and files) to the current directory (replace if it exists)
xcopy /E /I /Q /Y "%source_snippets%" "%cd%\snippets"

rem Copy the entire extensions folder (including its contents) to the current directory (replace if it exists)
xcopy /E /I /Q /Y "%source_extensions%" "%cd%\extensions"

echo Settings.json, keybindings.json, snippets folder, and extensions folder copied to the current directory, replacing existing files.
pause
