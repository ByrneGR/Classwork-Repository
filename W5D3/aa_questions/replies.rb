require_relative 'questions_database'
require_relative 'questions'
require_relative 'question_follows'
require_relative 'question_likes'
require_relative 'users'

class Replies
     def self.find_by_id(id)
      question_reply = QuestionsDatabase.instance.execute(<<-SQL, id)

      SELECT
        *
      FROM
        Replies
      WHERE
        id = ?  
      SQL
      
      return nil unless question_reply.length > 0
      Replies.new(question_reply.first)
    end

    def self.find_by_user_id(author_id)
      question_reply = QuestionsDatabase.instance.execute(<<-SQL, author_id)

      SELECT
        *
      FROM
        Replies
      WHERE
        author_id = ?  
      SQL
      
      return nil unless question_reply.length > 0
      Replies.new(question_reply.first)

    end  

    def self.find_by_question_id(question_id)
      question_reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)

      SELECT
        *
      FROM
        Replies
      WHERE
        question_id = ?  
      SQL

      return nil unless question_reply.length > 0
      Replies.new(question_reply.first)
      
    end  

    attr_accessor :id, :question_id, :author_id, :parent_reply_id, :body

    def initialize(options)
      @id = options['id']
      @question_id = options['question_id']
      @author_id = options['author_id']
      @parent_reply_id = options['parent_reply_id']
      @body = options['body']
    end

    def author
        Users.find_by_id(author_id)
    end

    def question
        Questions.find_by_id(question_id)
    end

    def parent_reply
        Replies.find_by_id(parent_reply_id)
    end

    # def child_reply
    #     Replies.find_by_id(self.parent_reply)
    # end

    def child_replies(parent_reply_id)
        question_reply = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        ( SELECT id FROM replies WHERE parent_reply_id = ?)
        SQL
        Replies.find_by_id(question_reply)
    end
end
