#############################################################
#
# gt
#
#############################################################

GT_SITE = https://github.com/kopasiak/gt/archive
GT_SOURCE = master.zip
GT_LICENSE = Apache-2.0
GT_LICENSE_FILES = LICENSE
GT_DEPENDENCIES = libusbgx

define GT_EXTRACT_CMDS
	$(UNZIP) -o -d $(@D) $(DL_DIR)/gt/$(GT_SOURCE)
	cp -r $(@D)/gt-master/source/* $(@D)
	$(RM) -r $(@D)/gt-master

	# Skip compiling the man pages.
	sed -i.bak -E 's/^(ADD_SUBDIRECTORY\(manpages\))/# \1/' $(@D)/CMakeLists.txt
endef

define GT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/gt $(TARGET_DIR)/sbin/gt
endef

$(eval $(cmake-package))
