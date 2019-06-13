let s:data = [
\  [
\    [
\      '                      (@@) (  ) (@)  ( )  @@    ()    @     O     @     O      @',
\      '                 (   )',
\      '             (@@@@)',
\      '          (    )',
\      '',
\      '        (@@@)',
\    ],
\    [
\      '                      (  ) (@@) ( )  (@)  ()    @@    O     @     O     @      O',
\      '                 (@@@)',
\      '             (    )',
\      '          (@@@@)',
\      '',
\      '        (   )',
\    ],
\  ],
\  [
\    [
\      '      ====        ________                ___________ ',
\      '  _D _|  |_______/        \__I_I_____===__|_________| ',
\      '   |(_)---  |   H\________/ |   |        =|___ ___|      _________________         ',
\      '   /     |  |   H  |  |     |   |         ||_| |_||     _|                \_____A  ',
\      '  |      |  |   H  |__--------------------| [___] |   =|                        |  ',
\      '  | ________|___H__/__|_____/[][]~\_______|       |   -|                        |  ',
\      '  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_ ',
\    ],
\  ],
\  [
\    [
\      '__/ =| o |=-O=====O=====O=====O \ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=    ||    ||    ||    |_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\    [
\      '__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=O=====O=====O=====O   |_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\    [
\      '__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=    ||    ||    ||    |_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \O=====O=====O=====O_/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\    [
\      '__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=    ||    ||    ||    |_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \_O=====O=====O=====O/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\    [
\      '__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=   O=====O=====O=====O|_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\    [
\      '__/ =| o |=-~O=====O=====O=====O\ ____Y___________|__|__________________________|_ ',
\      ' |/-=|___|=    ||    ||    ||    |_____/~\___/          |_D__D__D_|  |_D__D__D_|   ',
\      '  \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \_/    ',
\    ],
\  ]
\]

function! sl#animate()
  let l:x = &columns
  let l:data = deepcopy(s:data)
  for l:part in l:data
    for l:lines in l:part
      for l:n in range(len(l:lines))
        let l:lines[l:n] = repeat(' ', l:x) . l:lines[l:n]
      endfor
    endfor
  endfor
  let l:x = 0
  new
  only!
  let l:wrap_backup = &l:wrap
  setlocal nowrap
  redraw
  if exists('*sound_playfile')
    let l:filepath = expand('**/sl.wav')
    call sound_playfile(filepath)
  while 1
    silent %d _
    let l:item = []
    for l:part in l:data
      for l:lines in l:part[l:x % len(l:part)]
        call add(l:item, l:lines[l:x :]) 
      endfor
    endfor
    call setline(1,  l:item)
    redraw
    sleep 20m
    let l:x += 1
    if l:x > 165
      break
    endif
  endwhile
  let &l:wrap = l:wrap_backup
  bw!
endfunction
