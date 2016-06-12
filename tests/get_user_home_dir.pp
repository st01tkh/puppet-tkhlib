$user = 'vagrant'
$home_dir = get_user_home_dir($user)
notify{ "user: $user ; home dir: $home_dir": }

