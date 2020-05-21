# homebrew-gawkextlib

Brew formulas for installing `gawkextlib` and `gawkextlib/csv`. This will allow you to use Gawk for CSV parsing.

See: http://gawkextlib.sourceforge.net/

## Installing 

```
brew brew tap gavinestey/gawkextlib
brew install gawkextlib-csv
```
 
### Add to `~/.bash_profile`

The forumula separates out the two libraries, `csv` is installed from git due to there being no official release, the last commit was 2018-04-10.

```
export AWKLIBPATH=$(brew --prefix gawkextlib-csv)/lib/gawk
```

## Using

```
echo '1,2,3' | gawk -l csv 'BEGIN { CSVMODE=1 } { print $1 }'
```
