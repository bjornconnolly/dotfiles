local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)

    -- if IsAvailable("lsp_signature") then
    --     require("lsp_signature").on_attach({
    --         floating_window = false
    --     })
    -- end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader><BS>', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<leader><leader><BS>', function() vim.lsp.buf.declaration() end, opts)

    -- TODO: use something else, default behavior is e.g. good for vimscript
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set('n', '<M-s>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('i', '<M-s>', function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
    vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<space>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>oq', function() vim.lsp.buf.code_action({"quickfix"}) end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<BS>e', function() vim.diagnostic.show_line_diagnostics() end, opts)
    vim.keymap.set('n', '[g', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']g', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<BS>l', function() vim.diagnostic.set_loclist() end, opts)
    -- vim.keymap.set('n', '<BS>f', function() vim.lsp.buf.formatting() end, opts)
    vim.keymap.set('n', '<BS>f', function() vim.lsp.buf.format({async = true}) end, opts)

    vim.keymap.set('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', '<BS>gt', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', '<BS>gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', '<BS>gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<BS>rn', function() vim.lsp.buf.rename() end, opts)

    vim.keymap.set('n', '<BS>rs', function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, opts)

    -- TODO: do something similar to this
    -- nnoremap <silent> K :call <SID>show_documentation()<CR>
    -- function! s:show_documentation()
    --   if &filetype == 'vim'
    --     execute 'h '.expand('<cword>')
    --   else
    --     call CocActionAsync('doHover')
    --   endif
    -- endfunction
end

return M
