require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class Users
    def self.find_by_id(id)
      user = QuestionsDatabase.instance.execute(<<-SQL, id)

      SELECT
        *
      FROM
        users
      WHERE
        id = ?  
      SQL
      
      return nil unless user.length > 0
      Users.new(user.first)
    end

    def self.find_by_name(fname, lname)
      user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)

      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ? 
      SQL
      
      return nil if user.nil? 
      Users.new(user)
    end


    attr_accessor :id, :fname, :lname

    def initialize(options)
      @id = options['id']
      @fname = options['fname']
      @lname = options['lname']
    end

    def authored_questions
      Questions.find_by_author_id(id)
    end 

    def authored_replies
        Replies.find_by_user_id(id)
    end

end

