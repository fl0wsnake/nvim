let s:nvim_path = expand('<sfile>:p:h:h')
let s:xdg_home_path = expand('<sfile>:p:h:h:h')

function! s:RequireElixirHost(host)
  try
    let channel_id = rpcstart(s:nvim_path . '/rplugin/elixir/apps/host/host',[])
    if rpcrequest(channel_id, 'poll') == 'ok'
      return channel_id
    endif
  catch
  endtry
  throw 'Failed to load elixir host.' . expand('<sfile>') .
     ' More information can be found in elixir host log file.'
endfunction

call remote#host#Register('elixir', '{scripts/*_plugin.exs,apps/*}', function('s:RequireElixirHost'))

function! UpdateElixirPlugins()
  execute '!cd ' . s:nvim_path . '/rplugin/elixir && mix nvim.build_host'
endfunction
command! UpdateElixirPlugins call UpdateElixirPlugins()
