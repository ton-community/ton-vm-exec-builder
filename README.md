# ton-vm-exec-builder

Run the following commands to build `vm-exec`

```
git clone https://github.com/ton-community/ton-vm-exec-builder
cd ton-vm-exec-builder
git clone --depth=1 --branch vm-exec https://github.com/ton-community/ton-blockchain ton
./build.sh
```

The process will take a while (not less than 10 minutes usually), once it exits you can check the `output` folder.

## Building the docker image

The `build.sh` script uses the docker image `krigga/ton-vm-exec-builder`, which is built using files from the `builder` folder by `image.sh` script.
To build it yourself, run the following commands

```
git clone https://github.com/ton-community/ton-vm-exec-builder
cd ton-vm-exec-builder
./image.sh
```
