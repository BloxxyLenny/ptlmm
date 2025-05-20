@ECHO OFF
:main

cd %USERPROFILE%\Music\

if not exist "PTLMM" (
	mkdir PTLMM
	echo [?] PTLMM Player Folder was not found. Creating it right now...
	echo [?] PTLMM Player Folder is located at %USERPROFILE%\Music\PTLMM. All .mp3 files should be stored there, otherwise they won't be detected!
	@timeout /t 5 /nobreak
)

cd PTLMM

goto draw

:draw
cls
echo =============== Prolly The Lightest Music Manager =============== 

echo.
echo ---MUSIC FILES---
dir *.mp3 /b
echo -----------------
echo.
echo Type "#ref" to refresh the music list.
echo Type "#exit" to close the program.
echo.

set /p ChosenSong=Choose a song to play: 

if "%ChosenSong%" == "#exit" (
	exit
)
else (
	if "%ChosenSong%" == "#ref" (
		goto draw
	)
	else (
		goto play
	)
)

:play
cls
echo "[?] Scanning for %ChosenSong%.mp3..."
@timeout /t 1 /nobreak
cls
if not exist "%ChosenSong%.mp3" (
	cls
	echo [!] No .mp3 file of given name exists [Target Filename: %ChosenSong%.mp3]
	pause
	goto draw
)
else (
	start /min %ChosenSong%.mp3
	goto draw
)