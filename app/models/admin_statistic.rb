class AdminStatistic < ApplicationRecord
    EVENTS = {
        total_users: "TOTAL_USERS",
        total_questions: "TOTAL_QUESTIONS"
    }


    # Scopes
    scope :total_users, -> {
        find_by_event(EVENTS[:total_users]).value
    }
  
    scope :total_questions, -> {
        find_by_event(EVENTS[:total_questions]).value
    }


    # Class Methods
    def self.set_event(event)
        admin_statistics = AdminStatistic.find_or_create_by(event: event)
        admin_statistics.value += 1
        admin_statistics.save
    end
end
