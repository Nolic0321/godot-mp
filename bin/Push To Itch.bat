del "windows\zip\Game.zip"
REM del "windows\zip\Wandering Nomads(x64).zip"
REM powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('windows\64 bit', 'windows\zip\Wandering Nomads(x64).zip'); }"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('windows', 'windows\zip\Game.zip'); }"
REM godot --export "Windows Desktop" "windows\Wandering Nomads"
butler push "windows\zip\Game.zip" nolic0321/viewer-game:windows
REM butler push "windows\zip\Wandering Nomads(x64).zip" nolic0321/wandering-nomads:windows-x64
REM butler push "windows\zip\Wandering Nomads.zip" nolic0321/wandering-nomads:IGMC-Entry
REM butler push "windows\zip\Wandering Nomads(x64).zip" nolic0321/wandering-nomads:IGMC-Entry-x64
REM butler push "windows\zip\Wandering Nomads.zip" nolic0321/wandering-nomads:IGMC2018-Final
REM butler push "H:\dev\LAOH\bin\OSX" nolic0321/lost-age-of-heros:OSX
REM butler push "H:\Game Dev\dev\Wandering Nomads\bin\linux" nolic0321/wandering-nomads:linux
pause