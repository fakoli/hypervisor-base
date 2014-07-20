package "python-virtinst"
package "tuned"

execute "tuned" do
	command "tuned-adm profile virtual-host"
	action :run
end

execute "virt_install" do
	command "yum groupinstall -y 'Virtualization' 'Virtualization Platform' "
	action :run
end

execute "virt_tools" do
	command "yum groupinstall -y 'Virtualization Tools' "
	action :run
end

service "libvirtd" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

template "/etc/libvirt/libvirt.conf" do
	source "libvirt.conf.erb"
	owner "root"
	group "root"
	mode 00644
end

template "/etc/libvirt/libvirtd.conf" do
	source "libvirtd.conf.erb"
	owner "root"
	group "root"
	mode 00644
end

template "/etc/libvirt/qemu.conf" do
	source "qemu.conf.erb"
	owner "root"
	group "root"
	mode 00644
end

template "/etc/sysconfig/libvirtd" do
	source "libvirtd.erb"
	owner "root"
	group "root"
	mode 00644
end

directory "/var/lib/libvirt/images" do
	owner "root"
	group "root"
	mode 00755
	action :create
end

