
After pruning, you can get the list of remote branches with git branch -r. 
The list of branches with their remote tracking branch can be retrieved with git branch -vv. 
So using these two lists you can find the remote tracking branches that are not in the list of remotes.

 git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
 
This string gets the list of remote branches and passes it into egrep through the standard input. 
And filters the branches that have a remote tracking branch (using git branch -vv and filtering for those that have origin) 
then getting the first column of that output which will be the branch name. 
Finally passing all the branch names into the delete branch command.

Since it is using the -d option, it will not delete branches that have not been merged into the branch that you are on 
when you run this command.
