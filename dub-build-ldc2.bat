cd windows-win32
dub build --build=release --config=release --force --compiler=ldc2
dub build --build=debug --config=debug --force --compiler=ldc2
pause
