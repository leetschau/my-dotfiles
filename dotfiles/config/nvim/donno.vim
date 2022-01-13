let s:path = expand('<sfile>:p:h')
exec 'source ' . s:path . '/langbase.vim'

let g:donHome =  '~/.donno'

command! -nargs=+ -complete=file Atti call DonAttach(1, <f-args>)
command! -nargs=+ -complete=file Attf call DonAttach(0, <f-args>)

function DonAttach(isImage, filePath, ...)
  let l:resFullPath = "repo/resources/"
  let l:resFolder = "resources/"
  let l:caption = trim(system('fn=' . a:filePath . ' && basename ${fn%.*}'))
  if a:0 > 0
    let l:caption = a:1
  endif
  let l:targetFn = trim(system('fn=' . a:filePath . ' && basename ${fn}'))
  let l:target = g:donHome . '/' . l:resFullPath . l:targetFn
  if empty(glob(l:target))
    call system("cp " . a:filePath . " " . g:donHome . "/" . l:resFullPath)
    echo "\nFile " . a:filePath . " is copied to " . g:donHome . "/" . l:resFullPath . "\n"
    if a:isImage
      execute "normal! i ![" . l:caption . "](" . l:resFolder . l:targetFn . ") "
    else
      execute "normal! i [" . l:caption . "](" . l:resFolder . l:targetFn . ") "
    endif
  else
    echomsg "Attachment file named " . l:target . " already exists."
    echomsg "Rename your attachment and try again!"
  endif
endfunction
