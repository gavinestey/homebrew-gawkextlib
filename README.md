# homebrew-gawkextlib

Brew formulas for installing `gawkextlib` and `gawkextlib/csv`. This will allow you to use Gawk for CSV parsing.

The formula separates out the two libraries, `csv` is installed from git due to there being no official release, the last commit was 2018-04-10.

See: http://gawkextlib.sourceforge.net/

## Installing 

```
brew brew tap gavinestey/gawkextlib
brew install gawkextlib-csv
```
 
### Add to `~/.bash_profile`

The csv library doesn't get copied into the Gawk lib directory (so that Gawk can be upgraded separately), this mean that $AWKLIBPATH needs to point to the directory that it's installed into.

```
export AWKLIBPATH=$(brew --prefix gawkextlib-csv)/lib/gawk
```

## Using

```
echo '1,2,3' | gawk -l csv 'BEGIN { CSVMODE=1 } { print $1 }'
```
