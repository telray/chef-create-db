# require 'openssl'
# md5 = OpenSSL::Digest::MD5.new
postgresql_connection_info = {
    host: '127.0.0.1',
    port: node['postgresql']['config']['port'],
    username: 'postgres',
    password: node['postgresql']['password']['postgres']
}

default["chef-create-db"]["postgresql"]["databases"].each do |opt|
  postgresql_database opt["name"] do
    connection postgresql_connection_info
    action :create
  end
end

default["chef-create-db"]["postgresql"]["users"].each do |opt|

  postgresql_database_user opt["name"] do
    connection    postgresql_connection_info
    password      opt["password"]
    action        :create
  end

  postgresql_database_user 'nortex' do
    connection    postgresql_connection_info
    database_name opt["db"]
    host          '%'
    privileges    [:all]
    action        :grant
  end

end



