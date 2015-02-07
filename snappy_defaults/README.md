# Device part

This device part has 3 components:

- system: the system part, lands on the system partition, this is
          where you would generally layout the kernel modules.
- assets: this holds one or many kernels, initrds, and/ir dtbs.
- hardware.yaml: a definition of what each asset is and which one to pick.
                 Some entries can be OEM overriden in the *oem part*. 
                 Aside from that it determines the partition layout and
                 the bootloader technology.

# Custom or proprietary solutions for booting

If a custom or proprietary solution is seeked that does not use u-boot
or grub, set the bootloader to custom and the device part can be
provisioned with items in a *boot* directory which will layout the files
in the boot partition.
