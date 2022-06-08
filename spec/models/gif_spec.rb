require 'rails_helper'

RSpec.describe Gif, type: :model do
  subject { FactoryBot.build(:gif) }

  it { expect(FactoryBot.build(:gif)).to be_valid }

  # describe "associations" do
  #   it { should belong_to(:user) }
  # end

  describe "image validations" do
    it "is valid with a size less than 1MB and is a GIF file" do
      expect(subject).to be_valid
    end

    context "with invalid images" do
      it "is invalid with a size bigger than 1 MB" do
        gif = FactoryBot.build(:gif, :invalid_size)
        gif.valid?
        expect(gif.errors[:image]).to include("is too big")
      end

      it "is invalid with a format that is not GIF" do
        gif = FactoryBot.build(:gif, :invalid_format)
        gif.valid?
        expect(gif.errors[:image]).to include("must be a GIF file")
      end
    end
  end
end
