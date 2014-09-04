json.donationTotal @fundraising['grandTotalRaisedExcludingGiftAid'].to_f.round(1)
json.donationPercentage ((@fundraising['grandTotalRaisedExcludingGiftAid'].to_f / @event.target) * 100).round(1)