require 'spec_helper_acceptance'

describe 'example42_ssh' do
    context 'default parameters' do
        it 'should idempotently work with no errors' do
            pp = <<- EOS
            class {'example42_ssh': }
            EOS
            apply_manifest(pp, :catch_failures => true)
            apply_manifest(pp, :catch_changes => true)
        end
        describe package('openssh-client') do
            it { is_expected.to be_installed }
        end
        describe service('ssh') do
            it { is_expected.to be_enabled }
            it { is_expected.to be_running }
        end
    end
end

