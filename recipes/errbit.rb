package ['python','git','nodejs'] 
#from git
git '/errbit_from_git' do 
    repository 'https://github.com/errbit/errbit.git'
    action :sync
end

bash 'chmod_gems' do 
    code <<-EOH
    cd /usr/local/rvm 
    sudo chmod -R ugo+x gems
    cd /errbit
    EOH
end

bash 'mongod' do 
    code <<-EOF
        sudo service mongod start
        EOF
end

bash 'errbitStart' do
   code <<-EOF
    cd /errbit_from_git
    export PATH="/usr/local/rvm/rubies/ruby-2.7.6/bin:$PATH"
    bundle install
    bundle exec rake errbit:bootstrap
    bundle exec rails server  
EOF
end

