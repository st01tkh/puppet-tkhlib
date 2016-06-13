require 'etc'

module Puppet::Parser::Functions
  newfunction(:check_user_exists, :type => :rvalue, :doc => <<-EOS
    Returns true if user exists and false if does not
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "check_user_exists(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    begin
      info = Etc.getpwnam(arguments[0]).dir
      info = true
    rescue
      info = false
    end
    return info
  end
end

# vim: set ts=2 sw=2 et :
