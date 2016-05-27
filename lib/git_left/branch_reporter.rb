module GitLeft
  class BranchReporter
    def initialize(branch)
      @branch = branch
    end

    def report
      puts branch_info
      puts instructions
    end

    def branch_info
      str = "\nDeciding time: #{underlined(@branch.name)}"

      if @branch.is_upstream?
        str << green(" (exists upstream)") 
      end

      str
    end

    def instructions
      "(h to delete, l to skip, anything else to quit)\n"
    end

    def underlined(text)
      "\e[4m" << text << "\e[24m"
    end

    def green(text)
      "\e[32m#{text}\e[0m"
    end
  end
end
