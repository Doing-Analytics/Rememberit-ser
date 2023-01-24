class Project < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  has_many :team_projects
  has_many :teams, through: :team_projects

  include AASM

  aasm timestamps: true do
    state :pending, initial: true
    state :unstarted, :in_progress, :completed

    event :unstart do
      transitions from: :pending, to: :unstarted
    end

    event :progress do
      transitions from: :unstarted, to: :in_progress, after: :set_process_time
    end

    event :complete do
      transitions from: :in_progress, to: :completed, after: :set_complete_time
    end
  end

  private

  def set_process_time
    update(progress_in: Time.current)
  end

  def set_complete_time
    update(completed_at: Time.current)
  end
end
