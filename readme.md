# Mac Hints from BinaryAge

=> [http://hints.binaryage.com]() 

## Contribution

	git clone --recursive git@github.com:binaryage/hints.git
	cd hints
	rake

### FAQ

> how to push to _layouts and shared?

	~/code/basite/hints/_layouts master ➔ git push
	fatal: remote error: 
	  You can't push to git://github.com/binaryage/layouts.git
	  Use git@github.com:binaryage/layouts.git
	~/code/basite/hints/_layouts master ➔ git remote add ba git@github.com:binaryage/layouts.git
	~/code/basite/hints/_layouts master ➔ git push ba
	Counting objects: 5, done.
	Delta compression using up to 8 threads.
	Compressing objects: 100% (4/4), done.
	Writing objects: 100% (4/4), 2.01 KiB, done.
	Total 4 (delta 1), reused 0 (delta 0)
	To git@github.com:binaryage/layouts.git
	   f1de543..a71c440  master -> master


### TODO:

* [https://github.com/radar/forem]()