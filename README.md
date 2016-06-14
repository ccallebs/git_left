# git_left

git_left aims to help you clean up your lingering git repositories. There are
better ways I'm sure.

The code is straightforward but **use at your own risk**. I didn't write any tests.

## Installation

Install it yourself:

    $ gem install git_left

## Usage

```
git_left begin
```

Begins session to evaluate git branches and decide whether to delete them or
save them for later.

#### Sample session:

```
➜  git_left git:(master) git_left begin
Time to clean up your 4 local branches...

Deciding time: four-branch (h to delete, l to skip, anything else to quit)
four-branch deleted

Deciding time: one-branch (h to delete, l to skip, anything else to quit)
one-branch skipped

Deciding time: two-branch (h to delete, l to skip, anything else to quit)
two-branch skipped

Deciding time: three-branch (h to delete, l to skip, anything else to quit)
three-branch skipped

You cleaned up all your branches!
  3 skipped
  1 deleted
```

```
git_left yolo
```

Deletes every local git branch in the current repository.

#### Sample session:

```
➜  git_left git:(master) ✗ git_left yolo
Are you absolutely sure you want to delete your 4 local branches? (y/n)
I'm serious, this is not easily undone. Go through with it? (y/n)
Okay...
two-branch deleted.
one-branch deleted.
three-branch deleted.
four-branch deleted.
➜  git_left git:(master) ✗ git branch
* master
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ccallebs/git_left.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

