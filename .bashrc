#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:/opt/android-sdk/platform-tools:/home/ole/.gem/ruby/1.9.1/bin
export LC_CTYPE="en_US.utf8"

#PS1='\u@\h:\w \$ '

PS1='\e[0;36m\u\e[0m\e[0m \e[0;33m\w\e[0m \$ '

alias record='recordmydesktop --no-sound'

alias colortest="python -c \"print('\n'.join([(' '.join([('\033[38;5;' + str((i + j)) + 'm' + str((i + j)).ljust(5) + '\033[0m') if i + j < 256 else '' for j in range(10)])) for i in range(0, 256, 10)]))\""

####################################################
# Different filetypes should have different colors #
####################################################

LS_TEXT_FILES=(229 txt js py rb c cpp sh conf cfg pl log xml html php cer cfm csr css htm jsp)
# Archive files
LS_ARCH_FILES=(161 zip 7z Z rar tar.gz tar tar.xz tar.bz2 bz2 gz tbz2 tgz)
# Image files
LS_IMG_FILES=(109 jpg png jpeg gif)

LS_FILE_EXTS=(LS_TEXT_FILES LS_ARCH_FILES LS_IMG_FILES)

LS_COLORS=""
for e in ${LS_FILE_EXTS[*]}; do
  eval c=(\${$e[*]})
  for ((i=1; i<${#c[@]}; i++)) do
     LS_COLORS="$LS_COLORS:*.${c[$i]}=38;5;${c[0]}"
  done
done

export LS_COLORS="$LS_COLORS:di=38;5;81"

alias ls='ls --color=auto'
