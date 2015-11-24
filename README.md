#Vagrant Ruby Development

wget https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz

yum install make gcc gcc-c++ -y
tar -xvzf ruby-2.2.3.tar.gz
cd ruby-2.2.3
./configure
make
make install

wget https://rubygems.org/rubygems/rubygems-2.5.0.tgz
tar -xvzf rubygems-2.5.0.tgz
ruby setup.rb


yum install ruby rubygems -y
yum install nodejs
gem install jekyll


severspec
gem install rake
gem install serverspec
serverspec-init
rake spec
