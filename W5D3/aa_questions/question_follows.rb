require_relative 'questions_database'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_likes'
require_relative 'users'

class Question_follows
     def self.find_by_id(id)
      question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)

      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?  
      SQL
      
      return nil unless question_follow.length > 0
      Question_follows.new(question_follow.first)
    end

    attr_accessor :id, :user_id, :question_id

    def initialize(options)
      @id = options['id']
      @user_id = options['user_id']
      @question_id = options['question_id']
    end
end