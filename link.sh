#!/bin/bash

set -u

# 実行場所のディレクトリ取得
dot_dir="${HOME}/dotfiles"
conf_dir=".config"

echo "link home dir dotfiles"

cd ${dot_dir}

for f in .??*; do
	#無視するファイルやディレクトリ
	[ "$f" = ".git" ] && continue
	[ "$f" = ".config" ] && continue

	#ln -snfv ${dot_dir}/${f} ${HOME}/${f}
	ln -snfv ${dot_dir}/"$f" ${HOME}/

done

echo "link .config dir dotfiles"

cd ${dot_dir}/${conf_dir}

for file in `\find . -maxdepth 8 -type f`; do
	ln -snfv ${dot_dir}/${conf_dir}/${file:2} ${HOME}/${conf_dir}/${file:2}
done

echo "linked dtfiles complete!"
