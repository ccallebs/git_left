module GitLeft
  module Branches
    def self.git_instance
      @git_instance ||= Git.open('.')      
    end

    def self.skipped_branches
      @@skipped_branches || []
    end

    def self.deleted_branches
      @@deleted_branches || []
    end

    def self.skip(branch)
      @@skipped_branches ||= []
      @@skipped_branches << branch.name
    end

    def self.delete(branch)
      @@deleted_branches ||= []
      @@deleted_branches << branch.name

      branch.delete
    end

    def self.branches_to_omit
      @@skipped_branches + @@deleted_branches + ['master']
    end

    def self.random_branch
      branches.sample
    end

    def self.remote_branches
      @remote_branches ||= git_instance.branches.remote
    end

    def self.branches
      @@skipped_branches ||= []
      @@deleted_branches ||= []

      @@all_branches ||= git_instance.branches.local.to_a.map { |b| GitLeft::Branch.new(b) }
      @@all_branches.select { |b| !branches_to_omit.include?(b.name) }
    end
  end
end
