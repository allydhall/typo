Given /the following articles exist/ do |table|
  table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following comments exist/ do |table|
  table.hashes.each do |comment|
    Comment.create!(comment)
  end
end
