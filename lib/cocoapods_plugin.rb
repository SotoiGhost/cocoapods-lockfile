require 'cocoapods-lockfile/command'
require 'cocoapods-lockfile/version'

module Pod
    class Installer
        attr_accessor :generate_lockfile_only
        alias_method :generate_lockfile_only?, :generate_lockfile_only
        
        alias_method :original_install!, :install!

        def install!
            if generate_lockfile_only?
                UI.section "Skipping the download of the dependencies due to --#{CocoapodsLockfile::FLAG_NAME} was passed".yellow
                prepare
                resolve_dependencies
                write_lockfiles
                return
            end

            original_install!
        end
    end
end
