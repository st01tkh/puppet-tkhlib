require 'etc'

Etc.passwd { |user|
  Facter.add("user_uid_#{user.name}") do
    setcode do
      user.uid
    end
  end
}
