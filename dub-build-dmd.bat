cd windows-win32
dub build --build=release --config=release --force --compiler=dmd
dub build --build=debug --config=debug --force --compiler=dmd
pause
