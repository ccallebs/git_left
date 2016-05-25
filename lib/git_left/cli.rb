require "thor"
require "git"
require "pry"
module GitLeft
  class CLI < Thor
    desc "begin", "Begin swiping left"
    def begin(opts = {})
      puts "Time to clean up some branches..."
      @git = Git.open('.')
      
      @git.branches.each do |branch|
        
      end
    end
  end
end
