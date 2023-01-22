class Project < ApplicationRecord

  acts_as_paranoid
  belongs_to :user

  include AASM


  aasm timestamps: true do
    state :pending, initial: true
    state :unstarted, :in_progress, :completed

    event :unstart do
      transitions from: :pending, to: :unstarted
    end

    event :progress do
      transitions from: :unstarted, to: :in_progress
    end

    event :complete do
      transitions from: :in_progress, to: :completed
    end
  end
end
