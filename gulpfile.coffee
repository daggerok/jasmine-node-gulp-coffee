gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'

testDir = 'spec/coffee/'
coffeeTests = testDir + '**/*Spec.coffee'
testOut = 'out/spec/'

gulp.task 'clean', ->
  gulp.src testOut
    .pipe remove {force: true}

gulp.task 'tests', ->
  gulp.src coffeeTests, {base: testDir}
    .pipe coffee {bare: true}
    .on 'error', ->
      console.log error
    .pipe gulp.dest testOut

gulp.task 'watch', ->
  gulp.watch coffeeTests, ['tests']

gulp.task 'default', ['tests']
