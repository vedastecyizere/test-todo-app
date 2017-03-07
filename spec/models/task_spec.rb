require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do 
    it 'should switch favorite to true if it began as false' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end 
  end 

  describe '#toggle_favorite!' do
    it 'should switch favorite to false if it began as true' do 
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end 
  end

  describe '#overdue?' do
    it 'should show prove that current time is greater than the deadline' do
      task = Task.new(deadline: Time.now - 5.hours)
      expect(task.overdue?).to eq(true)
    end 
  end 

  describe '#increment_priority!' do 
    it 'should return priority + 1 if priority is less than 10' do 
      task = Task.new(priority: 8)
      task.increment_priority!
      expect(task.priority).to eq(9)
    end 
  end

  describe '#decrement_priority!' do 
    it 'should return the priority - 1 if priority is greater than 1' do 
      task = Task.new(priority: 4)
      task.decrement_priority!
      expect(task.priority).to eq(3)
    end 
  end  
end
