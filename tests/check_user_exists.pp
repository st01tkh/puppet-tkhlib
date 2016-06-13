$user = 'vagrant1'
$user_exists = check_user_exists($user)
notify{ "user: $user ; user exists: ${user_exists}": }

