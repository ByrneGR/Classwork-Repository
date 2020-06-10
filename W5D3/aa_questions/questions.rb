require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions
    def self.find_by_id(id)
      question = QuestionsDatabase.instance.execute(<<-SQL, id)

      SELECT
        *
      FROM
        questions
      WHERE
        id = ?  
      SQL
      
      return nil unless question.length > 0
      Questions.new(question.first)
    end

    def self.find_by_author_id(author_id)
      question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?  
      SQL
      
      return nil unless question.length > 0
      Questions.new(question.first)
    end  

    attr_accessor :id, :title, :body, :author_id

    def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @author_id = options['author_id']
    end

    def author
        Users.find_by_id(author_id)
    end

    def replies
        Replies.find_by_question_id(id)
    end
end
    
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




