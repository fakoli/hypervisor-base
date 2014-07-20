
#default configuration for libvirtd.conf
default[:libvirtd][:listen_tcp] = "1"
default[:libvirtd][:auth_tcp] = "none"
default[:libvirtd][:listen_tls] = "0"

#default configurations for /sysconfig/libvirtd
default[:libvirtd][:LIBVIRT_ARGS] = "--listen"

