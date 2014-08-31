require 'rails_helper'

describe 'Validations' do 
  it 'is not valid with a name of numerical characters' do 
    event = Event.new(name: 12432)
    expect(event).to have(1).error_on(:name)
  end

  it 'is not valid unless all fields are filled in' do 
    event = Event.new(name: 'Slow Race')
    expect(event).to have(1).error_on(:event_date)
    expect(event).to have(1).error_on(:charity)
    expect(event).to have(2).error_on(:target)
    expect(event).to have(2).error_on(:amount_raised)
  end

  it 'is not valid if name is less than 3 characters' do
    event = Event.new(name: 'Sl')
    expect(event).to have(1).error_on(:name)
  end

  it 'is not valid if the target and actual amounts are not numbers' do 
    event = Event.new(target: 'abc', amount_raised: 'abc')
    expect(event).to have(1).error_on(:target)
    expect(event).to have(1).error_on(:amount_raised)
  end

  it 'is not valid if the event date is before todays date' do
    event = Event.new(event_date: Date.new(2014, 8, 1))
    expect(event).to have(1).error_on(:event_date)
  end
end