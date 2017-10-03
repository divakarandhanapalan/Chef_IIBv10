################################################################################
#
# Copyright (c) 2013 IBM Corporation and other Contributors
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#     IBM - initial implementation
#
################################################################################
# Definition IBM_Integration_Bus::iib_install_toolkit
# 
# Install IIB toolkit
#
################################################################################
define :iib_install_toolkit  do
  unpack_dir = "#{Chef::Config[:file_cache_path]}/iib_installer";
  username   = node['ibm_integration_bus']['account_username'];
  home = "/home/#{username}"
  #  
  # Install 32bit libraires because toolkit installer requires them
  #
  iib_install_32bit_libs;
  
	log "IBM Integration Toolkit install log can be found in the /var/ibm/InstallationManager/logs directory" do 
		level :info
	end
	
  # Run the toolkit silent installer
  execute "Run IBM Integration Bus toolkit installer" do
    user "root"
    cwd "#{unpack_dir}/iib-10.0.0.10"
    command "sudo ./iib accept license silently"
  end

 end