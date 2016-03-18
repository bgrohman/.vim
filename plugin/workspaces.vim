function! WorkspaceWfoWebapp()
    let repo_base_path = "~/development/git_repos/saas-wfo-webapp"
    execute "cd " . repo_base_path
    execute "set path=.," . repo_base_path . "/src," . repo_base_path . "/tests"
endfunction

command! WorkspaceWfoWebapp call WorkspaceWfoWebapp()
