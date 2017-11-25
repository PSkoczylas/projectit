require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { build(:task) }

  it "has a valid factory" do
    task.should be_valid
  end

  it "status with too big values" do
    expect { build(:task, status: 4) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid status/)
    
    expect { build(:task, status: 100) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid status/)
    
    expect { build(:task, status: :good) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid status/)
  end

  it "status with good values" do
    build(:task, status: 0).should be_valid
    build(:task, status: 3).should be_valid
    build(:task, status: :todo).should be_valid
  end

  it "priority with too big values" do
    expect { build(:task, priority: 3) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid priority/)
    
    expect { build(:task, priority: 100) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid priority/)
    
    expect { build(:task, priority: :something) }
    .to raise_error(ArgumentError)
    .with_message(/is not a valid priority/)
  end

  it "priority with good values" do
    build(:task, priority: 0).should be_valid
    build(:task, priority: 2).should be_valid
    build(:task, priority: :high).should be_valid
  end

  it "name has most 255 characters" do
    longer_name = "m" * 252 + "@a.c"
    build(:user, email: longer_name).should_not be_valid
    shorter_name = "m" * 251 + "@a.c"
    build(:user, email: shorter_name).should be_valid
  end


  it { should belong_to(:user) }

  it { should belong_to(:project) }
end
