require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Lockfile do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ lockfile }).should.be.instance_of Command::Lockfile
      end
    end
  end
end

