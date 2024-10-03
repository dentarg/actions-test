# actions-test

foo
bar

---

_two spaces_

This caching speeds up installing gems significantly and avoids too many requests to RubyGems.org.  
It needs a `Gemfile` (or `$BUNDLE_GEMFILE` or `gems.rb`) under the [`working-directory`](#working-directory).  
If there is a `Gemfile.lock` (or `$BUNDLE_GEMFILE.lock` or `gems.locked`), `bundle config --local deployment true` is used.

---

_no spaces and `<!-->`_

This caching speeds up installing gems significantly and avoids too many requests to RubyGems.org.
It needs a `Gemfile` (or `$BUNDLE_GEMFILE` or `gems.rb`) under the [`working-directory`](#working-directory).
<!-->
If there is a `Gemfile.lock` (or `$BUNDLE_GEMFILE.lock` or `gems.locked`), `bundle config --local deployment true` is used.
