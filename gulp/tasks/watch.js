/*
 __      __    _      _    
 \ \    / /_ _| |_ __| |_  
  \ \/\/ / _` |  _/ _| ' \ 
   \_/\_/\__,_|\__\__|_||_|

 Watch CoffeeScript, SASS and ECO for changes and compile on the fly.

*/

var gulp = require('gulp');

gulp.task('watch', function(){
  gulp.watch('./frontend/javascripts/**/*.coffee', ['scripts']);
  gulp.watch('./frontend/javascripts/manifests/*.js', ['manifests']);
  gulp.watch('./frontend/styles/manifests/*.css', ['manifests']);
  gulp.watch('./frontend/styles/**', ['styles']);
  gulp.watch('./frontend/javascripts/templates/**/*.eco', ['templates']);
  gulp.watch('./frontend/images/**', ['images']);
});
