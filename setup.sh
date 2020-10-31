# setup bash

# backup
set -x
curr_ts=`date "+%Y%m%d-%H%M%S"`
bak_dir=~/dotfile_baks
dotfile_dir=~/dotfiles
mkdir -p ${bak_dir}

for f in bash_profile bashrc
do
  if [[ -f ~/.${f} ]]; then
    cp ~/.${f} ${bak_dir}/${f}.${curr_ts}
    ln -sf ${dotfile_dir}/${f} ~/.${f}
  fi
done
set +x
