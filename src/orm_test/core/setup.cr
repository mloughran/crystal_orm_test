module OrmTestCore
  extend self

  class User
    include Core::Schema
    include Core::Query

    schema :users do
      primary_key :id

      field :name, String
      field :orm, String
      field :created_at, Time, db_default: true
      field :updated_at, Time, db_default: true
    end
  end

  DB = PG.connect("postgres://#{DATABASE[:user]}@#{DATABASE[:host]}/#{DATABASE[:name]}")
  Repo = Core::Repository.new(DB)

  # INSERT INTO users(name) VALUES(whatever)
  def simple_insert
    u = User.new(name: "CoreGuy #{rand(10_000)}", orm: "core")
    Repo.insert(u)
  end
  
  # SELECT * FROM users WHERE orm = 'core' ORDER BY id ASC
  # Map all of the names in to an array
  def simple_select
    Repo.query(User.where(orm: "core").order_by("id", :ASC)).map(&.name)
  end
end
