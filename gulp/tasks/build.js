/*
  ___      _ _    _ 
 | _ )_  _(_) |__| |
 | _ \ || | | / _` |
 |___/\_,_|_|_\__,_|

  The default task. Compiles your crap, starts the server / watcher
  and cranks open your browser so you can get after it.

*/

var gulp = require('gulp');

gulp.task('build', [
	'templates',
	'scripts',
	'manifests',
	'styles',
	'images',
	'watch'
	], function(){});