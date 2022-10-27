require "cocoapods-lockfile/version"

module Pod
  class Command
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' command.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/command/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class Install < Command
      self.singleton_class.send(:alias_method, :original_options, :options)
      alias_method :original_initialize, :initialize
      alias_method :original_installer_for_config, :installer_for_config

      def self.options
        [
          ["--#{CocoapodsLockfile::FLAG_NAME}", "#{CocoapodsLockfile::FLAG_DESCRIPTION}"]
        ].concat(self.original_options)
      end

      def initialize(argv)
        original_initialize(argv)
        @generate_lockfile_only = argv.flag?("#{CocoapodsLockfile::FLAG_NAME}", false)
      end
      
      def installer_for_config
        installer = original_installer_for_config
        installer.generate_lockfile_only = @generate_lockfile_only
        installer
      end
    end
  end
end
