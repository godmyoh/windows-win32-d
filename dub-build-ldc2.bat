pushd windows-win32
dub build --build=release --config=ldc2-release --force --compiler=ldc2
dub build --build=debug --config=ldc2-debug --force --compiler=ldc2
popd
pause
