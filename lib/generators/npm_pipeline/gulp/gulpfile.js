var gulp = require('gulp')
var concat = require('gulp-concat')

gulp.task('build:js', function () {
  return gulp.src('app/gulp/js/**/*.js')
    .pipe(concat('app.js'))
    .pipe(gulp.dest('vendor/assets/javascripts/gulp/'))
})

gulp.task('build:css', function () {
  return gulp.src('app/gulp/css/**/*.css')
    .pipe(gulp.dest('vendor/assets/stylesheets/gulp/'))
})

gulp.task('watch:js', function () {
  gulp.watch('app/gulp/js/**/*.js', ['build:js'])
})

gulp.task('watch:css', function () {
  gulp.watch('app/gulp/css/**/*.css', ['build:css'])
})

gulp.task('watch', ['watch:js', 'watch:css'])
gulp.task('build', ['build:js', 'build:css'])
