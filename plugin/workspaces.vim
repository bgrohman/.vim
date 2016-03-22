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

" ================ Opening JS Tests ================
let s:JS_UNIT_TEST = 1
let s:JS_PTOR_TEST = 2
let s:UNIT_TEST_EXTENSION = ".spec.js"
let s:PTOR_TEST_EXTENSION = ".prot.spec.js"

function! s:OpenJsTest(testType)
    let file_path = expand("%:p")
    let js_extension_pattern = "\.js$"
    let test_extension = a:testType == s:JS_UNIT_TEST ? s:UNIT_TEST_EXTENSION : s:PTOR_TEST_EXTENSION

    if file_path =~ js_extension_pattern
        let unit_test_file_path = substitute(file_path, js_extension_pattern, test_extension, "")
        execute ":vnew"
        execute ":e " . unit_test_file_path
    else
        echohl ErrorMsg
        echo "This is not a JavaScript file. Can't open test."
        echohl None
    endif
endfunction

command! OpenUnitTest call s:OpenJsTest(1)
command! OpenPtorTest call s:OpenJsTest(2)
