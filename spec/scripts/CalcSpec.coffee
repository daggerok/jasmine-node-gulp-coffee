{Calc} = require '../../src/scripts/Calc'

describe "Calc", ->
  beforeEach ->
    @calc = new Calc

  it "should add correctly", ->
    expect @calc.add 1, 1
      .toBe 2