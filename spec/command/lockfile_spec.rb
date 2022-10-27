require File.expand_path('../../spec_helper', __FILE__)
require 'cocoapods-lockfile/version.rb'

module Pod
  SPEC_PATH = "spec/pod_test"

  describe Command::Install do
    describe "CLAide" do
      it "is still an Install" do
        Command.parse(%w{ install }).should.be.instance_of Command::Install
      end
    end

    describe "Test --#{CocoapodsLockfile::FLAG_NAME} flag" do

      before do
        require "fileutils"
        FileUtils.rm_f("#{SPEC_PATH}/Podfile.lock")
        FileUtils.rm_rf("#{SPEC_PATH}/Pods")
        @install_command = Command.parse(%W{ install --project-directory=#{SPEC_PATH} --#{CocoapodsLockfile::FLAG_NAME} })
      end

      it "verifies that the flag is enabled" do
        @install_command.installer_for_config.generate_lockfile_only?.should.be.true
      end

      it "skips the pods download" do
        @install_command.run
        Dir.empty?("#{SPEC_PATH}/Pods/Headers").should.be.true
      end
    end
  end

  describe Command::Update do
    describe "CLAide" do
      it "is still an Update" do
        Command.parse(%w{ update }).should.be.instance_of Command::Update
      end
    end

    describe "Test --#{CocoapodsLockfile::FLAG_NAME} flag" do

      before do
        require "fileutils"
        FileUtils.rm_f("#{SPEC_PATH}/Podfile.lock")
        FileUtils.rm_rf("#{SPEC_PATH}/Pods")
        @update_command = Command.parse(%W{ update --project-directory=#{SPEC_PATH} --#{CocoapodsLockfile::FLAG_NAME} --no-repo-update })
      end

      it "verifies that the flag is enabled" do
        @update_command.installer_for_config.generate_lockfile_only?.should.be.true
      end

      it "skips the pods download" do
        @update_command.run
        Dir.empty?("#{SPEC_PATH}/Pods/Headers").should.be.true
      end
    end
  end
end
