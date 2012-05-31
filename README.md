### NOTE: This functionality was merged into Paperclip itself on the 31 May 2012, therefor this gem is now in maintenance mode (and is no longer being actively developed).

Paperclip::Defaults [![Build Status](https://secure.travis-ci.org/socialreferral/paperclip-defaults.png)](http://travis-ci.org/socialreferral/paperclip-defaults)
==============
Configurable Rails application wide defaults for Paperclip.

This gem requires Ruby 1.9.2 or 1.9.3

Usage
-----
Please read the [Paperclip documentation](https://github.com/thoughtbot/paperclip) to learn how to use Paperclip.

To use Paperclip::Defaults simply add it to your Gemfile and update config/application.rb or one of your config/environments/ files. In these files you can set the default options Hash for has_attached_file like so:

``` ruby
config.paperclip_defaults = {default_url: "http://www.example.com/missing.png"}
```

Development
-----------
- Source hosted on [GitHub](https://github.com)
- Please report issues and feature requests using [GitHub issues](https://github.com/socialreferral/paperclip-defaults/issues)

Pull requests are welcome, please make sure your patches are well tested before contributing. When sending a pull request:
- Use a topic branch for your change
- Add tests for your changes using MiniTest::Unit
- Do not change the version number in the gemspec

License
-------
Paperclip::Defaults is released under the MIT license.

Author
------
[Mark Kremer](https://github.com/mkremer)
