function TargetBar(moneyRaised, targetAmount) {
	this.amount = moneyRaised || 0;
	this.targetAmount = targetAmount || 500;
}

TargetBar.prototype.addMoney = function(moneyDonated) {
	if(this.amount + moneyDonated <= this.targetAmount) {
		this.amount += moneyDonated;
	}
};

TargetBar.prototype.subtractMoney = function(moneyRemoved) {
	if(this.amount - moneyRemoved > 0) {
		this.amount -= moneyRemoved;
	}
};

TargetBar.prototype.adjustTarget = function(targetAddition) {
	this.targetAmount += targetAddition;
};

TargetBar.prototype.percentage = function() {
	var progress = (100 / this.targetAmount) * this.amount;
	return progress
};

TargetBar.prototype.progress = function() {
	if(this.percentage() < 30) return "struggling";
	if(this.percentage() >= 100) return "legendary";
	if(this.percentage() > 75) return "great";
	return "steady"
};
