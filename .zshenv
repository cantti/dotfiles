# checks to see if we are in a windows or linux dir
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}

# use windows git when use WSl in windows directory
# https://github.com/microsoft/WSL/issues/4401#issuecomment-670080585
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}

# use windows dotnet when use WSl in windows directory
function dotnet {
  if isWinDir
  then
    dotnet.exe "$@"
  else
    /usr/bin/dotnet "$@"
  fi
}
