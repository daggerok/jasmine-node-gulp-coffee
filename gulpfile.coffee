gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'
jasmine = require 'gulp-jasmine'

dir = 'scripts/'
src = 'src/' + dir
coffeeScripts = '**/*.coffee'
scripts = src + coffeeScripts
outDir = 'dist/' + dir

spec = 'spec/' + dir
specs = spec + '**/*Spec.coffee'

gulp.task 'clean', ->
  gulp.src outDir
    .pipe remove {force: true}

gulp.task 'scripts', ->
  gulp.src scripts, {base: src}
    .pipe coffee {bare: true}
      .on 'error', -> console.log error
    .pipe gulp.dest outDir

gulp.task 'specs', ->
  gulp.src specs
    .pipe jasmine {coffee: true, color: true, verbose: true}
      .on 'error', -> console.log error

gulp.task 'watch', ->
  gulp.watch scripts, ['scripts']
  gulp.watch specs, ['specs']

gulp.task 'default', ['scripts', 'specs']
