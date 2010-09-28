#!/bin/sh

cd ~/.dotfiles

# link my configuration files
for f in `find -type f -name ".*"` ; do
  ln -s `pwd`/$f ~/$f
done
ln -s `pwd`/.vim ~/.vim

# install my scripts under bin directory
for f in `ls bin/` ; do
  ln -s `pwd`/bin/$f /usr/local/bin/$f
done

# sudo update-alternatives --install /usr/lib/mozilla/plugins/mozilla-javaplugin.so mozilla-javaplugin.so /usr/lib/jvm/java-6-sun/jre/lib/i386/libnpjp2.so 1


# Backup files into Dropbox

if [ -d "$HOME/Dropbox" ]; then
  ln -s "$HOME/Dropbox/Empathy" "$HOME/.local/share/Empathy/logs/"
  ln -s "$HOME/Dropbox/.git-achievements.log" "$HOME/.git-achievements.log"
  ln -s "$HOME/Dropbox/.git-achievements-action.log" "$HOME/.git-achievements-action.log"
else
  echo "Install Dropbox client"
  exit 1
fi
