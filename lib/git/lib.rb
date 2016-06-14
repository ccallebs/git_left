require 'git'

module OverrideConfigList
  def config_list
    build_list = lambda do |path|
      parse_config_list command_lines('config', ['--list'])
    end

    @config_list ||= begin
      if @git_dir
        Dir.chdir(@git_dir, &build_list)
      else
        build_list.call
      end
    end
  end  
end

class Git::Lib
  prepend OverrideConfigList
end
