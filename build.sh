set -e

docker run --rm -v $(pwd)/output:/output -v $(pwd)/ton:/build/ton krigga/ton-vm-exec-builder:v1
echo -n "module.exports = { VmExecWasm: '" > output/vm-exec-wasm.js
cat output/vm-exec.wasm | base64 --wrap=0 >> output/vm-exec-wasm.js
echo -n "' };" >> output/vm-exec-wasm.js
echo check the output folder if there were no errors indicated above