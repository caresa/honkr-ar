class Initialsetup < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
    end

    create_table :honks do |t|
      t.belongs_to :user
      t.string :content
    end

  end


end
