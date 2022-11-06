#install ruby 
bash 'rvm' do 
    code <<-EOH
    curl -sSL https://get.rvm.io | bash
    usermod -a -G rvm root
    source /etc/profile.d/rvm.sh
    rvm requirements
    rvm install ruby-2.7.6
    rvm use 2.7.6 --default  
    gem install rails
    gem install bundler --version "2.3.21"
EOH
end


#gem update --system "3.3.22"