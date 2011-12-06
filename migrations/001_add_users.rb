#migrations/001_add_users.rb

Sequel.migration do
  up do
    create_table(:users) do 
      primary_key   :id
      String        :email,       :size => 100,     :null => false
      DateTime      :created_at,  :null => false
      DateTime      :updated_at,  :null => false
      TrueClass     :enabled,     :null => false,   :default => true  
    end
  end
  
  down do
    drop_table(:users)
  end
end