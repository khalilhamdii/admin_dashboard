class AddAdmin < ActiveRecord::Migration[6.0]
  def change
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
