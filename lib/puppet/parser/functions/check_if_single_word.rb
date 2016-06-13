def check_if_single_word(string)
       string.scan(/\w+/).size == 1
end

module Puppet::Parser::Functions
  newfunction(:check_if_single_word, :type => :rvalue, :doc => <<-EOS
    Returns user's home dir
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "check_if_single_word(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    return check_if_single_word(arguments[0])
  end
end

# vim: set ts=2 sw=2 et :
