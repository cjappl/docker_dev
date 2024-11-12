function fish_user_key_bindings
    for mode in insert default visual
        # Enable ctrl + f for auto complete 
        # Fish issue 3541
        bind -M $mode \cf forward-char
    end

    fzf_key_bindings

end

set -x fish_color_user d7ff87
set -x fish_color_cwd ff6b2d
#set -x fish_color_host 2f99d4
set -x fish_color_host 2f99d4
set -x fish_color_operator $fish_color_user 

# More prompt configuration 
function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold $fish_color_cwd 
      echo '[N]'
    case insert
      set_color --bold $fish_color_host 
      echo '[I]'
    case replace_one
      set_color --bold green
      echo '[R]'
    case visual
      set_color --bold brmagenta
      echo '[V]'
    case '*'
      set_color --bold red
      echo '[?]'
  end

  set_color white 
  echo ' '
  set_color normal
end

function fish_prompt -d "Write out the prompt"
    set_color aacf9f
    printf '[DOCKER UBUNTU] > ' 

    set_color normal
end

set fish_greeting ""

fish_vi_key_bindings

function make_radsan
    make -C /test_radsan RADSAN_BUILD_DIR=/test_radsan/build_ubuntu RADSAN_CMAKE_GENERATOR=Ninja clang test
end

cd /test_radsan
