/*
   ___ _               
  / __| |___ __ _ _ _  
 | (__| / -_) _` | ' \ 
  \___|_\___\__,_|_||_|

 Get rid of everything Gulp generates. You can see the stripes ...

*/

var gulp  = require('gulp'),
    clean = require('gulp-clean');

gulp.task('clean', function() {
  return gulp.src([
      '!./app/assets/javascripts/vendor/',
      './app/assets/javascripts/*.js.erb',
      './app/assets/javascripts/*.js',
      './app/assets/images/**/*',
      './app/assets/stylesheets/app.css'
    ], {read: false})
    .pipe(clean({force: true}));
});