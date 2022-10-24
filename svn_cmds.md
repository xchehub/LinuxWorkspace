# svn add files
- `svn status | awk '{$1=""; print $0}'  | xargs -i svn add "{}"`
- `svn st | grep ^? | sed 's/?    //' | xargs -i svn add "{}"`
- `svn add --force path/to/dir`
- `svn add --force .`

