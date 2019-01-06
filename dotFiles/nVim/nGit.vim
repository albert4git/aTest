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
