include_attribute "java"

default['jzmq']['url'] = "https://github.com/nathanmarz/jzmq/tarball/master"
default['jzmq']['java_home'] = node['java']['java_home']

default['java']['jdk_version'] = '7'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true
