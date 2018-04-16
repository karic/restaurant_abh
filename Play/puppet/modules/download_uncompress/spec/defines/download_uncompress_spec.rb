require 'spec_helper'

describe 'download_uncompress' do

  let(:title) { 'install_mysoftware' }

  context 'with uncompress => zip' do
    let(:params) { {
     :download_base_url => 'http://www.myswdistributions.com',
     :distribution_name => 'path/to/mysoftware.zip',
     :dest_folder       => '/opt',
     :creates           => '/opt/destfolder',
     :uncompress        => 'zip'
   } }

    it { should contain_exec('download_uncompress_http://www.myswdistributions.com/path/to/mysoftware.zip-/opt').with({
      'creates' => '/opt/destfolder',
      'command' => 'wget -P /tmp/ http://www.myswdistributions.com/path/to/mysoftware.zip -O /tmp/mysoftware.zip && mkdir -p /opt && unzip /tmp/mysoftware.zip -d /opt'
    })}
  end

  context 'with uncompress => tar.gz' do
    let(:params) { {
     :download_base_url => 'http://www.myswdistributions.com',
     :distribution_name => 'path/to/mysoftware.tar.gz',
     :dest_folder       => '/opt',
     :creates           => '/opt/destfolder',
     :uncompress        => 'tar.gz'
   } }

    it { should contain_exec('download_uncompress_http://www.myswdistributions.com/path/to/mysoftware.tar.gz-/opt').with({
      'creates' => '/opt/destfolder',
      'command' => 'wget -P /tmp/ http://www.myswdistributions.com/path/to/mysoftware.tar.gz -O /tmp/mysoftware.tar.gz && mkdir -p /opt && tar xzf /tmp/mysoftware.tar.gz -C /opt'
    })}
  end

  context 'with uncompress => false (default)' do
    let(:params) { {
     :download_base_url => 'http://www.myswdistributions.com',
     :distribution_name => 'path/to/mysoftware',
     :dest_folder       => '/opt',
     :creates           => '/opt/destfolder'
   } }

    it { should contain_exec('download_uncompress_http://www.myswdistributions.com/path/to/mysoftware-/opt').with({
      'creates' => '/opt/destfolder',
      'command' => 'wget -P /opt http://www.myswdistributions.com/path/to/mysoftware'
    })}
  end

  context 'with distribution_name => http://mysoftwaredistributionurl' do
    let(:params) { {
     :download_base_url => 'http://www.myswdistributions.com',
     :distribution_name => 'http://mysoftwaredistributionurl',
     :dest_folder       => '/opt',
     :creates           => '/opt/destfolder'
   } }

    it { should contain_exec('download_uncompress_http://mysoftwaredistributionurl-/opt').with({
      'creates' => '/opt/destfolder',
      'command' => 'wget -P /opt http://mysoftwaredistributionurl'
    })}
  end

  context 'with distribution_name => path/to/mysoftware and no download_base_url defined' do
    let(:params) { {
     :distribution_name => 'path/to/mysoftware',
     :dest_folder       => '/opt',
     :creates           => '/opt/destfolder'
   } }

    it do 
      expect { 
        should contain_exec('download_uncompress_http://mysoftwaredistributionurl-/opt')
      }.to raise_error(Puppet::Error, /No download_base_url specified/)
    end
  end

end

