include_attribute "java"

default['jzmq']['url'] = "https://github.com/nathanmarz/jzmq/tarball/master"
default['jzmq']['java_home'] = node['java']['java_home']
override['java']['jdk_version'] = '7'
override['java']['install_flavor'] = 'oracle'
override['java']['oracle']['accept_oracle_download_terms'] = true
