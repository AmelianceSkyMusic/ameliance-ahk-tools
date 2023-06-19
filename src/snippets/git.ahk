#HotIf
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?

::ga.::git add .{ENTER} ; - добавить все файлы в стейдж
::ga::git add ; - добавить файл в стейдж
::gs::git status --short{ENTER} ; - посмотреть статус
::gp::git push{ENTER} ; - закинуть изминения из гита на репозиторий

::gc::git commit -m ""{LEFT} ; - записать коммит в гит
::gam::git commit --amend
::gamn::git commit --amend --no-edit
::gcb::git checkout -b{SPACE} ; - создать ветку и перейти на нее
::gch::git checkout ; - перейти на ветку
::gb::git branch ; - посмотреть ветки
::gr.::git reset . ; - отменить git add
::gr::git reset ; - отменить git add

::gac::git add .{ENTER}{SLEEP 200}git commit -m ""{LEFT} ; - git add + commit
