var gulp = require('gulp');
var coffee = require('gulp-coffee');
var uglify = require('gulp-uglify');

gulp.task('default', function(done) {
    gulp.src('src/*.coffee')
        .pipe(coffee({
            bare: true
        }))
        .pipe(uglify())
        .pipe(gulp.dest('dist'))
        .on('end', done);
});

