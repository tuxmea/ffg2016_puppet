require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
    proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    c.formatter = :documentatoin
    c.before :suite do
        puppet_module_install(
            :source => proj_root,
            :module_name => 'exmaple42_ssh'
        )
        hosts.each do |host|
            on host,
                puppet('module', 'install', 'puppetlabs-stdlib'),
                { :acceptable_exit_codes => [0,1] }
        end
    end
end
