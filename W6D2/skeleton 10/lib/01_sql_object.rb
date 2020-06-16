require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns_arr.nil?
      columns_arr = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      SQL
      @columns_arr = columns_arr[0].map {|ele| ele.to_sym}
    else  
      @columns_arr
    end
  end

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}") do 
        self.attributes[column]
      end
      define_method("#{column}=") do |new_value|
        self.attributes[column] = new_value
      end 
    end 
  end

  def self.table_name=(table_name)
      table_name
  end

  def self.table_name
      return "#{self.to_s.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
