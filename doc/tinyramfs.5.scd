tinyramfs(5) "tinyramfs" "2022-05-09"

# NAME

tinyramfs - configuration file

# DESCRIPTION

A tinyramfs configuration file is written in POSIX sh. Configuration is done
via variable asignment (eg. *option=value*). Special characters and whitespace
must be quoted or escaped, more info: *sh*(1). By default tinyramfs looks to
*/etc/tinyramfs/config* for a configuration file.

# OPTIONS

Option marked with *(bool)* can hold a value of true or false. False if the
variable is unset or empty, true otherwise.

Some options only apply to certain hooks and have been categorized accordingly.

Options which expect a device as a value can also refer to the device via
*UUID*, *LABEL*, and *PARTUUID* (eg. LABEL=<label>). This requires a blkid
utility which supports that identifier.

root

	The device your root filesystem is located on.

hooks

	A comma separated list of hooks to include in the initramfs. Hooks can
	be found in /lib/tinyramfs/hook.d/.

monolith

	(bool) Instructs tinyramfs whether or not to include kernel modules in
	the initramfs.
	monolith should be set if you are cross-building the initramfs.

compress

	The utility to use for compressing the initramfs. The option accepts
	arbitrary commands (eg. 'gzip -9'). Use 'cat' for an uncompressed
	initramfs.

hostonly

	(bool) Whether or not to only copy modules specific to your system.

root_type

	The filesystem you're using for your root device (eg. ext4).

cross

	(bool) Instructs tinyramfs whether or not the created initramfs is for
	an architecture different from the host.

sysroot

	A fully-qualified path to some target-architecture sysroot.
	Only makes sense when setting cross=0.

arch_triplet

	The architecture triplet of the targeted architecture.
	Valid examples include:
		x86_64-linux-gnu
		aarch64-linux-gnu
		arm-linux-gnueabihf
		riscv64-linux-gnu
	A name can usually be found from gcc -dumpmachine on the target. 
	The name can also usually be found in /usr/lib of the target.
	Only makes sense when setting cross=0.
		
ldd

	The dynamic linker-loader of the targeted architecture.
	Valid examples include:
		ld-linux-x86-64.so.2
		ld-linux-aarch64.so.1
		ld-linux-armhf.so.3
		ld-linux-riscv64-lp64d.so.1
	A name can usually be found in /usr/lib/<arch_triplet>.
	Only makes sense when setting cross=0.

## KEYMAP

keymap_path

	Path to your keymap.

## LUKS

luks_discard

	(bool) Allow the use of discard (TRIM) requests for your luks device.

	*WARNING*: This option may have a negative security impact. For more info
	read *cryptsetup*(8).

luks_header

	Path to your LUKS header.

luks_root

	The device your LUKS volume is located on.

luks_name

	The name to map your LUKS device to.

luks_key

	Path to your LUKS keyfile.

## LVM

lvm_config

	Path to your LVM configuration file.

lvm_discard

	(bool) Allow the use of discard (TRIM) requests for your LVM device.

lvm_group

	The name of your LVM volume group.

lvm_name

	The name of your LVM logical volume.

lvm_tag

	The tag of your LVM logical volume.

## RESUME

resume

	The location of your swap partition.

## ZFS

zfs_key

	Path to your ZFS keyfile.

zfs_root

	The device your ZFS volume is located on.

# FILES

/lib/tinyramfs/hook.d/
	tinyramfs hooks

# SEE ALSO

*tinyramfs*(8)

# AUTHORS

tinyramfs by illiliti *https://github.com/illiliti*++
man page by fluorescent_haze *https://github.com/fluorescent-haze*
