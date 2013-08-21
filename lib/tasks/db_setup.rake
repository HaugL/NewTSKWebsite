namespace :db do
  desc "SetUp initial DB values"
  task :init_setup => :environment do
    Day.create(:id => 0, :name => "Sunday");
    Day.create(:id => 1, :name => "Monday");
    Day.create(:id => 2, :name => "Tuesday");
    Day.create(:id => 3, :name=> "Wednesday");
    Day.create(:id => 4, :name => "Thursday");
    Day.create(:id => 5, :name => "Friday");
    Day.create(:id => 6, :name => "Saturday");
  end

end