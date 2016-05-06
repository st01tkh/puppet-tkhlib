if ($operatingsystem == 'windows') {
    $username = env('USERNAME')
} else {
    $username = env('USER')
}
notify{ "username: $username": }

