gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'

dir = 'scripts/'
src = 'src/' + dir
scripts = src + '**/*.coffee'
outDir = 'dist/' + dir

spec = 'spec/' + dir
specs = spec + '**/*Spec.coffee'
specOut = 'out/' + dir

gulp.task 'clean', ->
  gulp.src [
      outDir
      specOut
    ]
    .pipe remove {force: true}

gulp.task 'scripts', ->
  gulp.src scripts, {base: src}
    .pipe coffee {bare: true}
      .on 'error', -> console.log error
    .pipe gulp.dest outDir

gulp.task 'specs', ->
  gulp.src specs, {base: spec}
    .pipe coffee {bare: true}
      .on 'error', -> console.log error
    .pipe gulp.dest specOut

gulp.task 'watch', ->
  gulp.watch sources, ['scripts']
  gulp.watch specs, ['specs']

gulp.task 'default', ['scripts', 'specs']
