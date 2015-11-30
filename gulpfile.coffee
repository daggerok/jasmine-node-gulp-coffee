gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'
jasmine = require 'gulp-jasmine'

coffeeDir = 'scripts/'
src = 'src/' + coffeeDir
coffeeScripts = '**/*.coffee'
scripts = src + coffeeScripts
outDir = 'dist/' + coffeeDir

spec = 'spec/' + coffeeDir
specs = spec + coffeeScripts

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
