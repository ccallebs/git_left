module GitLeft
  module Branches
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
    end

    def self.branches_to_omit
      @@skipped_branches + @@deleted_branches + ['master']
    end

    def self.random_branch
      branches.sample
    end

    def self.branches
      @@skipped_branches ||= []
      @@deleted_branches ||= []

      @@all_branches = Git.open('.').branches.to_a
      @@all_branches.select { |b| !branches_to_omit.include?(b.name) }
    end
  end
end
