class Task < ApplicationRecord
    validates :name, presence: true
    validates :deadline, presence: true
    #validates :description, presence: true, length: { minimum: 20 }
    validates :deadline, comparison: { greater_than_or_equal_to: Date.today }

    enum :status, {
        open: 0, 
        inprogress: 1, 
        completed: 2 
    }

end
