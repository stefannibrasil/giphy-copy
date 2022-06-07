FactoryBot.define do
  factory :gif do
    user
    image { ::Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/test_image.gif", "image/gif") }

    trait :invalid_size do
      image { ::Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/ted_lasso.gif", "image/gif") }
    end

    trait :invalid_format do
      image { ::Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/ted_lasso.jpeg", "image/jpeg") }
    end
  end
end
