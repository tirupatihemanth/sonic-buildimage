
ARP_UPDATE_SCRIPT = arp_update
$(ARP_UPDATE_SCRIPT)_PATH = files/scripts

ARP_UPDATE_VARS_TEMPLATE = arp_update_vars.j2
$(ARP_UPDATE_VARS_TEMPLATE)_PATH = files/build_templates

CONFIGDB_LOAD_SCRIPT = configdb-load.sh
$(CONFIGDB_LOAD_SCRIPT)_PATH = files/scripts

BUFFERS_CONFIG_TEMPLATE = buffers_config.j2
$(BUFFERS_CONFIG_TEMPLATE)_PATH = files/build_templates

QOS_CONFIG_TEMPLATE = qos_config.j2
$(QOS_CONFIG_TEMPLATE)_PATH = files/build_templates

CBF_CONFIG_TEMPLATE = cbf_config.j2
$(CBF_CONFIG_TEMPLATE)_PATH = files/build_templates

SYSCTL_NET_CONFIG = 90-sonic.conf
$(SYSCTL_NET_CONFIG)_PATH = files/image_config/sysctl

UPDATE_CHASSISDB_CONFIG_SCRIPT = update_chassisdb_config
$(UPDATE_CHASSISDB_CONFIG_SCRIPT)_PATH = files/scripts

SWSS_VARS_TEMPLATE = swss_vars.j2
$(SWSS_VARS_TEMPLATE)_PATH = files/build_templates

COPP_CONFIG_TEMPLATE = copp_cfg.j2
$(COPP_CONFIG_TEMPLATE)_PATH = files/image_config/copp

RSYSLOG_PLUGIN_CONF_J2 = rsyslog_plugin.conf.j2
$(RSYSLOG_PLUGIN_CONF_J2)_PATH = files/build_templates

GITHUB_GET = github_get.py
$(GITHUB_GET)_PATH = scripts

SONIC_COPY_FILES += $(CONFIGDB_LOAD_SCRIPT) \
                    $(ARP_UPDATE_SCRIPT) \
                    $(ARP_UPDATE_VARS_TEMPLATE) \
                    $(BUFFERS_CONFIG_TEMPLATE) \
                    $(QOS_CONFIG_TEMPLATE) \
                    $(CBF_CONFIG_TEMPLATE) \
                    $(SYSCTL_NET_CONFIG) \
                    $(UPDATE_CHASSISDB_CONFIG_SCRIPT) \
                    $(SWSS_VARS_TEMPLATE) \
                    $(RSYSLOG_PLUGIN_CONF_J2) \
                    $(GITHUB_GET) \
                    $(COPP_CONFIG_TEMPLATE)
