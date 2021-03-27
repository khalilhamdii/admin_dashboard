# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :full_name
      t.string :phone_number
      t.string :company_name
      t.string :company_address
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :admin_role, default: false
      t.boolean :user_role, default: true
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    # Initialize first account:
    User.create! do |u|
      u.full_name = 'Test User'
      u.company_name = 'ZendMind Studio'
      u.company_address = 'India'
      u.phone_number = '+21650616873'
      u.email     = 'user@user.com'
      u.password    = 'password'
  end

  User.create! do |u|
    u.full_name = 'Admin'
    u.phone_number = '+21650616873'
    u.company_name = 'ZendMind Studio'
    u.company_address = 'India'
    u.email     = 'admin@admin.com'
    u.password  = 'password'
    u.admin_role = true
end
  end
end
