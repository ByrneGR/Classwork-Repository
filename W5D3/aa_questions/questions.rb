require_relative 'questions_database'
require_relative 'replies'
require_relative 'question_follows'
require_relative 'question_likes'
require_relative 'users'


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
    
