require "thor"
require "git"

module GitLeft
  class CLI < Thor
    desc "begin", "Begin swiping left"
    def begin(opts = {})
      puts "Before we begin, prune remote branches? (y/n)"
      if STDIN.getch == 'y'
        puts "Pruning remote branches..."
        `git remote prune origin`
      end

      puts "Okay, time to clean up your #{GitLeft::Branches.branches.count} local branches..."

      while(1) do
        begin
          @random_branch = GitLeft::Branches.random_branch

          if @random_branch.nil?
            puts "\nYou cleaned up all your branches!"
            break
          end

          @reporter = GitLeft::BranchReporter.new(@random_branch)
          @reporter.report

          case GitLeft::KeyParser.new(STDIN.getch).action
          when :delete
            GitLeft::Branches.delete(@random_branch)
            puts "#{@random_branch.name} deleted"
            next
          when :skip
            GitLeft::Branches.skip(@random_branch)
            puts "#{@random_branch.name} skipped"
            next
          when :quit
            puts "See ya!"
            break
          end
        rescue
          puts "A problem occurred performing that action. Skipping."
          GitLeft::Branches.skip(@random_branch)
        end
      end

      puts "\t#{GitLeft::Branches.skipped_branches.count} skipped"    
      puts "\t#{GitLeft::Branches.deleted_branches.count} deleted"
    end
  end
end
