src_filepath  = "/tmp/jzmq.tar.gz"
remote_file src_filepath do 
  source node['jzmq']['url']
  action :create_if_missing
end

bash "untar jzmq" do
  code %(tar zxf #{src_filepath} -C /tmp)
end

package "pkg-config" do
  action :install
end

package "libtool" do
  action :install
end

package "automake" do
  action :install
end

package "autoconf" do
  action :install
end

package "make" do 
  action :install
end

include_recipe 'java::set_attributes_from_version'
java_home = node['java']['java_home']

bash "build package" do
  cwd "/tmp/nathanmarz-jzmq-dd3327d"
  environment 'JAVA_HOME' => "#{java_home}"
  code <<-EOH
    ./autogen.sh && ./configure --with-zeromq=/usr/local/lib
    touch src/classdist_noinst.stamp
    cd src/
    CLASSPATH=.:./.:$CLASSPATH javac -d . org/zeromq/ZMQ.java org/zeromq/App.java org/zeromq/ZMQForwarder.java org/zeromq/EmbeddedLibraryTools.java org/zeromq/ZMQQueue.java org/zeromq/ZMQStreamer.java org/zeromq/ZMQException.java
    cd ..
    make
    make install
  EOH
  not_if {File.exists?("/usr/local/lib/libjzmq.so")}
end
