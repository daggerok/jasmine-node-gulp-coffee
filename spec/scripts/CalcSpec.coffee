{Calc} = require '../../src/scripts/Calc'

describe "Calc", ->
  beforeEach ->
    @calc = new Calc

  it "should add correctly", ->
    expect @calc.add 2, 3
      .toBe 5