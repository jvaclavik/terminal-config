if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
export VISUAL=nano
export EDITOR="$VISUAL"
export ANDROID_HOME=/Applications/android-sdk-macosx/
export PATH=${PATH}:/Applications/android-sdk-macosx/platform-tools:/Applications/android-sdk-macosx/tools:/Applications/android-sdk-macosx/build-tools/23.0.3:/Applications/clojure;
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/
export NODE_PATH="/usr/local/lib/node_modules"
#sudo ulimit -n 2560

alias latest='git for-each-ref --sort=committerdate refs/heads/ --format='\''%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'\'''
alias rnd='open "rndebugger://set-debugger-loc?host=localhost&port=8081"'
alias rn='react-native'
alias rna='react-native run-android'
alias rni='react-native run-ios'
alias shake='adb shell input keyevent 82'
alias rr='adb shell input text "RR"'
alias aii='adb install -r ./platforms/android/build/outputs/apk/android-debug.apk'
alias adbr='adb reverse tcp:8081 tcp:8081'
alias ai='adb install -r'
alias is='ionic serve -b'
alias ip='ionic prepare'
alias ira='ionic run android --dev'
alias iri='ionic run ios'
alias ad='adb devices'
alias g='git'
alias gs='git status'
alias gl='git l'
alias ga='git all'
alias gb='git branch'
alias gc='git checkout'
alias gco='git commit'
alias gdmb='git branch -d `git for-each-ref --format="%(refname:short)" refs/heads/\*`' # Git delete merged branches
alias ls='ls -GFh'
alias logcat='adb logcat chromium:D SystemWebViewClient:D *:S'
alias o='open -a WebStorm.app '
alias s='say -v Zuzana '
alias iphone='ios-sim start "--devicetypeid" "iPhone-SE, 11.0" "--exit";'

hl(){ highlight -O rtf --font-size 20 --style moria --src-lang "$2" "$1" | pbcopy;}
export -f hl;



# Tell ls to be colourful
# http://www.norbauer.com/rails-consulting/notes/ls-colors-and-terminal-app.html
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad 


export GREP_OPTIONS='--color=auto'
export TERM="xterm-color"
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\] \$ '
export PSORIG="$PS1"

function GITBRANCH() {
        BRANCH="$(git branch 2>/dev/null | grep '*' | cut -d" " -f2-)"
        if [ -n "$BRANCH" ] ; then
            export PS1="\e[34m$\[\w\[\e[0m\] "
            export PS1=$PS1$(echo -en "\[\033[00;32m\][$BRANCH] \[\033[00m\]")
            export PS1=$PS1'$ '
        else
                export PS1="$PSORIG"
        fi
}

PROMPT_COMMAND="GITBRANCH; $PROMPT_COMMAND"
