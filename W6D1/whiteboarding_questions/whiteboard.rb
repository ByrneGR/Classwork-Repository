#Partner A
#disadvantages of adding an index to a table column in a database

#takes up more space

add_index :table_name, :column_name

# Indices do have a cost. They make writes (`INSERT`s, `DELETE`s, and
# `UPDATE`s) a little more taxing because the index table must also be updated.

# == Schema Information
#
# Table name: users
#
#  id   :integer                not null, primary key
#  name :string                 not null


# Table name: enrollments
#
#  id   :integer                not null, primary key
#  course_id :integer           not null
#  student_id :integer          not null


# Table name: courses
#
#  id   :integer                not null, primary key
#  course_name :string          not null
#  professor_id :integer        not null
#  prereq_course_id :integer    not null


#write all the belongs to and has many associations for the models (user, enrollment, course)

a user has many courses
a course has many users
an enrollment belongs to a student
an enrollment belongs to a course

all the tables with a foreign key have a belongs to and a corresponding has_many

User
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :courses_taught,
    primary_key: :id,
    foreign_key: :professor_id,
    class_name: :Course,
    optional: :true


Enrollment
  belongs_to :student,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
    
Course  
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment  

  belongs_to :professor,
    primary_key: :id,
    foreign_key: :professor_id,
    class_name: :User  
    
  belongs_to :prereq_course,
    primary_key: :id,
    foreign_key: :prereq_course_id,  
    class_name: :Course,
    optional: :true


Question 3
# Given all possible SQL commands order by order of query execution.
(SELECT, DISTINCT, FROM, JOIN, WHERE, GROUP BY, HAVING, LIMIT/OFFSET, ORDER)

SELECT 

DISTINCT

FROM and JOINS

WHERE

GROUP BY

HAVING 

ORDER

LIMIT/OFFSET


1. FROM and JOINs
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / OFFSET

Question 4
# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string


1.  In which years was the Physics prize awarded, but no Chemistry prize?

SELECT DISTINCT
  yr
FROM
  nobels
WHERE
  subject = 'Physics' AND yr NOT IN (SELECT
  yr
FROM
  nobels
WHERE
  subject = 'Chemistry')


Question 5
  What is the purpose of a database migration?

  -Good for collaboration
  -Keeps a clean ledger of the changes made, so you know the history of a project
  -To make and save changes to tables in a database

  A migration is a file containing Ruby code that describes a set of
changes to be applied to a database. It may create or drop tables as well as add
or remove columns from a table.

Question 6
  What is the difference between Database Constraints and Active Record
Validations?

  -A constraint is user-facing and helps control user-input (ex: not letting someone take a username that is already taken)
  -A validation keeps the database clean and running smoothly (ex: if certain id's weren't always unique, the associations wouldn't work properly and the database would be useless)


  **Validations** are defined inside **models**. Model-level
validations live in the Rails world. Since we write them in Ruby, they are very
flexible, database agnostic, and convenient to test, maintain and reuse.
Validations are run whenever we `save` or `update` a model. **Constraints** are
defined inside **migrations** and operate on the database. Constraints throw
hard nasty errors whenever something that shouldn't be inputted into our
database tries to get in there.

Question 7


# == Schema Information
#
# Table name: user
#
#  id   :integer          not null, primary key
#  name :string           not null


# Table name: score
#
#  id   :integer           not null, primary key
#  number :integer         not null
#  user_id :integer        not null
#  game_id :integer        not null


# Table name: game
#
#  id   :integer           not null, primary key
#  name :string            not null
#  game_maker_id :integer  not null


# Given the following table write all the `belongs_to` and `has_many` associations
# for models based on the below table (`User`, `Game`, and `Score`)

class User < ApplicationRecord
  has_many :scores,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Score
   
  has_many :games_made,
    primary_key: :id,
    foreign_key: :game_maker_id,
    class_name: :Game,
    optional: :true

class Score < ApplicationRecord  
  belongs_to :gamer,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :game,
    primary_key: :id,
    foreign_key: :game_id,
    class_name: :Game

class Game < ApplicationRecord  
  has_many :scores,
    primary_key: :id,
    foreign_key: :game_id,
    class_name: :Score

  belongs_to :game_maker,
    primary_key: :id,
    foreign_key: :game_maker_id,
    class_name: :User  

#Partner B

employees table belong to a single department
departments table

select
employees.name
from
employees
join
departments on employees.id = departments.employee_id
where
departments.name = ?

select
employees.name
from
employees
join
departments on employees.id = departments.employee_id
where
departments = nil #employees.department_id IS NULL;

primary key, the key is uniqe to a table. that could identify the primary element in that table.
and a foreign key is a id or a unique key that is a primary key of another table.


**Answer**: A primary key uniquely identifies a record in the relational
database table, whereas a foreign key refers to the `id` column which is the
primary key of **another** table.

Question 3

# == Schema Information
#
# Table name: physicians
#
#  id   :integer          not null, primary key
#  name :string           not null


# Table name: appointments
#
#  id   :integer           not null, primary key
#  physician_id :integer   not null
#  patient_id :integer     not null


# Table name: patients
#
#  id   :integer           not null, primary key
#  name :string            not null
#  primary_physician_id :integer


class Physician < ApplicationRecord
    has_many :appointments,
        primary_key: :id,
        foreign_key: :physician_id,
        class_name: :Appointment

    has_many :primary_patients,
        primary_key: :id,
        foreign_key: :primary_physician_id,
        class_name: :Patient

    has_many :patients,
        through: :appointments,
        source: :patient

    has_many :primary_patient_appointment,
        through: :primary_patients,
        source: :appointments
end

class Appointment < ApplicationRecord
    belongs_to :physician,
        primary_key: :id,
        foreign_key: :physician_id,
        class_name: :Physician

    belongs_to :patient,
        primary_key: :id,
        foreign_key: :patient_id,
        class_name: :Patient

end

class Patient < ApplicationRecord
    has_many :appointments,
        primary_key: :id,
        foreign_key: :patient_id,
        class_name: :Appointment

    belongs_to :primary_physician,
        primary_key: :id,
        foreign_key: :primary_physician_id,
        class_name: :Physician

    has_many :physicians,
        through: :appointments,
        source: :physician
end


object relational model

advantages are is that we could create models that directly relates to a table we have created.
so that we could quickly reference the table and get the data from the model we created.

Using an ORM (Object Relational Model) allows you to interact with
database information in an OOP way.

An ORM like ActiveRecord will translate rows
from your SQL tables into Ruby objects on fetch, and translates your Ruby
objects back to rows on save resulting in less overall database access code.



# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer


# 1.  List the films where 'Harrison Ford' has appeared - but not in the star
#     role.
#     - **Note:** the `ord` field of casting gives the position of the actor. If
#       `ord=1` then this actor is in the starring role



select
    movies.title
from
    movies
join
    castings on movies.id = castings.movie_id
join
    actors on castings.actor_id = actors.id
where
    actors.name = 'Harrison Ford'
and
    castings.ord != 1


# 2.  Obtain a list in alphabetical order of actors who've had at least 15
#     starring roles.

select
    actors.name
from
    actors
join
    castings on actors.id = castings.actor_id
where
    castings.ord = 1
group by
    actors.name
having
    count(*) >= 15
order by
    actors.name;


Identify the difference between a `has_many through` and a `has_one`
association?


**Answer**: We use `has_many` when a record holds a column (the primary key)
that is referred to by a foreign key in the associated records. `has_one` is a
`has_many` association where at most one associated record will exist so we will
only return a single instance of the model.