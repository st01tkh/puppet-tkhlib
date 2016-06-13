#!/usr/bin/env ruby
#../tkhlib/lib/puppet/parser/functions/

require 'rbconfig'

def os
  @os ||= (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
    end
  )
end

def get_dirs_from_path_env
  os_detect = os()
  case os_detect
  when :windows
    sp_char = ';'
  when :macosx
    sp_char = ':'
  when :linux
    sp_char = ':'
  when :unix
    sp_char = ':'
  else
    raise Error::WebDriverError, "unknown os: #{os_detect}"
  end
  path_ar = ENV['PATH'].split(sp_char)
  return path_ar
end

def find_files_in_dirs(path_ar, glob_pattern)
    found_ar = Array.new
    path_ar.each do |d|
        #puts "d #{d}"
        if File.directory? d 
            #puts "  DIR"
            Dir.chdir(d)
            Dir.glob(glob_pattern).each do|f|
                full_path = File.join(d, f)
                found_ar.push(full_path)
                #puts "f: #{f}"
            end
        else
            #puts "  NOT DIR"
        end
    end
    return found_ar
end
#path = ENV['PATH'].split(':')
#puts path
#get_dirs_from_path_env()
#Dir.glob('*.rb').each do|f| puts f end
found_ar = find_files_in_dirs(get_dirs_from_path_env(), '*.sh')
puts found_ar

module Puppet::Parser::Functions
  newfunction(:find_files_in_path_dirs, :type => :rvalue, :doc => <<-EOS
    Returns array of found by glob pattern files in dirs pointed in PATH variable
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "find_files_in_path_dirs(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    return find_files_in_dirs(get_dirs_from_path_env(), arguments[0])
  end
end
