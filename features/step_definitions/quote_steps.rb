Given /^the following quote records$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
     Quote.create!(hash)
   end
end
