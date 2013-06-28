require 'spec_helper'

platforms = {
  :centos => ['6.4'],
  :debian => ['6.0.5'],
  :ubuntu => ['10.04', '12.04'],
}

platforms.each do |platform, versions|
  versions.each do |version|
    describe "On #{platform} (#{version})" do
      let(:chef_run) do
        ChefSpec::ChefRunner.new(platform: platform, version: version).converge('unsafe_umask::default')
      end

      it "creates /etc/login.defs from the template login.defs.erb" do
        # TODO: Check that the node attributes were set too.
        expect(chef_run).to create_file '/etc/login.defs'

        file = chef_run.template('/etc/login.defs')
        expect(file).to be_owned_by('root', 'root')
        expect(file.mode).to eq('644')
      end
    end
  end
end
