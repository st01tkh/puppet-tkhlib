$ar = find_files_in_path_dirs('*.sh')
validate_array($ar)
notify { "ar: $ar": }

