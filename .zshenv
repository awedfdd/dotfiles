export ELECTRON_OZONE_PLATFORM_HINT='wayland'
export WOO_MODULE_ALLOW_WAYLAND=1

export DXVK_FRAME_RATE=177

export QT_MESSAGE_PATTERN="%{message}"
export QT_LOGGING_RULES="qml.debug=true"

export CC='clang'
export CXX='clang++'

export EDITOR='nvim'
export CMAKE_GENERATOR='Ninja'
# export ASAN_OPTIONS='detect_leaks=0'

alias objdump='objdump -d -M intel'
alias open='xdg-open'

export PATH="$PATH:/opt/ida-free-pc-9.2"
export PATH="$HOME/.local/bin:$PATH"
