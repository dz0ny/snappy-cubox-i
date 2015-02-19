# Snappy for Cubox-i and Hummingboard

## Steps(on Ubuntu vivid)

1. Install build dependences

```
bash build_dep.sh
```

2. Build kernel and u-boot

```
bash bake.sh
```

3. Create image

```
sudo ubuntu-device-flash core \
    -o cubox-snappy.img \
    --size 4 \
    --channel ubuntu-core/devel \
    --device generic_armhf \
    --platform cubox-i \
    --enable-ssh \
    --device-part=./device.tar.xz
```
