if node[:rails][:db_type] == "mysql"
  include_recipe "rails::mysql"
else
  raise "A valid db_type should be selected"
end
