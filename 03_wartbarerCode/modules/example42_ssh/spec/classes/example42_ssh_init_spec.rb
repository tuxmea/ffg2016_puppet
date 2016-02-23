require 'spec_helper'

describe 'example42_ssh' do
    context 'supported os' do
        on_supported_os.each do |os, facts|
            context "on #{os}" do
                let(:facts) do
                    facts
                end
                context 'example42_ssh ohne parameter' do
                    it { is_expected.to compile.with_all_deps }
                    it { is_expected.to contain_class('example42_ssh::params') }
                end
            end
        end
    end
    context 'unsupported os' do
        describe 'example42_ssh auf Nexenta' do
            let(:facts) do
                {
                :operatingsystem => 'Nexenta',
                }
            end
            it { expect { is_expected.to contain_class('example42_ssh') }.to raise_error(Puppet::Error, /Das System wird nicht unterstuetzt./) }
        end
    end
end
