# crystalkemal-crecto-sample
I use Postico to manage my postgresql database since I'm using Mac Os.
#Create a database. I called mine "kemal".

#Then I created the users table in SQL with all the columns required.
My Crecto model is oversimplified :
Class User < Crecto::Model
      schema "users" do
        field :name, String
      end
      validate_required [:name]
      validate_format :name, /^[a-zA-Z]*$/
    end
    
 #Then :
 In your users table, you have to create two columns :
 created_at of type timestamp,
 updated_at of type timestamp
 
 #I will improve the code. It is my first iteration. 
 
