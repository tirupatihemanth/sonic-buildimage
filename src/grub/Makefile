.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS += -e

MAIN_TARGET = $(GRUB2_COMMON)
DERIVED_TARGETS = $(GRUB_COMMON) $(GRUB_EFI_META) $(GRUB_EFI_ARCH) $(GRUB_EFI_ARCH_BIN) $(GRUB_EFI_ARCH_UNSIGNED) $(GRUB_PC_BIN)

$(addprefix $(DEST)/, $(MAIN_TARGET)): $(DEST)/% :
	# Remove any stale files
	rm -rf ./grub2-$(GRUB2_VERSION_BASE)*

	# Get grub2 release
	dget https://deb.debian.org/debian/pool/main/g/grub2/grub2_$(GRUB2_VERSION).dsc
	pushd ./grub2-$(GRUB2_VERSION_BASE)

	git init
	git add -f *
	git commit -m "unmodified grub2 source"

	# Apply patches
	stg init
	stg import -s ../patch/series

	# Build source and Debian packages
ifeq ($(CROSS_BUILD_ENVIRON), y)
	dpkg-buildpackage -rfakeroot -b -us -uc -a$(CONFIGURED_ARCH) -Pcross,nocheck -j$(SONIC_CONFIG_MAKE_JOBS)  --admindir $(SONIC_DPKG_ADMINDIR)
else
	dpkg-buildpackage -rfakeroot -b -us -uc -j$(SONIC_CONFIG_MAKE_JOBS) --admindir $(SONIC_DPKG_ADMINDIR)
endif
	popd

	# Move ALL the newly-built .deb packages to the destination directory
	mv $(DERIVED_TARGETS) $(MAIN_TARGET) $(DEST)/
