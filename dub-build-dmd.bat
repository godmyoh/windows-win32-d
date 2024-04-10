pushd windows-win32
dub build --build=release --config=dmd-release --force --compiler=dmd
dub build --build=debug --config=dmd-debug --force --compiler=dmd
popd
pause
