//= require targetbar.js

describe("TargetBar", function() {
  var targetBar;


  beforeEach(function() {
    targetbar = new TargetBar(0, 100);

  });

  it("should begin at start value given, or default to 0", function() {
    expect(targetbar.amount).toEqual (0);
  });

  describe("Adding to the money raised", function() {
    it("increases if < the target amount", function() {
      targetbar.addMoney(1);
      expect(targetbar.amount).toEqual (1);
    });

    it("does not increase if the target amount has been raised", function(){
      targetbar.amount = 100;
      targetbar.addMoney(1);
      expect(targetbar.amount).toEqual(100);
    });
  });

  describe("Removing money", function() {
    it("does not decrease if <= 0", function(){
      targetbar.subtractMoney(1);
      expect(targetbar.amount).toEqual(0);
    });
  });

  describe("The target amount", function(){
    it("can be adjusted by the user", function(){
      targetbar.adjustTarget(100);
      expect(targetbar.targetAmount).toEqual(200);
    });
  });


  describe("Donation progress", function(){
    it("displays the donation progress %", function(){
      targetbar.amount = 40;
      expect(targetbar.percentage()).toEqual(40);
    })

    it("needs encouragement if < 30% of target raised", function(){
      targetbar.amount = 29;
      expect(targetbar.progress()).toEqual("struggling");
    });

    it("is going ok if between 30% and 65%", function(){
      targetbar.amount = 56;
      expect(targetbar.progress()).toEqual("steady");
    });

    it("is going great if > 75% of target raised", function(){
      targetbar.amount = 82;
      expect(targetbar.progress()).toEqual("great");
    });
  });
});
