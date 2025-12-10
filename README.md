# Myg

Myg is a project containing games and providing tools to create other games.

## Loading the project 

Load a stable version of Myg with the following snippet, in Pharo 11:

```Smalltalk
Metacello new
	repository: 'github://K-Boo/Myg';
	baseline: 'Myg';
	load.
```

For development, load master branch:

```Smalltalk
Metacello new
	repository: 'github://K-Boo/Myg';
	baseline: 'Myg';
	onConflictUseLoaded;
	load.
```


## Playing Sokoban

```Smalltalk
Sokoban open
```

