# dotfiles

See https://pypi.python.org/pypi/dotfiles

## On new a Mac, install python and pipenv:
`brew install python3`
`brew install pipenv`

Then, in ~/ :

```
# create an Python venv for your ~ folder
cd ~
pipenv shell

# install the 'dotfiles' utility
pip install dotfiles

# Clone the git repo
git clone git@github.com:yanickc/dotfiles.git Dotfiles

# Create dotfiles symlinks
dotfiles --sync
```

## To add a new file to the repo: 
```
dotfiles --add my-new-file
```

