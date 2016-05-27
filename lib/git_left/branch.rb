module GitLeft
  class Branch
    def initialize(branch)
      @branch = branch
    end

    def is_upstream?
      GitLeft::Branches.remote_branches.map(&:name).include?(@branch.name)
    end

    # Delegated Methods

    def name
      @branch.name
    end

    def delete
      @branch.delete
    end
  end
end
