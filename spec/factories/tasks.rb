FactoryBot.define do
  factory :task do
    project { nil }
    name { "MyString" }
    notes { "MyString" }
    start_on { "2023-01-24 17:39:48" }
    due_on { "2023-01-24 17:39:48" }
    due_at { "2023-01-24 17:39:48" }
    assignee { 1 }
    status { "MyString" }
  end
end
