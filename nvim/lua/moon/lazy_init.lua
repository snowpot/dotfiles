local lazypath = vim.fn.stdpath( "data" ) .. "/lazy/lazy.nvim" 
if  not vim.loop.fs_stat(lazypath) then
   vim.fn.system({ 
    "git" , 
    "clone" , 
    "--filter=blob:none" , 
    "https://github.com/folke/lazy.nvim.git" , 
    "--branch=stable" , -- 最新の安定リリース
    lazypath, 
  }) 
end
 vim.opt.rtp:prepend(lazypath) 

require ( "lazy" ).setup({ 
    spec = "moon.lazy" , 
    change_detection = { notify = false } 
})
