require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it { expect(FactoryBot.build(:user)).to be_valid }

  describe "associations" do
    it { should have_many(:gifs) }
  end

  describe "gifs attachment" do
    before do
      @user = FactoryBot.create(:user, :with_gifs)
    end

    it { expect(@user.gifs.count).to eq 1 }
  end
end
