npm --version || { echo "ERROR: NPM required for installation" && exit 1; }
yarn --version || { echo "ERROR: Crew Mates require yarn" && exit 1; }
tar --version || { echo "ERROR: Tar required for installation" && exit 1; }
curl --version || { echo "ERROR: Crew Mates require curl" && exit 1; }
jq --version || { echo "ERROR: Crew Mates require jq" && exit 1; }
openssl version || { echo "ERROR: Crew Mates require openssl" && exit 1; }
which bundle-deps 2>/dev/null || npm install -g bundle-deps

cd /tmp \
&& npm --registry=https://npm.pkg.github.com pack @GreenCubeIO/crew-mates@latest \
&& sudo tar --exclude=package/package.json --strip-components=1 -xzf GreenCubeIO-crew-mates-*.tgz --directory "/" \
&& mkdir -p ~/.config/crew-mates \
&& tar --strip-components=1 -xzf GreenCubeIO-crew-mates-*.tgz --directory ~/.config/crew-mates/ package/package.json

if [ "$?" != "0" ]; then
  exit 1
fi

rm -f GreenCubeIO-crew-mates-*.tgz

echo "🎉 Crew Mates have installed successfully!"
