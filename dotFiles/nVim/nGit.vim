Aliases

Git allows us to create aliases. It’s a really nice utility, if you know your most used git combinations. As a DevOps Engineer I have to init repositories with some infrastructure setup. After generating templates I just run git this. What is git this?
this = !git init && git add -A && git commit -m \"Initial commit.\"

Or let’s say it’s time to clean up your work before pushing commits to the remote.
undo = reset --soft HEAD^
amend = commit --amend --no-edit
log-line = log --oneline --graph --decorate
Git integrate

Git smoothly integrates with external tools in zplug setup you can find a tool called icdiff. It’s my replacement for the standard git diff command, the output of which is pretty unreadable. By using git-difftool variables icdiff is able to analyze data in the same way that git does, but in more readable way.
    renames = true
    tool = icdiff
[difftool]
    prompt = false
[difftool "icdiff"]
    cmd = icdiff --line-numbers $LOCAL $REMOTE

Let’s check the results of this integration!

We can do the same integration for mergetool. I will use PyCharm because I love VCS tools shipped by JetBrains.
[merge]
    tool = pycharm
[mergetool "pycharm"]
    cmd = /usr/local/bin/charm merge "$LOCAL" "$REMOTE" "$BASE" "$MERGED"

Done!
How to exit Vim and come back

"=========================================================
git log --pretty=format:"[%h] %ae, %ar: %s"
These settings can be passed to Git without changing any configuration files:

git difftool --tool=vimdiff --no-prompt

To tell Git to always use Vimdiff, issue the following commands:

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff

I find myself combining Git’s output with vim -p on certain occasions when I want to edit each changed file:

vim -p `git diff --name-only`


"=====================================================
git rm -r one-of-the-directories
git commit -m "Remove duplicated directory"
git push origin <your-git-branch> (typically 'master', but not always)

"=====================================================
Ensure you are in the default branch:
git checkout master
The rm -r command will recursively remove your folder:
git rm -r folder-name
Commit the change:
git commit -m "Remove duplicated directory"
Push the change to your remote repository:
git push origin master
"=====================================================
mkdir lib
git mv hello.html lib
git status

mkdir lib
mv hello.html lib
git add lib/hello.html
git rm hello.html

git commit -m "Moved hello.html to lib"
"=====================================================

    git init
    git config user.name "someone"
    git config user.email "someone@someplace.com"
    git rm -r
    git commit -m "deleting dir"
    git push origin master
