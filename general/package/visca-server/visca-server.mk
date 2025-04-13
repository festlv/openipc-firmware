################################################################################
#
# visca-server
#
################################################################################

VISCA_SERVER_VERSION = main
VISCA_SERVER_SITE = https://github.com/festlv/visca-server
VISCA_SERVER_SITE_METHOD = git
VISCA_SERVER_GIT_SUBMODULES = YES

#VISCA_SERVER_SITE = $(call github,festlv,visca-server,$(VISCA_SERVER_VERSION))
#VISCA_SERVER_VERSION = main

VISCA_SERVER_LICENSE = MIT
VISCA_SERVER_LICENSE_FILES = LICENSE
VISCA_SERVER_INSTALL_STAGING = YES

VISCA_SERVER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
VISCA_SERVER_MAKE_OPTS += VERBOSE=1

define VISCA_SERVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/visca_server
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 755 -t $(TARGET_DIR)/etc/init.d $(VISCA_SERVER_PKGDIR)/files/S99visca

endef

$(eval $(cmake-package))
