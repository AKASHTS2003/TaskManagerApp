class Task < ApplicationRecord
    validates :name, presence: true
    validates :deadline, presence: true
    #validates :description, presence: true, length: { minimum: 20 }
    validates :deadline, comparison: { greater_than_or_equal_to: Date.today }

    #To assign options in integer value
    enum :status, {
        open: 0, 
        inprogress: 1, 
        completed: 2 
    }
    #Assign user email to task
    belongs_to :user, optional: true

end
