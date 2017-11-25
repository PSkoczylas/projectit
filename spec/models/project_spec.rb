require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project) { build(:project) }

  it "has a valid factory" do
    project.should be_valid
  end

  it "name has most 255 characters" do
    longer_name = "m" * 252 + "@a.c"
    build(:user, email: longer_name).should_not be_valid
    shorter_name = "m" * 251 + "@a.c"
    build(:user, email: shorter_name).should be_valid
  end

  it "name has exist" do
    should validate_presence_of(:name)
  end

  it "name should has maximum length" do
    build(:project, name: "q" * 255).should be_valid
    build(:project, name: "q" * 256).should_not be_valid
  end

  it { should have_many(:users).through(:user_projects) }

  it { should have_many(:tasks) }

  it "should remove tasks after remove project" do
    project.save
    create(:task, project_id: project.id)
    expect { project.destroy }.to change { Task.count }.by(-1)
  end

end
