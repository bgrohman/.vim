function! workspaces#WfoWebapp()
    let repo_base_path = "~/development/git_repos/saas-wfo-webapp"
    execute "cd " . repo_base_path
    execute "set path=.," . repo_base_path . "/src," . repo_base_path . "/tests"
endfunction

function! workspaces#Vim()
    if has("unix")
        let repo_base_path = "~/.vim"
    else
        let repo_base_path = "~/development/git_repos/.vim"
    endif

    execute "cd " . repo_base_path
    execute "set path=.," . repo_base_path
    execute ":e " . repo_base_path . "/.vimrc"
endfunction

command! WorkspaceWfoWebapp call workspaces#WfoWebapp()
command! WorkspaceVim call workspaces#Vim()
