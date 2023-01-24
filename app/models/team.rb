class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users
  has_many :team_projects
  has_many :projects, through: :team_projects
end
