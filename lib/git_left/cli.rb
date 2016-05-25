require "thor"
require "git"

module GitLeft
  class CLI < Thor
    desc "begin", "Begin swiping left"
    def begin(opts = {})
      puts "Time to clean up your #{GitLeft::Branches.branches.count} local branches..."

      while(1) do
        random_branch = GitLeft::Branches.random_branch

        if random_branch.nil?
          puts "\nYou cleaned up all your branches!"
          puts "\t#{GitLeft::Branches.skipped_branches.count} skipped"
          puts "\t#{GitLeft::Branches.deleted_branches.count} deleted"
          break
        end

        underlined = "\e[4m" << random_branch.name << "\e[24m"
        puts "\nDeciding time: #{underlined} (h to delete, l to skip, anything else to quit)\n"

        case GitLeft::KeyParser.new(STDIN.getch).action
        when :delete
          GitLeft::Branches.delete(random_branch)
          puts "#{random_branch.name} deleted"
          next
        when :skip
          GitLeft::Branches.skip(random_branch)
          puts "#{random_branch.name} skipped"
          next
        when :quit
          puts "See ya!"
          break
        end
      end
    end
  end
end
