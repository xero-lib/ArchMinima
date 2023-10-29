if status is-interactive
    # Commands to run in interactive sessions can go here
	# Aliases {
	alias peaclock="peaclock --config-dir ~/.config/peaclock"
	alias nv=nvim
	alias yts="DISPLAY=:0 yt"
	alias sl=ls
	alias wtr="curl wttr.in"
	alias decv="pamixer -d"
	alias incv="pamixer -i"
	alias gvol="pamixer --get-volume-human"
	alias clip="scrot -fs - | xclip -selection clipboard -target image/png -i"
	alias cb="greenclip print | dmenu | xargs -d '\n' greenclip print"
	alias hx="helix"
    alias z="zellij"
	alias tasks="task li"
	alias rr="~/Scripts/rr.sh"
	alias encrypt="~/Scripts/file_crypt/encrypt.sh"
	alias decrypt="~/Scripts/file_crypt/decrypt.sh"
	alias :q="exit"
	# } Aliases
	set PATH $PATH:/home/helix/.cargo/bin
end

#ENV
export _JAVA_AWT_WM_NONREPARENTING=1
export RUSTC_WRAPPER=sccache
export EDITOR=vim
   #Clipmenu
export CM_SELECTIONS="clipboard"
export CM_DEBUG=1
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10000
export CM_HISTLENGTH=20

# pnpm
set -gx PNPM_HOME "/home/helix/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/helix/.ghcup/bin # ghcup-env

# opam configuration
source /home/helix/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
