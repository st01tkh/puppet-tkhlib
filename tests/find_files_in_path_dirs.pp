#$ar = find_files_in_path_dirs('*.sh')
#validate_array($ar)
#notify { "ar: $ar": }

$ar = find_files_in_path_dirs('pyvenv-*')
validate_array($ar)
notify { "ar: $ar": }

if empty($ar) {
  notify { "empty": }
} else {
  $first_file = $ar[0]
  notify { "first file: $first_file": }
}

