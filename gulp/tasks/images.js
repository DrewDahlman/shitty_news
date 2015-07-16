/*
   ___               
  / __|___ _ __ _  _ 
 | (__/ _ \ '_ \ || |
  \___\___/ .__/\_, |
          |_|   |__/ 

  Copy the production ready assets to the ./dist folder.

  NOTE: you can add more exceptions here with '!public/[your folder name]/ ... ',
  anything else that is added to the ./public folder will be copied to ./dist.

*/

var gulp = require('gulp'),
    config = require('../config');

gulp.task('images', function() {
  gulp.src('./frontend/images/**/*')
    .pipe(gulp.dest('./app/assets/images/'));
});