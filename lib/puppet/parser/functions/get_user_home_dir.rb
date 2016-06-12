require 'etc'

module Puppet::Parser::Functions
  newfunction(:get_user_home_dir, :type => :rvalue, :doc => <<-EOS
    Returns user's home dir
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "get_user_home(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    return Etc.getpwnam(arguments[0]).dir
  end
end

# vim: set ts=2 sw=2 et :
