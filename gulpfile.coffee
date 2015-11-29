gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'

srcDir = 'src/coffee/'
sources = srcDir + '**/*.coffee'
outDir = 'dist/js/'

specDir = 'spec/coffee/'
specs = specDir + '**/*Spec.coffee'
specOut = 'out/spec/'

gulp.task 'clean', ->
  gulp.src [
      outDir
      specOut
    ]
    .pipe remove {force: true}

gulp.task 'sources', ->
  gulp.src sources, {base: srcDir}
    .pipe coffee {bare: true}
      .on 'error', -> console.log error
    .pipe gulp.dest outDir

gulp.task 'specs', ->
  gulp.src specs, {base: specDir}
    .pipe coffee {bare: true}
      .on 'error', -> console.log error
    .pipe gulp.dest specOut

gulp.task 'watch', ->
  gulp.watch sources, ['sources']
  gulp.watch specs, ['specs']

gulp.task 'default', ['sources', 'specs']
