# grub2 package

GRUB2_VERSION = 2.12-9
GRUB2_VERSION_BASE = 2.12
export GRUB2_VERSION_BASE
export GRUB2_VERSION

# Debian source builds multiple binary packages; export the key ones we consume
# Pick one as the MAIN package - let's use GRUB2_COMMON
GRUB2_COMMON          = grub2-common_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(GRUB2_COMMON)_SRC_PATH = $(SRC_PATH)/grub
SONIC_MAKE_DEBS += $(GRUB2_COMMON)

# All others are DERIVED packages (built by the same dpkg-buildpackage)
# Use add_derived_package to properly register them with the build system
GRUB_COMMON           = grub-common_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_COMMON)))

GRUB_EFI_META         = grub-efi_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_EFI_META)))

GRUB_EFI_ARCH         = grub-efi-$(CONFIGURED_ARCH)_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_EFI_ARCH)))

GRUB_EFI_ARCH_BIN     = grub-efi-$(CONFIGURED_ARCH)-bin_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_EFI_ARCH_BIN)))

GRUB_EFI_ARCH_UNSIGNED= grub-efi-$(CONFIGURED_ARCH)-unsigned_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_EFI_ARCH_UNSIGNED)))

## BIOS tools for x86 (only for amd64 builds)
ifeq ($(CONFIGURED_ARCH),amd64)
GRUB_PC_BIN           = grub-pc-bin_$(GRUB2_VERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(GRUB2_COMMON),$(GRUB_PC_BIN)))
endif

# Export all packages for use in build_debian.sh and src/grub/Makefile
GRUB_DEBS = $(GRUB2_COMMON) $(GRUB_COMMON) $(GRUB_EFI_META) $(GRUB_EFI_ARCH) $(GRUB_EFI_ARCH_BIN) $(GRUB_EFI_ARCH_UNSIGNED) $(GRUB_PC_BIN)
export GRUB_DEBS
export GRUB2_COMMON GRUB_COMMON GRUB_EFI_META GRUB_EFI_ARCH GRUB_EFI_ARCH_BIN GRUB_EFI_ARCH_UNSIGNED GRUB_PC_BIN


